# MikroTik Router Security Hardening Script
# Description: Implements security hardening measures for MikroTik RouterOS.

:log info "Current RouterOS version: $[/system resource get version]";

/ip service disable telnet
/ip service disable ftp
/ip service disable www

/ip service set ssh address=<trusted_ip>/32 port=<new_ssh_port>

/user add name=secureadmin group=full password="YourStrongPasswordHere"
# Uncomment the next line once you're sure the new admin works as intended.
# /user remove admin

/ip firewall filter add chain=input action=drop connection-state=invalid comment="Drop invalid connections"

/ip firewall filter add chain=input action=accept connection-state=established,related comment="Allow established/related connections"

/ip firewall filter add chain=input action=drop protocol=tcp dst-port=<new_ssh_port>,443,8291 src-address=!<trusted_ip>/32 comment="Restrict management access"

/ip service set winbox disabled=yes
# Optional
# /ip service set winbox address=<trusted_ip>/32

/system logging add topics=firewall action=memory

/system logging action set remote target=<syslog_server_ip> port=514

:log info "Security Hardening Script Applied Successfully!";
