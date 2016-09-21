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
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/sbin/composer \
  && chmod a+x /usr/local/sbin/composer

# Explicitly set user/group IDs
RUN groupadd -r app --gid=999 \
  && useradd -r -g app --uid=999 app \
  && chown -R app:app /usr/src

USER app
