docker-jdk-1.6
==============

Docker build with jdk1.6 for Boomi. Also, includes Boomi shell script

#Ubuntu image with Oracle Java 1.6_45 and Boomi atom intallation script

Boomi requires that Sun/Oracle Java 1.6_45 be used for a local atom. It is also required that the symbolic link from /usr/local/java be eliminated and the export command used to point to the hard link for java. 

See the script files. 

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
