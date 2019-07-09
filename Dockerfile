FROM circleci/python:2.7.14

RUN sudo apt-get install -y  software-properties-common && \
    sudo add-apt-repository ppa:webupd8team/java -y && \
    sudo apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    sudo apt-get install -y oracle-java8-installer && \
    sudo apt-get clean


COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
