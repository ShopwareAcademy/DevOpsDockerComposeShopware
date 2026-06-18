FROM ghcr.io/shopware/shopware-cli:latest-php-8.3 AS builder

WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-interaction --prefer-dist --no-scripts

COPY . .

RUN --mount=type=cache,target=/root/.composer \
    --mount=type=cache,target=/root/.npm \
    /usr/local/bin/entrypoint.sh shopware-cli project ci /app

FROM ghcr.io/shopware/docker-base:8.3-caddy-otel AS final

WORKDIR /var/www/html

COPY --from=builder --chown=www-data:www-data /app /var/www/html
