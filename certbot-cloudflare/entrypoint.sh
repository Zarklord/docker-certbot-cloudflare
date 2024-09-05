#!/bin/sh

set -e

if [ ! -z "$TZ" ]
then
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  echo $TZ > /etc/timezone
fi

touch /tmp/certbot.log
touch /tmp/crond.log

# Setup cron schedule
crontab -d
echo "$CRON /renew.sh >>/tmp/certbot.log 2>&1" > /tmp/crontab.tmp
crontab /tmp/crontab.tmp
rm /tmp/crontab.tmp

# Start cron
echo "INFO: Starting crond ..."
crond -b -l 0 -L /tmp/crond.log
echo "INFO: crond started"

/certonly.sh & >>/tmp/certbot.log 2>&1

tail -F /tmp/crond.log /tmp/certbot.log
