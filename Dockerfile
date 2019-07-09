FROM circleci/python:2.7.14

# Java
RUN \
    apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && apk add --no-cache --virtual=build-dependencies unzip \
    && apk add --no-cache curl \
    && apk add --no-cache openjdk8-jre
    
# Allure
RUN \
    sudo apt-get install -y software-properties-common \
    && sudo apt-add-repository -y ppa:yandex-qatools/allure-framework \
    && apt-get update \
    && sudo apt-get -y install allure-commandline

#### Clean up 
RUN apt-get clean


WORKDIR /
