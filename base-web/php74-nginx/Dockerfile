FROM php:7.4-fpm

# ===============================
# OS & system dependencies
# ===============================
RUN apt-get update && apt-get install -y \
    nginx \
    supervisor \
    git \
    unzip \
    curl \
    libcurl4-openssl-dev \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libonig-dev \
    libsodium-dev \
    libmagickwand-dev \
    imagemagick \
 && rm -rf /var/lib/apt/lists/*

# ===============================
# GD configuration
# ===============================
RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg

# ===============================
# PHP extensions (CMS essentials)
# ===============================
RUN docker-php-ext-install \
    bcmath \
    curl \
    dom \
    exif \
    fileinfo \
    gd \
    intl \
    json \
    mbstring \
    mysqli \
    pdo \
    pdo_mysql \
    simplexml \
    soap \
    sodium \
    xml \
    zip \
    opcache

# ===============================
# Imagick (PECL)
# ===============================
RUN pecl install imagick \
 && docker-php-ext-enable imagick

# ===============================
# Redis (optional but common)
# ===============================
RUN pecl install redis \
 && docker-php-ext-enable redis

# ===============================
# Composer
# ===============================
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# ===============================
# Standard directories
# ===============================
RUN mkdir -p /var/www/html /var/log/app \
 && chown -R www-data:www-data /var/www /var/log/app

WORKDIR /var/www/html

COPY supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
