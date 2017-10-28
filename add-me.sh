#!/bin/bash
function log {
  echo "=> $1"  >&2
}
log ""
log ""
log "Add Bartron"
# Add my user
sudo useradd -m -s /bin/bash bartron
sudo mkdir /home/bartron/.ssh
sudo chown bartron:wheel /home/bartron/.ssh
sudo touch /home/bartron/.ssh/authorized_keys
log ""
log ""
log "add pub key"
sudo cat > /home/bartron/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGnNrrrN1lVXvGWKWKvRUFo63KY4C0O2dM9xlJJ/WOTsO4w/7WcGtJUtzVAGH8XT9oPYaXaoD7I954KbPZ8lNUa8/J9mNAhRE7dMkTbj6xV3oYG6aIhutow03pxla9ihW11tpnzgzpihEu9ErxBRkNRRPIYSwqUKm2awbWLzah/cqDZ3q2qJ3Qa0FdKCWVbP3l2CA4osG5bSeA6VbGA6QG8vkREaxjVRxj1aCsn/abmHlcKn7fFgU2+m0gAcVuW/COyR/0AKg7PTu3kZchhbcFA5ThTrcdJsKTJSv1/mWwTEgkolrxgoF9S9tTyNq48YlpjUnghANmgjunwGTSbBx7
EOF
log ""
log ""
sudo chown bartron:wheel /home/bartron/.ssh/authorized_keys
log "add bartron to sudoers"
# Allow passwordless privilege escalation
sudo cat >> /etc/sudoers <<EOF
bartron    ALL=(ALL)       ALL
EOF
log ""
log ""
log "choose password for console use"
log ""
log ""
#setup password for bart
sudo /usr/bin/passwd bartron
log "DONE :-)"
log ""
log ""
