FROM ubuntu
MAINTAINER Brandon Grantham <brandon.grantham@anaplan.com>


RUN apt-get -qq update
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -qq update
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -qqy install oracle-java6-installer
RUN update-alternatives --display java

ADD ./scripts/  /opt/boomi/

RUN echo export PATH=/usr/lib/jvm/java-6-oracle/jre/bin:$PATH >> /root/.profile
RUN chmod 775 /opt/boomi/*
RUN sh /opt/boomi/chgJava.sh


