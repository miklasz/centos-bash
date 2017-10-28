#!/bin/bash

function log {
  echo "=> $1"  >&2
}
log ""
log ""
log "BLOCK bots and null - recon packets"
sudo iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
log ""
log ""
log "BLOCK syn-flood atack"
sudo iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
log ""
log ""
log "BLOCK XMAS - recon packets"
sudo iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
log ""
log ""
log "ENABLE lo interface"
sudo iptables -A INPUT -i lo -j ACCEPT
log ""
log ""
log "ENABLE ssh access from any location"
sudo iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
log ""
log ""
log "ENABLE established and related connections"
sudo iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
log ""
log ""
log "ALLOW MY SUBNET !!!"
sudo iptables -A INPUT -s 87.127.171.48/29 -j ACCEPT
log ""
log ""
log "ENABLE incoming ICMP to all"
sudo iptables -I INPUT -p icmp -j ACCEPT
log ""
log ""
log "BLOCK ALL"
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P INPUT DROP
log ""
log ""
log "SAVE iptables to /etc/sysconfig/iptables"
sudo iptables-save
log ""
log ""
log "RESTART firewall"
sudo service iptables restart
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



#log "allow my subnet for all incoming traffic 87.127.171.49/29"
#iptables -A INPUT -s 87.127.171.48/29 -j ACCEPT
# log "add ssh to be accesible by my subnet only"
#
# sudo iptables -A INPUT -p tcp -s 87.127.171.48/29 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
