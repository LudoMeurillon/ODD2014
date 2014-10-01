FROM     ubuntu:14.04

MAINTAINER Developer Day <devday@orange.com>

ENV http_proxy http://p-niceway.rd.francetelecom.fr:3128
ENV https_proxy http://p-niceway.rd.francetelecom.fr:3128

RUN apt-get update && apt-get install -y openssh-server apache2
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY devday-ansible-master/.ssh/id_rsa.pub /tmp/id_rsa.pub

RUN mkdir -p /root/.ssh \
    && cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys \
    && rm -f /tmp/id_rsa.pub

EXPOSE 22 80 514
CMD ["/usr/sbin/sshd", "-D"]
