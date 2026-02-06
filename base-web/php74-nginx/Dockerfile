FROM php:7.4-fpm

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
    libtidy-dev \
    libxslt1-dev \
    libmemcached-dev \
    libbz2-dev \
    libpspell-dev \
    libsnmp-dev \
    libsodium-dev \
 && rm -rf /var/lib/apt/lists/*

# GD
RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
 && docker-php-ext-install \
    bcmath \
    bz2 \
    calendar \
    ctype \
    curl \
    dba \
    dom \
    exif \
    fileinfo \
    ftp \
    gd \
    gettext \
    iconv \
    intl \
    json \
    mbstring \
    mysqli \
    pdo \
    pdo_mysql \
    pdo_sqlite \
    pcntl \
    posix \
    pspell \
    shmop \
    simplexml \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    tidy \
    tokenizer \
    xml \
    xmlreader \
    xmlwriter \
    xsl \
    zip \
    opcache

# PECL (legacy-friendly)
RUN pecl install \
    memcache-4.0.5.2 \
    memcached-3.1.5 \
    igbinary \
    msgpack \
    redis \
 && docker-php-ext-enable \
    memcache \
    memcached \
    igbinary \
    msgpack \
    redis

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Standard folders
RUN mkdir -p /var/www/html /var/log/app \
 && chown -R www-data:www-data /var/www /var/log/app

WORKDIR /var/www/html

COPY supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
