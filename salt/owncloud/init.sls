/etc/owncloud/owncloud.tar.bz2:
    file.managed:
        - source: https://download.owncloud.org/community/owncloud-10.0.10.tar.bz2
        - source_hash: https://download.owncloud.org/community/owncloud-10.0.10.tar.bz2.md5

Extract OwnCloud in web server directory:
    archive.extracted:
        - name: /var/www
        - source: /etc/owncloud/owncloud.tar.bz2

Add web server config file:
    file.managed:
        - name: /etc/httpd/sites-available/owncloud.conf
        - source: salt://owncloud/config_file/owncloud.conf
        - makedirs: True

Create symlink between sites-available and sites enabled:
    file.symlink:
        - name: /etc/httpd/sites-enabled/owncloud.conf
        - target: /etc/httpd/sites-available/owncloud.conf
        - makedirs: True


Restart apache:
    service.running:
        - name: httpd
        - reload: True
