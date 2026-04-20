#!/bin/sh
set -e

mkdir -p /etc/nginx/ssl
if [ ! -f /etc/nginx/ssl/julcleme.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/julcleme.key \
        -out /etc/nginx/ssl/julcleme.crt \
        -subj "/C=FR/ST=Île-de-France/L=Paris/O=42/OU=Inception/CN=julcleme.42.fr"
fi

exec nginx -g "daemon off;"
