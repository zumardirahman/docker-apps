FROM php:8.3-fpm-bookworm

ENV TZ=Asia/Jakarta

RUN apt-get update && apt-get install -y \
    git unzip curl \
    libicu-dev libzip-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libxml2-dev libonig-dev libcurl4-openssl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        bcmath \
        intl \
        mbstring \
        pdo \
        pdo_mysql \
        xml \
        zip \
        opcache \
        exif \
        gd

# Redis (untuk cache Laravel)
RUN pecl install redis && docker-php-ext-enable redis

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# lebih aman dari 777
# RUN chown -R www-data:www-data /var/www

CMD ["php-fpm"]

