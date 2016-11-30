FROM centos:7

MAINTAINER epam.com

ENV APPDIR=/usr/smartstab

RUN yum install -y wget \
	&& mkdir ${APPDIR}

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
ADD ./smart-stub.jar ${APPDIR}
ADD ./init ${APPDIR}
RUN mkdir ${APPDIR}/logs

EXPOSE 5432

ENTRYPOINT  ["/bin/bash", "/usr/smartstab/init"]