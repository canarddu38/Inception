FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty
RUN mkdir -p /var/www/html

COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 21 21100-21110

ENTRYPOINT ["/usr/local/bin/init.sh"]
