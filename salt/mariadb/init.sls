Install MariaDB:
    pkg.installed:
        - refresh: true
        - pkgs:
            - mariadb-server
            - mariadb

Enable MariaDB:
    service.running:
        - name: mariadb
        - enable: True
