FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php8.2-cli \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-redis \
    mariadb-client \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

RUN mkdir -p /run/php

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/init.sh"]