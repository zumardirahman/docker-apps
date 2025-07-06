# Jalankan shell ke container
docker-compose run --rm app bash

# Di dalam container:
composer create-project laravel/laravel:^11.0 .

# Setelah selesai, keluar & jalankan container
exit
docker-compose up -d

# Koneksi ENV
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=djpetshop
DB_USERNAME=laravel
DB_PASSWORD=laravel

# Jalankan Laravel
docker-compose exec app php artisan serve --host=0.0.0.0 --port=8000
