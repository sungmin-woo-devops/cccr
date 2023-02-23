FROM centos:7
LABEL maintainer="Your Name <your-email@example.com>"

# Install required packages
RUN yum -y install httpd systemd; \
    yum clean all; \
    systemctl enable httpd.service

# Copy website files to container
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY index.php /var/www/html/index.php

# Expose port 80 for HTTP traffic
EXPOSE 8080

# Start systemd on boot
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

