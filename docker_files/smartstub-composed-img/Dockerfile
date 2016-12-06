FROM centos:7

MAINTAINER epam.com

ENV APPDIR=/usr/smartstab
ENV APPCFG=/usr/smartstab/config

RUN yum install -y wget \
	&& mkdir ${APPDIR} && mkdir ${APPCFG}

# ============
# Oracle Java 8
# ============

RUN wget --no-cookies --no-check-certificate -q \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
   "http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm" && \
	yum localinstall -y jdk-8u102-linux-x64.rpm && \
	rm -f jdk-8u102-linux-x64.rpm

# ============
# Smartstab
# ============
ADD ./smartstub-init ${APPDIR}

# SpringApplication will load properties from application.properties files
# A /config subdirectory of the current working directory directory 
# This external props will override application properties packaged inside jar
ADD ./application.properties ${APPCFG}
WORKDIR ${APPDIR}

EXPOSE 8080
EXPOSE 9090

ADD ./smart-stub.jar ${APPDIR}

ENTRYPOINT ["/bin/bash", "/usr/smartstab/smartstub-init"]