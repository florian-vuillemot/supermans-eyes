/etc/owncloud/owncloud.tar.bz2:
    file.managed:
        - source: https://download.owncloud.org/community/owncloud-10.0.10.tar.bz2
        - source_hash: https://download.owncloud.org/community/owncloud-10.0.10.tar.bz2.md5

Extract OwnCloud in web server directory:
    archive.extracted:
        - name: /var/www
        - source: /etc/owncloud/owncloud.tar.bz2

/var/www/owncloud:
    file.directory:
        - user: apache
        - group: apache
        - recurse:
            - user
            - group

Add web server config file:
    file.managed:
        - name: /etc/httpd/sites-available/owncloud.conf
        - source: salt://owncloud/config_file/owncloud.conf
        - makedirs: True


Add config in http conf.d file:
    file.managed:
        - name: /etc/httpd/conf.d/owncloud.conf
        - source: salt://owncloud/config_file/owncloud.conf

Create symlink between sites-available and sites enabled:
    file.symlink:
        - name: /etc/httpd/sites-enabled/owncloud.conf
        - target: /etc/httpd/sites-available/owncloud.conf
        - makedirs: True

{% for usr in ['data', 'config', 'apps', '.htaccess', '.user.ini'] %}
Enable '{{ usr }}' for SeLinux:
    cmd.run:
        - name: "semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/owncloud/{{ usr }}(/.*)?'"
{% endfor %}

SeLinux Update:
    cmd.run:
        - name: "restorecon -Rv '/var/www/owncloud/'"

Enable MariaDB:
    cmd.run:
        - name: "setsebool -P httpd_can_network_connect_db 1"

Init OwnCloud:
    cmd.run:
        - name: "sudo -u apache php72 /var/www/owncloud/occ maintenance:install --database 'mysql' --database-name 'owncloud' --database-user 'root' --database-pass '' --admin-user 'admin' --admin-pass 'password'"

Restart apache:
    service.running:
        - name: httpd
        - reload: True
