#!/bin/bash

function log {
  echo "=> $1"  >&2
}

log ""
log "enable iptables.services"
log ""
sudo yum -y install iptables-services
log ""
log "enable iptables.services on boot"
log ""
sudo systemctl enable iptables.service
log ""
log ""
log "DONE :-)"
log ""
log ""
