Install Redis:
    pkg.installed:
        - refresh: true
        - pkgs:
            - redis


Install PHP connector to Redis:
    pkg.installed:
        - pkgs:
            - php72-php-pecl-redis
