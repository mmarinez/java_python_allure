FROM circleci/python:2.7.14

# Setup oracle java 8
RUN sudo mkdir /opt/jdk

WORKDIR /opt

RUN sudo wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz

RUN sudo tar -zxf jdk-8u161-linux-x64.tar.gz -C /opt/jdk

RUN sudo update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_161/bin/java 100
RUN sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_161/bin/javac 100


# Allure
RUN \
    sudo apt-get install -y software-properties-common \
    && sudo apt-add-repository -y ppa:yandex-qatools/allure-framework \
    && apt-get update \
    && sudo apt-get -y install allure-commandline

#### Clean up 
RUN apt-get clean


WORKDIR /