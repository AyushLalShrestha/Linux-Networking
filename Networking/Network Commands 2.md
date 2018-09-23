
<!-- NMCLI -->
<!-- Dynamically adding a connection -->
    - nmcli connection show -p enp0s3
    - nmcli connection add con-name name ifname enp0s3 type ethernet ip4 192.168.0.99 gw4 192.168.0.1 
    - nmcli con down enp0s3
    - nmcli con up enp0s3

<!-- Statically adding a connection from a new configuration file -->
    - cd /etc/sysconfig/network-scripts {for RHEL}  - cd /etc/network/interfaces {for UBUNTU}
    - make a new config file (let's say for enp0s8) (refer screenshot)
    - nmcli con delete "Wired Connection 1"
    - ifdown enp0s8
    - ifup enp0s8
    - systemctl stop/start NetworkManager.service



<!-- Routing using the ip route -->
<!-- machine_1 in the VB only has host_only_adapter configured. Whereas machine_2 in the same VB has both the bridged_adapter and host_only_adapter configured. 
    say you want to connect to the internet from machine_1 through machine_2's path, then in machine _1 -->
    - ip r or ip route 
    - ip route add default via "machine_2's ip"
    - Then you have edit in the script mentioned above (vi /etc/sysconfig/network-scripts/your_network_script)
         - add: GATEWAY="machine_2's ip"
         - add: DEFROUTE="yes"
        <!-- NOTE: the DNS's mentioned will be written to /etc/resolv.conf -->

<!-- in machine 2-->
    - cat /proc/sys/net/ipv4/ip_forward
    - vi /etc/sysctl.conf
        - add: net.ipv4.ip_forward=1
    - iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE  