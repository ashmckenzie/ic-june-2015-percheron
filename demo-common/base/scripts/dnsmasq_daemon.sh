#!/bin/sh

. /etc/environment

echo "server=/consul/${CONSUL_PORT_53_UDP_ADDR}#53" > /etc/dnsmasq.d/10-consul

dnsmasq --no-daemon 2>&1
