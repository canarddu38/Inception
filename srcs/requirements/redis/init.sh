#!/bin/sh
set -e

echo "Started conf redis"

echo "Starting redis"

exec redis-server /etc/redis/redis.conf --bind 0.0.0.0 --protected-mode no --daemonize no