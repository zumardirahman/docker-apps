#!/bin/bash
echo "[ENTRYPOINT] Fixing permission for CodeIgniter 3 dirs..."

# Contoh: kasih permission folder uploads
chown -R www-data:www-data /var/www/html/uploads || true
chmod -R 755 /var/www/html/uploads || true

# Kalau ada cache di application/cache
chown -R www-data:www-data /var/www/html/application/cache || true
chmod -R 755 /var/www/html/application/cache || true

echo "[ENTRYPOINT] Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisord.conf