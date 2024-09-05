#!/bin/sh

certbot certonly \
	--non-interactive \
	--agree-tos \
	--no-eff-email \
	--email $EMAIL \
	--keep-until-expiring \
	--expand \
	--dns-cloudflare \
	--dns-cloudflare-credentials /cloudflare.ini \
	--cert-name $CERT_NAME \
	--domains $DOMAINS \
	--deploy-hook /deploy-hook.sh