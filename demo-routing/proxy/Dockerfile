FROM demo-common_base:1.0.0
MAINTAINER ash@the-rebellion.net

# Config
#
ADD config/nginx_proxy.conf.ctmpl /etc/nginx/sites-enabled/proxy.conf.ctmpl

# Services
#
ADD services/consul_nginx.ini /etc/supervisord.d/consul_nginx.ini
ADD services/nginx.ini /etc/supervisord.d/nginx.ini

RUN echo '{"service": {"name": "demo-routing", "tags": ["proxy"], "port": 80, "check": {"script": "nc -z localhost 80 2>&1", "interval": "5s"}}}' > /etc/consul.d/demo-app_app.json

EXPOSE 80

CMD [ "/usr/sbin/supervisord", "-n", "-c", "/etc/supervisord.conf" ]
