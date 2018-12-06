Install MariaDB:
    pkg.installed:
        - refresh: true
        - pkgs:
            - mariadb-server
            - mariadb
