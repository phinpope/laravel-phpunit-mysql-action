composer install --no-ansi --no-interaction --no-scripts --no-suggest --no-progress --prefer-dist

cp .env.example .env

php artisan key:generate

php vendor/bin/phpunit --verbose