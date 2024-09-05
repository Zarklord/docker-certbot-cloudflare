#!/bin/sh

certbot renew \
	--deploy-hook /deploy-hook.sh