Install DHCP:
    pkg.installed:
        - pkgs:
            - dhcp

Add config file:
    file.managed:
        - name: /etc/sysconfig/dhcpd
        - source: salt://dhcp/config_files/dhcpd

Add network config file:
    file.managed:
        - name: /etc/dhcp/dhcpd.conf
        - source: salt://dhcp/config_files/dhcpd.conf

Give static url on enp0s8:
    file.managed:
        - name: /etc/sysconfig/network-scripts/ifcfg-enp0s8
        - source: salt://dhcp/config_files/ifcfg-enp0s8

dhcpd:
    service.running: []

Allow dhcp in firewall:
    firewalld.present:
        - name: public
        - services:
            - dhcp

Reload firewall:
    cmd.run:
        - name: "firewall-cmd --reload"
