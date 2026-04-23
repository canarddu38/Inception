#!/bin/sh
set -e

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html
cd /var/www/html

echo "Done folders!"

until mysql -h mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD -e "SELECT 1" > /dev/null 2>&1; do
    sleep 2
done

echo "Finished waiting db!"

until php -r "exit(@fsockopen('redis', 6379) ? 0 : 1);"; do
    echo "Waiting for redis..."
    sleep 2
done
echo "Finished waiting for redis!"

if [ ! -f wp-config.php ]; then
    wp core download --allow-root

    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="mariadb:3306" \
        --allow-root

    wp core install \
        --url="https://julcleme.42.fr" \
        --title="Inception" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --allow-root

    wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
        --role=author \
        --user_pass="${WP_USER_PASSWORD}" \
        --allow-root

    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --raw --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root
fi

echo "Finished config"

sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/8.2/fpm/pool.d/www.conf
sed -i 's|^listen.allowed_clients =.*|;listen.allowed_clients =|g' /etc/php/8.2/fpm/pool.d/www.conf
sed -i 's|^listen = .*|listen = 0.0.0.0:9000|g' /etc/php/8.2/fpm/pool.d/www.conf
sed -i 's|^daemonize = yes|daemonize = no|g' /etc/php/8.2/fpm/php-fpm.conf

exec /usr/sbin/php-fpm8.2 -F
