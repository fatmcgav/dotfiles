# .bashrc

# Global options 
export HISTFILESIZE=999999
export HISTSIZE=999999
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize
shopt -s progcomp
#make sure the history is updated at every command
export PROMPT_COMMAND="history -a;"
# Reload current history
alias u='history -n'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source any bash_completion files
if [ -d /etc/bash_completion.d/ ]; then
    . /etc/bash_completion.d/*
fi

# Source any bashrc.d files
if [ -d $HOME/.bashrc.d/ ]; then
  for x in $HOME/.bashrc.d/* ; do
    test -f "$x" || continue
    test -x "$x" || continue
    . "$x"
  done
fi

# Use liquidprompt
source $HOME/.liquidprompt/liquidprompt

# rvm setup
if [ -e $HOME/.rvm/scripts/rvm ]; then 
  source $HOME/.rvm/scripts/rvm
  PATH=$PATH:$HOME/.rvm/bin
fi

# packer setup
if [ -e /opt/packer ]; then
  PATH=$PATH:/opt/packer
fi

# Set EDITOR
export EDITOR=vim

# Refresh shell
alias reload='source ~/.bash_profile'

# Default to System QEMU connection
export LIBVIRT_DEFAULT_URI=qemu:///system

# Set TERM for ssh sessions
alias ssh='TERM=xterm-color ssh'
 
# IRSSI helper functions
# create the pane with irssi's nicklist
function irssi_nickpane() {
    tmux renamew irssi                                              # name the window
    tmux -q setw main-pane-width $(( $(tput cols) - 21))            # set the main pane width to the total width-20
    tmux splitw -v "cat ~/.irssi/nicklistfifo"                      # create the window and begin reading the fifo
    tmux -q selectl main-vertical                                   # assign the layout
    tmux selectw -t irssi                                           # select window 'irssi'
    tmux selectp -t 0                                               # select pane 0
    tmux send-keys -t 0 "/nicklist fifo" C-m
}

# irssi wrapper
function irssi() {
    irssi_nickpane
    $(which irssi)                                                  # launch irssi
}

# repair running irssi's nicklist pane
function irssi_repair() {
    tmux selectw -t irssi
    tmux selectp -t 0
    tmux killp -a                                                   # kill all panes

    irssi_nickpane
}

# Git aliases
function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done
