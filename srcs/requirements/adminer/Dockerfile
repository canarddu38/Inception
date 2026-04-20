FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    adminer php7.4 \
    && rm -rf /var/lib/apt/lists/*

COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/init.sh"]
