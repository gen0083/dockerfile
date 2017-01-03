FROM ubuntu:16.04

MAINTAINER gen0083

# Install sudo
RUN apt-get update \
  && apt-get -y install sudo \
  && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# Install 32bit lib
RUN sudo apt-get -y install lib32stdc++6 lib32z1

# Install Java8
RUN apt-get install -y software-properties-common curl \
    && add-apt-repository -y ppa:openjdk-r/ppa \
    && apt-get update \
    && apt-get install -y openjdk-8-jdk

# Download Android SDK
RUN sudo apt-get -y install wget \
  && cd /usr/local \
  && wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz \
  && tar zxvf android-sdk_r24.4.1-linux.tgz \
  && rm -rf /usr/local/android-sdk_r24.4.1-linux.tgz

# Environment variables
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANDROID_SDK /usr/local/android-sdk-linux
ENV PATH $ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

RUN apt-get install -y git
RUN mkdir $ANDROID_HOME/licenses
ADD start-emulator /usr/local/bin/
ADD wait-for-emulator /usr/local/bin/
ADD android-sdk-license $ANDROID_HOME/licenses/android-sdk-license

# Support Gradle
ENV TERM dumb
ENV GRADLE_OPTS '-Dorg.gradle.jvmargs="-Xmx2048m -XX:+HeapDumpOnOutOfMemoryError"'

# update android sdk
RUN echo y | android update sdk --no-ui --all --filter "tools"
RUN echo y | android update sdk --no-ui --all --filter "platform-tools"
RUN echo y | android update sdk --no-ui --all --filter "android-19,sys-img-armeabi-v7a-android-19"
RUN echo no | android create avd --force -n test -t android-19 --abi armeabi-v7a
RUN echo y | android update sdk --no-ui --all --filter "extra-android-m2repository"
RUN echo y | android update sdk --no-ui --all --filter "extra-google-google_play_services"
RUN echo y | android update sdk --no-ui --all --filter "extra-google-m2repository"
