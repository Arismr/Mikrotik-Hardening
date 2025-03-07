######################################
# MikroTik Security Hardening Script #
# Author: Arismr                      #
# Version: 1.0                         #
# Purpose: Harden MikroTik RouterOS    #
######################################

########## Logging Setup ##########
/system logging action set memory memory-lines=1000
/system logging add topics=firewall action=memory
/system logging add topics=critical action=memory
/system logging add topics=info action=memory

########## Disable Unnecessary Services ##########
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set www disabled=yes
/system ssh set strong-crypto=yes allow-none-crypto=no always-allow-password-login=no
/log info "Disabled Telnet, FTP, and HTTP. Hardened SSH security."

########## Secure Winbox ##########
/ip service set winbox address=192.168.1.0/24
/log info "Restricted Winbox access to internal network."

########## Firewall Hardening ##########
/ip firewall filter add chain=input connection-state=invalid action=drop comment="Drop invalid packets"
/ip firewall filter add chain=input protocol=icmp limit=5,5 action=accept comment="Allow limited ICMP"
/ip firewall filter add chain=input in-interface=ether1 action=drop comment="Drop WAN input"
/log info "Firewall rules applied."

########## Enforce Strong Password Policy ##########
/user set admin password="SecurePassword!123"
/log info "Admin password updated."

########## Final Logging ##########
/log info "MikroTik security hardening script executed successfully."
