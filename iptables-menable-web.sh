#!/bin/bash

function log {
  echo "=> $1"  >&2
}
log ""
log ""
log "Enable http:"
sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
log ""
log ""
log "ENABLE https:"
sudo iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
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
