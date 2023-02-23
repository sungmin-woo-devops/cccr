FROM centos:7
MAINTAINER Sungmin Woo <sungminwoo.devops@gmail.com>

# httpd 설치
RUN yum -y update; yum clean all; \
    yum -y install httpd; \
    yum -y install systemd; \
    yum clean all;

# PHP 설치
RUN yum -y install epel-release; \
    yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm; \
    yum-config-manager --enable remi-php74; \
    yum install php php-common php-mysqlnd;

#(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY index.php /var/www/html/index.php
COPY index.html /var/www/html/index.html

RUN systemctl restart httpd.service

ENV WEBPORT 8080
EXPOSE ${WEBPORT}

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
