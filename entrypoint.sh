#!/bin/sh -l

composer install --no-ansi --no-interaction --no-scripts --no-suggest --no-progress --prefer-dist
mkdir storage
cd storage
mkdir logs
mkdir framework
#mkdir framework/cache
#mkdir framework/cache/data
#mkdir framework/sessions
#kdir framework/testing
#kdir framework/views
chgrp -R www-data ../storage
chown -R www-data ../storage
cd ..
echo ${{ secrets.STAGING_ENV_FILE }} > .env
#cp .env.ci .env
touch database/reporting.sqlite
php artisan key:generate

php artisan migrate:fresh --seed

php vendor/bin/phpunit --verbose
