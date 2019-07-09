FROM korekontrol/ubuntu-java-python2
    
# Allure
RUN \
    apt-get install -y software-properties-common \
    && apt-add-repository -y ppa:yandex-qatools/allure-framework \
    && apt-get update \
    && apt-get -y install allure-commandline


WORKDIR /
