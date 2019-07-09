FROM korekontrol/ubuntu-java-python2
    
COPY allure-2.0.1.tgz /

RUN apk add \
    build-base \
    jpeg-dev \
    zlib-dev
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
