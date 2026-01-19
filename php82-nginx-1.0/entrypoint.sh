#!/bin/sh
set -e

# Ensure proper ownership and permissions for Laravel storage and cache directories
[ -d /var/www/html/storage ] && \
  chown -R www-data:www-data /var/www/html/storage && \
  chmod -R 775 /var/www/html/storage
[ -d /var/www/html/bootstrap/cache ] && \
  chown -R www-data:www-data /var/www/html/bootstrap/cache && \
  chmod -R 775 /var/www/html/bootstrap/cache


# Start supervisord in the foreground
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
