FROM circleci/python:2.7.14-jessie

USER root

RUN apt-get install wget java-common gnupg2 -y
RUN echo "oracle-java11-installer shared/accepted-oracle-license-v1-2 select true" | debconf-set-selections
RUN echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu bionic main" | tee /etc/apt/sources.list.d/linuxuprising-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends oracle-java11-installer && apt-get clean all

COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
