FROM korekontrol/ubuntu-java-python2
    
# Allure
RUN \
    sudo apt-get install -y software-properties-common \
    && sudo apt-add-repository -y ppa:yandex-qatools/allure-framework \
    && apt-get update \
    && sudo apt-get -y install allure-commandline


WORKDIR /
