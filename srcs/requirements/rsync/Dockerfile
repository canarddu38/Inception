FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    rsync \
    cron \
    && rm -rf /var/lib/apt/lists/*

COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]
