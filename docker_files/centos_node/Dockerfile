FROM centos:7

MAINTAINER Bogdan Snisar

ENV PGENGIN=/usr/pgsql-9.6
ENV PGDATA=/var/lib/pgsql/data

RUN yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm && \ 
	yum install -y postgresql96 postgresql96-server wget

# env directories
RUN mkdir -p ${PGDATA} && chown postgres ${PGDATA} && mkdir /app

# db engine setup
RUN su -c  "${PGENGIN}/bin/initdb -E 'UTF-8' -D ${PGDATA} --lc-collate='en_US.UTF-8' --lc-ctype='en_US.UTF-8'" postgres
# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> ${PGDATA}/pg_hba.conf
# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> ${PGDATA}/postgresql.conf

# db setup
ADD ./smartstab_user_init.sql ${PGDATA}
ADD ./smartstab-db-setup ${PGDATA}
RUN ${PGDATA}/smartstab-db-setup

# Install Java8
RUN wget --no-cookies --no-check-certificate -q \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
   "http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm" && \
	yum localinstall -y jdk-8u102-linux-x64.rpm && \
	rm -f jdk-8u102-linux-x64.rpm

EXPOSE 5432

CMD ["/bin/bash"]
