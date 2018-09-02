# Network and Network Manager commands

1. ip addr show or  ip a
2. ip addr add 172.17.67.3/16 dev enp0s8

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



