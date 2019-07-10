FROM circleci/python:2.7.14-jessie

USER root

RUN apt-get update && \
 apt-get -y upgrade && \
 echo 'deb http://ftp.de.debian.org/debian sid main' >> '/etc/apt/sources.list' && \
 apt-get -y update && \
 mkdir -p /usr/share/man/man1 && \
 apt-get -y install openjdk-12-jre-headless

COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
