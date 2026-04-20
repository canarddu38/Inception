#!/bin/sh
set -e

cat << 'EOF' > /usr/local/bin/backup.sh
#!/bin/sh
if [ -f "/var/www/html/wp-config.php" ]; then
    rsync -avq /var/www/html/ /var/backups/wordpress/
fi
EOF
chmod +x /usr/local/bin/backup.sh

echo "*/1 * * * * root /usr/local/bin/backup.sh" > /etc/cron.d/rsync_backup
chmod 0644 /etc/cron.d/rsync_backup
crontab /etc/cron.d/rsync_backup

echo "Starting cron..."
exec cron -f
