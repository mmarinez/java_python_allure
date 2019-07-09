FROM circleci/python:2.7.14

RUN sudo su -c "echo 'deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main' > /etc/apt/sources.list.d/jessie.list"
RUN sudo su -c "echo 'deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list"
RUN sudo su -c sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN sudo apt-get -o Acquire::Check-Valid-Until=false update

RUN sudo apt-get update && sudo apt-get install openjdk-8-jdk \
    && sudo update-alternatives --config java

COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
