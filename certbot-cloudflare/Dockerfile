FROM certbot/dns-cloudflare:v2.11.0

RUN apk add tzdata dcron mosquitto-clients --no-cache

COPY --chmod=0755 ./entrypoint.sh /entrypoint.sh
COPY --chmod=0755 ./renew.sh /renew.sh
COPY --chmod=0755 ./certonly.sh /certonly.sh
COPY --chmod=0755 ./deploy-hook.sh /deploy-hook.sh

ENV CRON="0 0 * * *" \
    TZ= \
    EMAIL= \
    CERT_NAME= \
    DOMAINS= \
    MQTT_HOST= \
    MQTT_PORT=1883 \
    MQTT_USERNAME= \
    MQTT_PASSWORD=

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
