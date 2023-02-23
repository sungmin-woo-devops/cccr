FROM centos:7
MAINTAINER Sungmin Woo (sungminwoo.devop@gmail.com)
RUN yum -y install httpd
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

WORKDIR /var/www/html
ADD index.php

ENV WEBPORT 8080
EXPOSE ${WEBPORT}
