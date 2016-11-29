FROM centos:6

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
# PostgreSQL
# ============

RUN yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm && \ 
	yum install -y postgresql96 postgresql96-server

ENV PGDATA=/var/lib/pgsql/data

RUN mkdir -p ${PGDATA} && chown postgres ${PGDATA}
RUN echo "host all  all    0.0.0.0/0  md5" >> ${PGDATA}/pg_hba.conf
RUN echo "listen_addresses='*'" >> ${PGDATA}/postgresql.conf

ADD ./smartstab_user_init.sql ${PGDATA}

# setup
RUN service postgresql-9.6 initdb &&\ 
	service postgresql-9.6 start &&\
	su postgres -c "psql -f ${PGDATA}/smartstab_user_init.sql"

# ============
# Smartstab
# ============
ADD ./smart-stub.jar ${APPDIR}
ADD ./init ${APPDIR}

EXPOSE 5432

# ENTRYPOINT  ["/bin/bash", "/usr/smartstab/init"]
CMD  ["/bin/bash"]
