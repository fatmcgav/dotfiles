## Additional Aliases
#

# Make sure Vim uses system ruby
# alias vim='rvm system do /usr/local/bin/vim $@'
#
function vim() {
  if test $# -gt 0; then
    env vim "$@"
  elif test -f Session.vim; then
    env vim -S
  else
    env vim -c Obsession
  fi
}

# Util aliases
alias whatismyip='curl ipinfo.io/ip'


# SSH using TERM
alias ssh='TERM=xterm-color ssh'

# LS aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -alh'

# Tmux aliases
alias tmn='tmux new -As'
alias tmnc='tmux new -As $(basename $(pwd))'
alias tml='tmux list-sessions'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tmrs='tmux rename-session -t'

# Vagrant aliases
alias vst='vagrant status'
alias vup='vagrant up --no-parallel'
alias vr='vagrant reload'
alias vrp='vagrant reload --provision'
alias vh='vagrant halt'
alias vpr='vagrant provision'
alias vdestroy='vagrant destroy'
alias vfd='vagrant destroy -f'
alias vs='vagrant suspend'
alias vres='vagrant resume'
alias vbl='vagrant box list'
alias vssh='vagrant ssh'

# Util aliases - match anywhere in command
alias -g G='| egrep'
alias -g H='| head'
alias -g T='| tail'
alias -g WC='| wc -l'

# Bundler aliases
alias bi='bundle install'
alias biq='bundle install --without system_tests'
alias be='bundle exec'
alias br='bundle exec rake'
alias bu='bundle update'

# Git flow aliases
alias gff='git flow feature'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'

# Docker-machine aliases
alias dm-ssh='docker-machine ssh `docker-machine active`'
alias dm-ip='docker-machine ip `docker-machine active`'
alias dm-env='docker-machine env `docker-machine active`'
alias dm-inspect='docker-machine inspect `docker-machine active`'
alias dm-config='docker-machine config `docker-machine active`'


# Openstack token utilities
function ostoken() {
  token=$(openstack token issue -c id -f value)
  echo $token
}

function oshttp() {                                     
  token=$(openstack token issue -c id -f value)
  methods=(GET POST PUT DELETE)
  if ((${methods[(Ie)$2]})); then
    method=$2
  else 
    method='GET'
  fi

  http $method $1 "X-Auth-Token:$token"
}

# Ansible SSH
# alias assh="cd $WORK/infra/master_i/ansible && ssh -F ./ssh_config $1"
function assh () {
  host="$1"

  root=$(git root)
  if [ $? -eq 0 ]; then
    cd "${root}/ansible"
    ssh -F ./ssh_config "$host"
  else
    cd $WORK/infra/master_i/ansible
    ssh -F ./ssh_config "$host"
  fi
}

function bssh () {
    host="$1"
    args="${@:2}"
    cd $WORK/infra/master_i/ansible
    vault ssh -role bastion -mode otp -user-known-hosts-file=.known_hosts $@ -F ./ssh_config
}

