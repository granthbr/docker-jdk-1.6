FROM ubuntu
MAINTAINER Brandon Grantham <brandon.grantham@anaplan.com>


RUN sudo apt-get -qq update
RUN sudo apt-get install software-properties-common python-software-properties
RUN sudo add-apt-repository -y ppa:webupd8team/java
RUN sudo apt-get -qq update
RUN sudo echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN sudo apt-get -qqy install oracle-java6-installer
RUN sudo update-alternatives --display java

ADD ./scripts/  /opt/boomi/

RUN sudo echo export PATH=/usr/lib/jvm/java-6-oracle/jre/bin:$PATH >> /root/.profile
RUN sudo chmod 775 /opt/boomi/*
RUN sudo sh /opt/boomi/chgJava.sh


