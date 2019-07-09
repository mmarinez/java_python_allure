FROM circleci/python:2.7.14

RUN sudo apt-get install -q -y openjdk-8-jre-headless \
    libev4 libev-dev libpq-dev libldap2-dev libsasl2-dev libssl-dev

COPY allure-2.0.1.tgz /
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
