Add nat postrouting:
    cmd.run:
        - name: "iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE"

Add WAN to LAN rules:
    cmd.run:
        - name: "iptables -A FORWARD -i enp0s3 -o enp0s8 -m state --state RELATED,ESTABLISHED -j ACCEPT"

Add LAN to WAN rules:
    cmd.run:
        - name: "iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT"

# Add net.ipv4.ip_forward = 1 dans /etc/sysctl.conf


# https://www.centos.org/forums/viewtopic.php?t=53819
