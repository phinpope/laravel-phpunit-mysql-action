# Laravel PHPUnit MySQL Action

A Github action to run your Laravel project's PHPUnit test suite running with MySQL.

## Use Example

´´´
name: laravel-phphunit

on:
  pull_request: {}
  push:
    branches:
      - master

jobs:
  phpunit:
    name: PHPUnit

    runs-on: ubuntu-latest

    services:
      mysql:
        image: mysql:8.0
        ports:
          - 3306:3306
        env:
          MYSQL_ROOT_PASSWORD:
          MYSQL_ALLOW_EMPTY_PASSWORD: yes
          MYSQL_USER: user
          MYSQL_PASSWORD: user
          MYSQL_DATABASE: dbname

    steps:
    - uses: actions/checkout@v1
    - uses: leonus96/laravel-phpunit-mysql-action@master

Note: The mysql credentials must match your repository env.example
