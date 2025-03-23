#!/usr/bin/env bash
mkdir -p /etc/nginx/ssl
for domain in $(ls -1 /etc/letsencrypt/archive);
do
  cp /etc/letsencrypt/live/$domain/fullchain.pem /etc/nginx/ssl/$domain.pem
  cp /etc/letsencrypt/live/$domain/privkey.pem /etc/nginx/ssl/$domain.key
done
if systemctl list-units | grep nginx; then
  systemctl reload nginx
fi
