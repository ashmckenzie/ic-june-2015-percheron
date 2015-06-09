#!/bin/sh

. /etc/environment

echo "server=/consul/${DEMO_COMMON_CONSUL_PORT_53_UDP_ADDR}#53" > /etc/dnsmasq.d/10-consul

/usr/sbin/dnsmasq --no-daemon 2>&1
