FROM node:7
MAINTAINER Mariusz Chwalba <mariusz@chwalba.net>

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
&&  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
&&  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
&&  apt-get update \
&&  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
&&  apt-get install -y oracle-java8-installer oracle-java8-set-default ant zip unzip

RUN npm i -g crosswalk-app-tools

RUN wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar xzvf android-sdk_r24.4.1-linux.tgz && \
    rm -f android-sdk_r24.4.1-linux.tgz

ENV ANDROID_HOME /android-sdk-linux/
ENV PATH $PATH:/android-sdk-linux/tools/

RUN echo "y" | android update sdk -u -a -t 1,2,3,4,5,6,7,8,9,10,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,128,129,130,131,132,134,135,136,137

RUN cd /android-sdk-linux/ && unzip temp/tools_r25.2.2-linux.zip
