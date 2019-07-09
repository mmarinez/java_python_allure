FROM circleci/python:2.7.14

RUN sudo su -c "echo 'deb http://http.debian.net/debian jessie-backports main' >> /etc/apt/sources.list" \
    && sudo apt-get update && sudo apt-get install openjdk-8-jdk \
    && sudo update-alternatives --config java

COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
