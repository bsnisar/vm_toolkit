FROM centos:7

MAINTAINER Bogdan Snisar

ENV DB_NAME=smartstab
ENV DB_USER=smartstab
ENV DB_BIN=/usr/pgsql-9.6/

RUN yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm \ 
	&& yum install -y postgresql96 postgresql96-server


# Postgresql env variable
# Specifies the directory where the database cluster is to be stored
ENV PGDATA=/var/lig/pgsql/data

RUN mkdir -p ${PGDATA} \ 
	&& chown postgres ${PGDATA}

RUN su -c "${DB_BIN}/bin/initdb \ 
	-E 'UTF-8' \
	-D ${PGDATA} \
	--lc-collate='en_US.UTF-8' \ 
	--lc-ctype='en_US.UTF-8'" \ 
	postgres

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
# RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
# RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf


CMD ["/bin/bash"]