#!/bin/bash
function log {
  echo "=> $1"  >&2
}
log ""
log ""
log "add custom alias to .bashrc"
cat <<EOFBASH >> ~/.bashrc
alias c='clear'
alias ~='cd ~/'
alias mk='cd ~/MyKeys/'
alias gh='cd ~/GitHub/'
alias glab='cd ~/GitLab/'
alias vb='vim ~/.bashrc'
alias vz='vim ~/.zshrc'
alias kb='ssh-add -k ~/MyKeys/bartron.key'
alias kh='ssh-add -k ~/MyKeys/home.key'
alias gs='git status'
alias gpom='git push origin master'
EOFBASH
log ""
log ""
log "source .bashrc"
source ~/.bashrc
log ""
log ""
log "DONE :-)"
log ""
log ""
