FROM centos:7

RUN yum -y update; \
    yum -y install yum-utils epel-release httpd
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php74
RUN yum -y install php php-common

EXPOSE 8080
COPY index.php /var/www/html/index.php
COPY index.html /var/www/html/index.html
COPY httpd.conf /etc/httpd/conf/httpd.conf

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
