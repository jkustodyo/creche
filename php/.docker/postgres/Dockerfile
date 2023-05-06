# https://medium.com/@vhsilva.ap/configurando-laravel-6-nginx-e-postgresql-com-docker-9ad29c53d5

# https://www.baeldung.com/ops/postgresql-docker-setup

FROM centos:7

COPY startUpScript.sh /

RUN yum install -y epel-release maven wget net-tools \
&& yum clean all \
&& yum install -y  https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
&& yum install -y postgresql11-server postgresql11-contrib \
&& chown root /startUpScript.sh \
&& chgrp root /startUpScript.sh \
&& chmod 777 /startUpScript.sh \
&& mkdir /temp \
&& ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '127*'  > ip_db

CMD ["/bin/bash","-c","/startUpScript.sh && tail -f /dev/null"]

