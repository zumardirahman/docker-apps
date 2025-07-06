#!/bin/bash
echo "[ENTRYPOINT] Fixing permission for Laravel dirs..."
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache || true
chmod -R 755 /var/www/html/storage /var/www/html/bootstrap/cache || true

echo "[ENTRYPOINT] Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisord.conf