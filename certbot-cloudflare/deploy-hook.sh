#!/bin/sh

if [ ! -z "${MQTT_HOST}" ]; then
	/usr/bin/mosquitto_pub -h $MQTT_HOST -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -n -t certbot_cloudflare/${CERT_NAME}/renew
fi