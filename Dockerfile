FROM node:7
MAINTAINER Mariusz Chwalba <mariusz@chwalba.net>

RUN apt-get update && \
    apt-get install -y openjdk-7-jdk ant zip unzip

RUN npm i -g crosswalk-app-tools

RUN wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar xzvf android-sdk_r24.4.1-linux.tgz && \
    rm -f android-sdk_r24.4.1-linux.tgz

ENV ANDROID_HOME /android-sdk-linux/
ENV PATH $PATH:/android-sdk-linux/tools/

RUN echo "y" | android update sdk -u -a -t 1,2,3,4,5,6,7,8,9,10,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,128,129,130,131,132,134,135,136,137

RUN cd /android-sdk-linux/ && unzip temp/tools_r25.2.2-linux.zip
