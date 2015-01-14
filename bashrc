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
source $HOME/Tools/liquidprompt/liquidprompt

# rvm setup
if [ -e $HOME/.rvm/scripts/rvm ]; then 
  source $HOME/.rvm/scripts/rvm
  PATH=$PATH:$HOME/.rvm/bin
fi

# Set EDITOR
export EDITOR=vim

# Refresh shell
alias reload='source ~/.bash_profile'

# Default to System QEMU connection
export LIBVIRT_DEFAULT_URI=qemu:///system

# Set TERM for ssh sessions
alias ssh='TERM=xterm-color ssh'


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
