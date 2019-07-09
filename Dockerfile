FROM circleci/python:2.7.14

# Java
RUN \
    sudo apt-get update \
    && sudo apt-get upgrade \
    && sudo apt-get add --no-cache bash \
    && sudo apt-get add --no-cache --virtual=build-dependencies unzip \
    && sudo apt-get add --no-cache curl \
    && sudo apt-get add --no-cache openjdk8-jre
    
# Allure
RUN \
    sudo apt-get install -y software-properties-common \
    && sudo apt-add-repository -y ppa:yandex-qatools/allure-framework \
    && apt-get update \
    && sudo apt-get -y install allure-commandline

#### Clean up 
RUN apt-get clean


WORKDIR /
