###############################
# Stage 1 - Build Frontend
###############################
FROM node:22-alpine AS frontend

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


###############################
# Stage 2 - PHP + Unit
###############################
FROM unit:1.34.1-php8.4

RUN apt-get update && apt-get install -y \
    curl unzip git \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libssl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pcntl \
        opcache \
        pdo \
        pdo_mysql \
        intl \
        zip \
        gd \
        exif \
        ftp \
        bcmath \
    && rm -rf /var/lib/apt/lists/*

RUN echo "opcache.enable=1" > /usr/local/etc/php/conf.d/custom.ini \
 && echo "opcache.jit=tracing" >> /usr/local/etc/php/conf.d/custom.ini \
 && echo "opcache.jit_buffer_size=256M" >> /usr/local/etc/php/conf.d/custom.ini \
 && echo "memory_limit=512M" >> /usr/local/etc/php/conf.d/custom.ini \
 && echo "upload_max_filesize=64M" >> /usr/local/etc/php/conf.d/custom.ini \
 && echo "post_max_size=64M" >> /usr/local/etc/php/conf.d/custom.ini

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html

COPY . .

RUN composer install \
    --no-dev \
    --prefer-dist \
    --optimize-autoloader \
    --no-interaction

# Copy Vite build from Node stage
COPY --from=frontend /app/public/build ./public/build

RUN mkdir -p storage bootstrap/cache \
 && chown -R unit:unit storage bootstrap/cache \
 && chmod -R 775 storage bootstrap/cache

COPY unit.json /docker-entrypoint.d/unit.json

EXPOSE 8000

CMD ["unitd", "--no-daemon"]