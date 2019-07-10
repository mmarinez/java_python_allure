FROM circleci/python:2.7.14-jessie

USER root

RUN apt-get -y update && apt-get install -y -t jessie-backports ca-certificates-java \
&& apt-get -y install openjdk-8-jdk && update-alternatives --config java


COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
