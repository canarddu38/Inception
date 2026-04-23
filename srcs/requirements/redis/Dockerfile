FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/init.sh"]
