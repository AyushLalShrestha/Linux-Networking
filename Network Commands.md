# Network and Network Manager commands

1. ip addr show or  ip a
    
2.  

3. systemctl status NetworkManager
    systemctl status network

<!-- Dynamically adding a connection -->
4. - nmcli connection show -p enp0s3
    - nmcli connection add con-name name ifname enp0s3 type ethernet ip4 192.168.0.99 gw4 192.168.0.1 
    - nmcli con down enp0s3
    - nmcli con up enp0s3

<!-- Statically adding a connection from a new configuration file -->
5. - cd /etc/sysconfig/network-scripts 
    - make a new config file (let's say for enp0s8)
    - nmcli con delete "Wired Connection 1"
    - ifdown enp0s8
    - ifup enp0s8
    - systemctl stop/start NetworkManager.service



<!-- Routing using the ip route -->
<!-- machine_1 in the VB only has host_only_adapter configured. Whereas machine_2 in the same VB has bridged_adapter and                  host_only_adapter configured. 
    say you want to connect to the internet from machine_1 through machine_2's path, then in machine _1 -->
1. ip r or ip route 
2. ip route add default via "machine_2's ip"
    - Then you have to add the GATEWAY="other_machine_2's ip" & DEFROUTE="yes" in the step.5 script (above),
        the DNS's mentioned will be written to /etc/resolv.conf
<!-- in machine 2-->
1. cat /proc/sys/net/ipv4/ip_forward
2. vi /etc/sysctl.conf
    - add => net.ipv4.ip_forward=1
3. iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE     



