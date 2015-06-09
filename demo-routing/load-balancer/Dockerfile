FROM demo-common_base:1.0.0
MAINTAINER ash@the-rebellion.net

# Config
#
RUN rm -f /etc/haproxy/haproxy.cfg
ADD config/haproxy.cfg.ctmpl /etc/haproxy/haproxy.cfg.ctmpl
ADD config/syslog-ng.conf /etc/syslog-ng/conf.d/haproxy.conf

# Services
#
ADD services/consul_haproxy.ini /etc/supervisord.d/consul_haproxy.ini
ADD services/haproxy.ini /etc/supervisord.d/haproxy.ini

RUN touch /var/log/haproxy_system.log /var/log/haproxy_access.log

EXPOSE 80

CMD [ "/usr/sbin/supervisord", "-n", "-c", "/etc/supervisord.conf" ]
