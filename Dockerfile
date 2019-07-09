FROM korekontrol/ubuntu-java-python2
    
COPY allure-2.0.1.tgz /

RUN apt-get install -y --fix-missing \
    python-dev python-pip python-setuptools \
    libffi-dev libxml2-dev libxslt1-dev \
    libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev \
    liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
        
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
