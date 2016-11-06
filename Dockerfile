FROM node:7
MAINTAINER Mariusz Chwalba <mariusz@chwalba.net>

RUN echo "\033[0;34m*** Installing packages\033[0m" \
&&  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
&&  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
&&  apt-key adv -q --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 >/dev/null \
&&  apt-get update >/dev/null \
&&  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
&&  apt-get install -yq oracle-java8-installer oracle-java8-set-default ant zip unzip >/dev/null 

ENV NPM_CONFIG_LOGLEVEL warn
RUN echo "\033[0;34m*** Installing crosswalk\033[0m" \
&&  npm i -g crosswalk-app-tools >/dev/null 

RUN echo "\033[0;34m*** Installing android SDK\033[0m" \
&&  wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz \
&&  tar xzf android-sdk_r24.4.1-linux.tgz \
&&  rm -f android-sdk_r24.4.1-linux.tgz

ENV ANDROID_HOME /android-sdk-linux/
ENV PATH $PATH:/android-sdk-linux/tools/

RUN echo "\033[0;34m*** Installing android build targets\033[0m" \
&&  echo "y" | android update sdk -u -a -t 1,2,3,4,5,6,7,8,9,10,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,128,129,130,131,132,134,135,136,137 \
&&  cd /android-sdk-linux/ && unzip -q temp/tools_r25.2.2-linux.zip

RUN apt-get install -y libav-tools

WORKDIR /app
CMD ["crosswalk-pkg","help"]
