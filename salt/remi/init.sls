Install remi:
    pkg.installed:
        - sources:
            - remi-release: http://rpms.remirepo.net/enterprise/remi-release-7.rpm


Install php:
    cmd.run:
        - name: yum-config-manager
        - args: "--enable remi-php72"


    