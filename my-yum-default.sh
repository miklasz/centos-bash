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
log "ADD FAIL 2 BAN"
log ""
yum install -y epel-release
yum install -y fail2ban fail2ban-systemd
log ""
log "CONFIGURE FAIL 2 BAN /etc/fail2ban/jail.local"
log ""
cp -pf /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
cat <<EOFF2B1 > /etc/fail2ban/jail.local
[DEFAULT]

#
# MISCELLANEOUS OPTIONS
#

# "ignoreip" can be an IP address, a CIDR mask or a DNS host. Fail2ban will not
# ban a host which matches an address in this list. Several addresses can be
# defined using space separator.
ignoreip = 127.0.0.1/8 87.127.171.48/29

# External command that will take an tagged arguments to ignore, e.g. <ip>,
# and return true if the IP is to be ignored. False otherwise.
#
# ignorecommand = /path/to/command <ip>
ignorecommand =

# "bantime" is the number of seconds that a host is banned.
bantime = 600

# A host is banned if it has generated "maxretry" during the last "findtime"
# seconds.
findtime = 600

# "maxretry" is the number of failures before a host get banned.
maxretry = 5
EOFF2B1
touch /etc/fail2ban/jail.d/sshd.local
cat <<EOFF2B2 > /etc/fail2ban/jail.d/sshd.local
[sshd]
enabled = true
port = ssh
#action = firewallcmd-ipset
logpath = %(sshd_log)s
maxretry = 5
bantime = 86400
EOFF2B2
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
systemctl enable firewalld
systemctl start firewalld
systemctl enable fail2ban
systemctl start fail2ban 
