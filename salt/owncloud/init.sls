/etc/owncloud/owncloud.tar.bz2:
    file.managed:
        - source: https://download.owncloud.org/community/owncloud-10.0.10.tar.bz2
        - source_hash: https://download.owncloud.org/community/owncloud-10.0.10.tar.bz2.md5

Extract OwnCloud:
    archive.extracted:
        - name: /etc/owncloud
        - source: /etc/owncloud/owncloud.tar.bz2


