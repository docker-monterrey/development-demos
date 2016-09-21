# Votes App - Laravel PHP Framework

# 2: How was the project created?
```bash
docker run --rm -v $(pwd):/usr/src -ti php:7.0.11-cli bash

# Then we installed the ZLIB dependency apt packages so we can use install and
# use composer to create the project:
set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends zlib1g zlib1g-dev \
  && docker-php-ext-install zip \
  && apt-get remove --purge -y zlib1g-dev \
  && rm -rf /var/lib/apt/lists/* \
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/sbin/composer \
  && chmod a+x /usr/local/sbin/composer

# Then we actually use composer to create our laravel app:
cd /usr/src && composer create-project --prefer-dist laravel/laravel votes
```
