FROM php:8.0.30-fpm

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    iputils-ping \
    net-tools \
    dnsutils \
    telnet \
    vim \
    nano \
    curl \
    wget \
    git \
    zip \
    unzip \
    supervisor \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install zip pdo_mysql mysqli mbstring exif pcntl bcmath gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Bersihkan config default NGINX
RUN rm -f /etc/nginx/sites-enabled/default /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

EXPOSE 80

CMD ["/bin/bash", "/entrypoint.sh"]