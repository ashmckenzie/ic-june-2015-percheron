FROM base/archlinux:latest
MAINTAINER ash@the-rebellion.net

ENV TERM ansi

RUN pacman-key --refresh-keys
RUN pacman -yS --noconfirm syslog-ng supervisor nginx haproxy netcat dnsmasq unzip go make glibc libunistring git
RUN pacman -Sc --noconfirm

# Setup
#
RUN mkdir -p /usr/local/bin /usr/local/sbin /etc/dnsmasq.d /etc/nginx/sites-enabled /etc/supervisord.d /etc/syslog-ng/conf.d

# Configs
#
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/supervisord.conf /etc/supervisord.conf
ADD config/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf
ADD config/dnsmasq.conf /etc/dnsmasq.conf

# Scripts
#
ADD scripts/dnsmasq_daemon.sh /usr/local/sbin/dnsmasq_daemon.sh
RUN chmod 755 /usr/local/sbin/*

# Services
#
ADD services/syslog-ng.ini /etc/supervisord.d/syslog-ng.ini
ADD services/consul.ini /etc/supervisord.d/consul.ini
ADD services/dnsmasq.ini /etc/supervisord.d/dnsmasq.ini

# Consul
#
RUN mkdir /etc/consul.d
RUN cd /tmp ; curl -L https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip -O ; unzip 0.5.2_linux_amd64.zip ; cp consul /usr/local/bin

# Consul template
#
RUN cd /tmp ; curl -L https://github.com/hashicorp/consul-template/archive/v0.9.0.tar.gz | tar xzvf - ; cd ./consul-template-0.9.0/ ; GOPATH="/tmp" make ; cp bin/* /usr/local/bin/

# Cleanup
#
RUN rm -rf /tmp/*
