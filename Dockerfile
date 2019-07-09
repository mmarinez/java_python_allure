FROM circleci/python:2.7.14

USER root
RUN apt-get -y install default-jre
RUN apt-get install -y software-properties-common python-software-properties

RUN apt-get -y -q update && \
    apt-get -y -q upgrade && \
    apt-get -y -q install software-properties-common htop && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get -y -q update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get -y -q install oracle-java8-installer && \
    update-java-alternatives -s java-8-oracle

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
