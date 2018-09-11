# Firewall commands
# Firewalls can be specified by either using firewalld or iptables

# Network service files will be at /usr/lib/firewalld/services
1. firewall-cmd --state

2. systemctl start firewalld.service

3. firewall-cmd --state

4. - firewall-cmd --get-default-zone
   - firewall-cmd --set-default-zone=external

5. - firewall-cmd --get-active-zones
   - firewall-cmd --get-zones
   - firewall-cmd --list-all --zone=internal


6. - firewall-cmd --permanent --zone=public --remove-interface=enp0s8
   - firewall-cmd --permanent --zone=external --add-interface=enp0s8

7. systemctl restart firewalld.service

8. iptables -nvL or iptables -L

9. - firewall-cmd --permanent --remove-service={ssh,mdns}
   - firewall-cmd --permanent --add-service=nfs
   - firewall-cmd --reload

10. firewall-cmd --permanent --new-service="puppet"

