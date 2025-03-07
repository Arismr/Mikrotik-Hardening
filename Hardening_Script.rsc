###############################
# MikroTik Security Hardening
# Author: Arismr
# Version: 1.0
# Purpose: Harden MikroTik RouterOS
###############################

###############
# Logging Setup
###############
/system logging action set memory memory-lines=1000
/system logging add topics=firewall action=memory
/system logging add topics=critical action=memory
/system logging add topics=info action=memory

###############
# Disable Unnecessary Services
###############
:if ([/ip service get telnet disabled] = false) do={
    /ip service set telnet disabled=yes
    /log info "Telnet disabled for security."
}
:if ([/ip service get ftp disabled] = false) do={
    /ip service set ftp disabled=yes
    /log info "FTP disabled for security."
}
:if ([/ip service get www disabled] = false) do={
    /ip service set www disabled=yes
    /log info "HTTP disabled to prevent remote attacks."
}
:if ([/system ssh get enabled] = true) do={
    /system ssh set strong-crypto=yes allow-none-crypto=no always-allow-password-login=no
    /log info "SSH hardened with strong encryption."
}

###############
# Secure Winbox
###############
:if ([/ip service get winbox address] != "192.168.1.0/24") do={
    /ip service set winbox address=192.168.1.0/24
    /log info "Restricted Winbox access to internal network."
}

###############
# Firewall Hardening
###############
/ip firewall filter
add chain=input connection-state=invalid action=drop comment="Drop invalid packets"
add chain=input protocol=icmp limit=5,5 action=accept comment="Allow limited ICMP"
add chain=input in-interface=ether1 action=drop comment="Drop WAN input"
/log info "Firewall rules updated."

###############
# Enforce Strong Password Policy
###############
:foreach user in=[/user find] do={
    :if ([/user get $user name] != "admin") do={
        /user set $user password="SecurePassword!123"
        /log info "Password updated for user: \$user"
    }
}

###############
# Final Logging
###############
/log info "MikroTik security hardening applied successfully."
