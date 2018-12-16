Allow postroutingon nat:
    iptables.append:
        - table: nat
        - out-interface: eth0
        - jump: ACCEPT
        - chain: POSTROUTING

Forward LAN to WAN:
    iptables.append:
        - match: state
        - connstate: RELATED,ESTABLISHED
        - jump: ACCEPT
        - out-interface: eth1
        - in-interface: eth0
        - chain: FORWARD

Forward WAN to LAN:
    iptables.append:
        - in-interface: eth1
        - out-interface: eth0
        - jump: ACCEPT
        - chain: FORWARD
