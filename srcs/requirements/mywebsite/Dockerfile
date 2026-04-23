FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y python3 \
    && rm -rf /var/lib/apt/lists/*

COPY server.py /usr/local/bin/
COPY init.sh /usr/local/bin/
RUN mkdir -p /var/www/html
COPY index.html /var/www/html/
RUN chmod +x /usr/local/bin/server.py
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/init.sh"]
