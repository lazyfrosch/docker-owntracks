#!/bin/bash

VOL=/data

if [ ! -f "$VOL"/mosquitto.acl ]; then
    cp /etc/mosquitto/mosquitto.acl "$VOL"/mosquitto.acl
fi
if [ ! -f "$VOL"/mosquitto.passwd ]; then
    touch "$VOL"/mosquitto.passwd
fi

chown -R mosquitto.mosquitto "$VOL"

exec "$@"
