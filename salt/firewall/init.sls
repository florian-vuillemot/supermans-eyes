Allow http:
    firewalld.present:
        - name: public
        - services:
            - http
            - https
            - dhcpv6-client
            - ssh

Reload firewall:
    cmd.run:
        - name: "firewall-cmd --reload"

