FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    adminer php8.2-cli \
    && rm -rf /var/lib/apt/lists/*

COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/init.sh"]
