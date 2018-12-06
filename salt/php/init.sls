{% if grains['os_family'] == 'RedHat' %}

centos-release-scl.noarch:
    pkg.installed

{% endif %}

php.packages:
    pkg.installed:
        - pkgs:
            - rh-php70
            - rh-php70-php
            - rh-php70-php-fpm
            - httpd
