SSH Tunnels
    On server 1 i.e the client server:
    - ssh -f -L 8080:localhost:80 root@server_2 -N
    - w3m http://locahost:8080/


OPEN VPN Tunnel
<!-- In server 2 acting as the OPEN VPN server -->
- yum install epel-release
- yum install openvpn easy-rsa -y
- iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE 
- cp /usr/share/doc/openvpn-2.3.10/sample/sample-config-files/server.conf /etc/openvpn
- vi /etc/openvpn/server.conf
    - uncomment line: push "redirect-gateway def1 bypass-dhcp"
    - edit line: "dhcp-option DNS 8.8.8.8"
    - edit line: "user: nobody, group: nobody"
- mkdir -p /etc/openvpn/easy-rsa/keys
- cp -rf /usr/share/easy-rsa/2.0/* /etc/openvpn/easy-rsa
- vi /etc/openvpn/easy-rsa/vars
    - edit line: "export KEY_NAME="server" "
    - edit line: "export KEY_CN="server2.example.com" " 

- cd /etc/openvpn/easy-rsa/
- cp openssl-1.0.0.cnf openssl.cnf
- source ./vars
- ./build-ca
- ./build-key-server server
- ./build-dh
- cd keys
- cp dh2048.pem ca.crt server.crt server.key /etc/openvpn
- cd /etc/openvpn/easy-rsa
- ./build-key client
- cd keys
- cp client.key client.crt /etc/openvpn
- systemctl enable openvpn@server
- systemctl start openvpn@server
- ip a s

<!-- in server 1-->
- yum install openvpn
- mkdir certs
- cd certs
- scp root@server2:/etc/openvpn/ca.crt .
- scp root@server2:/etc/openvpn/client.key .
- scp root@server2:/etc/openvpn/client.crt .
- cp /usr/share/doc/openvpn-2.3.10/sample/sample-config-files/client.conf .
- vi client.conf
    - edit file as: client
                    dev tun
                    proto udp
                    remote main-server-ip 1194
                    resolv-retry infinite
                    nobind
                    user nobody
                    group nobody 
                    persist-key
                    persist-tun
                    ca /root/certs/ca.crt
                    cert /root/certs/client.crt
                    key /root/certs/client.key
                    comp-lzo
                    verb 3
- openvpn --config client.conf



 


    