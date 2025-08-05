FROM certbot/dns-cloudflare:v4.2.0

RUN apk add tzdata dcron mosquitto-clients --no-cache

COPY --chmod=0755 ./entrypoint.sh /entrypoint.sh
COPY --chmod=0755 ./renew.sh /renew.sh
COPY --chmod=0755 ./certonly.sh /certonly.sh
COPY --chmod=0755 ./deploy-hook.sh /deploy-hook.sh

ENV CRON="0 0 * * *" \
    TZ= \
    EMAIL= \
    DOMAINS= \
    CERT_CHOWN_USER= \
    MQTT_HOST= \
    MQTT_PORT=1883 \
    MQTT_USERNAME= \
    MQTT_PASSWORD= \
    MQTT_TOPIC=

VOLUME ["/etc/letsencrypt"]
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
