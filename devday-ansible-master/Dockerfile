FROM dockerfile/ansible

MAINTAINER Developer Day <devday@orange.com>

COPY .ssh/id_rsa /root/.ssh/id_rsa
COPY .ssh/id_rsa.pub /root/.ssh/id_rsa.pub
COPY .ssh/config /root/.ssh/config
COPY init_hosts.sh /root/init_hosts

RUN mkdir -p /etc/ansible && mkdir -p /root/.ssh/cp

RUN chmod 600 /root/.ssh/id_rsa \
    && chmod 640 /root/.ssh/config \
	&& echo "source /root/init_hosts" >> /root/.bashrc

CMD bash
