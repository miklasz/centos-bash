#!/bin/bash

function log {
  echo "=> $1"  >&2
}
log ""
log ""
log "Enable my subnet for ssh"
iptables -A INPUT -p tcp -s YOUR_IP_ADDRESS -m tcp --dport 22 -j ACCEPT
log ""
log ""
log "SAVE iptables to /etc/sysconfig/iptables"
sudo iptables-save
log ""
log ""
log "show all the rules"
log ""
log ""
sudo iptables -S
log ""
log ""
log "DONE :-)"
log ""
log ""
