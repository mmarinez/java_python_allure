FROM korekontrol/ubuntu-java-python2
    
COPY allure-2.0.1.tgz /
RUN apt-get install libxml2-dev libxslt-dev libffi-dev gcc musl-dev openssl-dev curl
RUN apt-get install jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev
RUN apt-get install tar \
    && tar -xvf allure-2.0.1.tgz \
    && chmod -R +x /allure-2.0.1/bin
    
ENV PATH="/allure-2.0.1/bin:${PATH}"

WORKDIR /
