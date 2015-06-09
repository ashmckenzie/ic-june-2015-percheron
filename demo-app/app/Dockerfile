FROM demo-common_base:1.0.0
MAINTAINER ash@the-rebellion.net

ADD config/nginx.conf /etc/nginx/sites-enabled/app.conf
ADD services/nginx.ini /etc/supervisord.d/nginx.ini

RUN echo '{"service": {"name": "demo-app", "tags": ["app"], "port": 81, "check": {"script": "curl -vs http://localhost:81/ 2>&1", "interval": "5s"}}}' > /etc/consul.d/demo-app_app.json

EXPOSE 81

CMD [ "/usr/sbin/supervisord", "-n", "-c", "/etc/supervisord.conf" ]
