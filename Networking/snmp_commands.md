1. sudo service snmpd reload

<!-- directive community [source [OID]] -->
2. snmpwalk -v2c -c public 192.168.4.206:161 .1.3.6.1.4.1.2021.3000
   snmpwalk -v2c -c public 192.168.4.206:161 .1.3.6.1.4.1.2021.3000


<!-- extending -->
3. extend httpd_pids /bin/sh /usr/local/bin/check_apache.sh
