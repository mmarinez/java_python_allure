FROM korekontrol/ubuntu-java-python2
    
# Allure
RUN apt-get update && \
	apt-ge add ca-certificates && \
	update-ca-certificates && \
	apt-ge add openssl && \
	apt-ge add unzip

RUN wget https://dl.bintray.com/qameta/generic/io/qameta/allure/allure/2.0.0/allure-2.0.0.tgz
RUN unzip allure-commandline.zip -d /allure
RUN rm allure-commandline.zip
ENV PATH="/allure/bin:${PATH}"


WORKDIR /
