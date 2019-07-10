FROM circleci/java:8-jdk

USER root

RUN apt-get update

RUN apt-get install python

RUN apt-get build-dep python-imaging
RUN apt-get install libjpeg62 libjpeg62-dev

COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
