#!/bin/bash
function log {
  echo "=> $1"  >&2
}
log ""
log "ADD GIT"
sudo yum -y install git
log ""
log "ADD WGET"
sudo yum -y install wget
log ""
log "DOWNLOAD AND ADD HTOP REPO"
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
rpm -ihv epel-release-7-10.noarch.rpm