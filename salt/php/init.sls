{% if grains['os_family'] == 'RedHat' %}

centos-release-scl.noarch:
    pkg.installed

{% endif %}

    
php.packages:
    pkg.installed:
        - refresh: true
        - pkgs:
            - php72
            - php72-php
            - php72-php-gd
            - php72-php-mbstring
            - php72-php-mysqlnd
            - php72-php-cli
            - php72-php-pecl-apcu
            - php72-php-common
            - php72-php-ldap

# Todo: do this only if php72 is not already enable
Enable php72 in bash:
    cmd.run:
        - name: "scl enable php72 bash"
        - watch:
            - pkg: php.packages
