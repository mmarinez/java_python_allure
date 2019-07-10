FROM circleci/python:2.7.14-jessie

USER root

# Java 8
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# Gradle
RUN echo "deb http://ppa.launchpad.net/cwchien/gradle/ubuntu trusty main" | tee /etc/apt/sources.list.d/cwchien-gradle.list
RUN echo "deb-src http://ppa.launchpad.net/cwchien/gradle/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/cwchien-gradle.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9D06AF36

# Update the container
RUN apt-get update --fix-missing && apt-get dist-upgrade -y

# Install Java 8/Gradle
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer oracle-java8-set-default gradle
COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
