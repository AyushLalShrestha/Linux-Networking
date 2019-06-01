# Network and Network Manager commands

1. ip addr show or  ip a
    - ip route show
    
2. ip addr add 172.17.67.3/16 dev enp0s8

3. systemctl status NetworkManager
    systemctl status network

4. <!-- To add a new default route -->
    - sudo route del default
    - sudo route add default gw 192.168.130.254 netmask 255.255.255.0
    <!-- To add a default route permanently -->
    - sudo vi /etc/network/interfaces and add the following:
        - auto eth0
        - iface eth0 inet dhcp
        - up route del default

        - auto eth1
        - iface eth1 inet dhcp
        - up route add default gw 192.168.130.254 netmask 255.255.255.0

    - sudo /etc/init.d/networking restart


<!-- Using tcpdump -->
- sudo tcpdump -i tun10000 dst host 10.52.208.3 and port 5504 -nn -vv -Aqs0
   



