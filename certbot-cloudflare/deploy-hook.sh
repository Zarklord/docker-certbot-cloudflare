#!/bin/sh

cp /etc/letsencrypt/live/cert/cert.pem /certs/cert.pem
cp /etc/letsencrypt/live/cert/chain.pem /certs/chain.pem
cp /etc/letsencrypt/live/cert/fullchain.pem /certs/fullchain.pem
cp /etc/letsencrypt/live/cert/privkey.pem /certs/privkey.pem

if [ ! -z "${CERT_CHOWN_USER}" ]; then
	chown $CERT_CHOWN_USER /certs/cert.pem
	chown $CERT_CHOWN_USER /certs/chain.pem
	chown $CERT_CHOWN_USER /certs/fullchain.pem
	chown $CERT_CHOWN_USER /certs/privkey.pem
fi

if [ ! -z "${MQTT_HOST}" ]; then
	/usr/bin/mosquitto_pub -h $MQTT_HOST -p $MQTT_PORT -u $MQTT_USERNAME -P $MQTT_PASSWORD -n -t certbot_cloudflare/$MQTT_TOPIC/renew
fi