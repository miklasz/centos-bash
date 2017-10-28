#!/bin/bash
function log {
  echo "=> $1"  >&2
}
log ""
log "ADD GIT"
log ""
sudo yum -y install git
log ""
log "ADD WGET"
log ""
sudo yum -y install wget
log ""
log "DOWNLOAD AND ADD HTOP REPO"
log ""
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
rpm -ihv epel-release-7-10.noarch.rpm
log ""
log "ADD HTOP"
log ""
sudo yum -y install htop
log ""
