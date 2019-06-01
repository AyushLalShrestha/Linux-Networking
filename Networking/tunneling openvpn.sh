# Inspect certificate
openssl x509 -in ca.crt -noout -text


<!-- Start an openvpn server -->
# The pass verifier has to be executable by nobody.
pass_verifier="remote_con_server/verify_pass.py"
cert_dir="remote_connection/certificates"
client_conf_dir="remote_connection/client_configurations"
# LOGRUNNER will be allowed to send signals to the process
LOGRUNNER="${LOGRUNNER:-loginspect}"

# The tun10000 is special.
# Our firewall allows to access the service ports on tun10000.
exec openvpn --server "$network" "$netmask" \
    --proto udp6 \
    --dev tun10000 \
    --tun-mtu "$mtu_size_bytes" \
    --user "$LOGRUNNER" --group nogroup \
    --keepalive 10 60 --ping-timer-rem --persist-tun --persist-key \
    --auth-user-pass-verify "$pass_verifier" via-file \
    --tmp-dir /dev/shm \
    --script-security 2 \
    --duplicate-cn \
    --connect-freq 6 60 \
    --comp-lzo yes \
    
    --client-config-dir "$client_conf_dir" \
    --dh "$cert_dir"/dh2048.pem \
    --ca "$cert_dir"/ca.crt \
    --cert "$cert_dir"/ssl.crt 
    --key "$cert_dir"/ssl.key


<!-- Start an openvpn client server -->
cert_dir="remote_connection/certificates"
client_cert_dir="remote_connection/client_certificates"

# The client OpenVPN is run as root.
# It needs to run as root before connecting to a server.
# And it needs to run as root after some restarts.
# The root is used to change the routing table.
exec openvpn --client --remote "$remote" \
    --proto "$proto" \
    --auth-user-pass "$password_file" \
    --nobind \
    --dev tun \
    --tun-mtu "$mtu_size_bytes" \
    --keepalive 10 60 --ping-timer-rem --persist-tun --persist-key \
    --comp-lzo yes \
    
    --ca "$cert_dir"/ca.crt \
    --cert "$client_cert_dir"/ssl.crt 
    --key "$client_cert_dir"/ssl.key
