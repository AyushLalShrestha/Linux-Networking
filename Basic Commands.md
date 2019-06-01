# Basic system monitoring related commands

1. Show disk usages
	df -ah

2. Show disk usage
	 du -sh <dir name>

3. Show info about network
	netstat -tulpn
	netstat -nltp
	netstat -vatn

4. ps aux | grep <process name>
	- bg, fg, jobs, kill

5. mkfs -t <type> < ,>
	eg. mkfs -t ext4 /dev/sdb3

6. mount <device> <mount point>
	eg. mount /dev/sdb3 /opt 

7. curl -I -s https://opensource.com

8. cat complex_json.json | python -m json.tool

9. traceroute www.google.com

10. sudo tcpdump -Aqns0 -i eth0 port 514

11. sftp
		-> get file_from_server.txt
		-> put file_from_local.txt