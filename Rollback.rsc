/system ssh set strong-crypto=no allow-none-crypto=yes always-allow-password-login=yes
/ip service enable telnet
/ip service enable ftp
/ip service enable www
/ip service set winbox address=0.0.0.0/0
/user set admin password="admin123"
/log info "Security hardening rollback applied."
