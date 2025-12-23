# Lightweight and framework-agnostic PHP image
# Designed for CI/CD pipelines (build, test, lint)
# Suitable for Laravel, Symfony, Slim, or plain PHP
# =========================

ARG PHP_VERSION=7.4
FROM php:${PHP_VERSION}-cli

# Image metadata
LABEL org.opencontainers.image.title="php-ci"
LABEL org.opencontainers.image.description="Lightweight PHP CI base image for CI/CD pipelines"
LABEL org.opencontainers.image.authors="Rafael Adail Rosa"

# -------------------------
# Common dependencies for any PHP CI pipeline
# -------------------------

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    pkg-config \
    zlib1g-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install gd exif zip \
 && rm -rf /var/lib/apt/lists/*

# -------------------------
# Composer (official image)
# -------------------------
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# -------------------------
# Composer (official image)
# -------------------------
WORKDIR /app
