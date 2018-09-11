# Commands for manipulating the iptable and firewall rules
# https://www.cyberciti.biz/tips/linux-iptables-examples.html

1. iptables -L or -nvL
  <!-- cat /etc/sysconfig/iptables -->

2. <!-- Some iptables rule appending commands -->

<!-- Accept all requests from localhost-->
    - iptables -A INPUT -i lo -j ACCEPT

<!-- accept the reply of any outgoing requests established connection --> 
    - iptables -A INPUT -m conntrack --ctstate ESTABLISHED, RELATED -j ACCEPT

<!-- accpet for ssh -->
    - iptables -A INPUT -p tcp --dport 22 -j ACCEPT

<!-- if no above rule is applied, in the end DROP the request -->
    - iptables -A INPUT -j DROP

<!-- to insert the rule to top -->
    - iptables -I INPUT 1 -p tcp -dport 80 -j ACCEPT

<!-- stop ping -->
    - iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

3. <!-- save the state of the current firewall and restore later-->
    - iptables-save > fwoff
    - iptables-restore < fwoff
