Install a bind as DNS server:
    pkg.installed:
        - pkgs:
            - bind
            - bind-utils

Add config file:
    file.managed:
        - name: /etc/named/named.conf.local
        - source: salt://dns/config_file/named.conf.options
        - makedirs: True

Add include in named config file:
    file.append:
        - name: /etc/named.conf
        - text: "include \"/etc/named/named.conf.local\""


Restart bind:
    cmd.run:
        - name: "systemctl restart named"
