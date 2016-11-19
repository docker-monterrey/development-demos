# 1: Use PHP 7.0.11 CLI as base:
FROM php:7.0.11-cli

# 2: We'll set the application path as the working directory
RUN set -ex && mkdir -p /usr/src/app
WORKDIR /usr/src/app

# 3: We'll add the app's binaries path to $PATH:
ENV HOME=/usr/src/app \
    PATH=/usr/src/app/bin:/usr/src/app/vendor/bin:$PATH

# 4: Install dependency packages:
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends zlib1g zlib1g-dev libpq5 libpq-dev \
  && docker-php-ext-install zip pdo_pgsql \
  && apt-get remove --purge -y zlib1g-dev libpq-dev \
  && rm -rf /var/lib/apt/lists/*

# 4: Install composer:
RUN set -ex \
  && export COMPOSER_VERSION=1.2.2 \
  && export COMPOSER_SHA384=17e3ec9e7d472bedc0c0a2c7e08d8c03937a50fc31a824f3e18d3aed631dfdc071cc20688e2d2b19a3be2d92a272a95e \
  && curl -o /usr/local/sbin/composer "https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar" \
  && echo "$COMPOSER_SHA384 /usr/local/sbin/composer" | sha384sum -c - \
  && chmod a+x /usr/local/sbin/composer

# Explicitly set user/group IDs
RUN groupadd -r app --gid=999 \
  && useradd -r -g app --uid=999 app \
  && chown -R app:app /usr/src

USER app
