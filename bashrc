# .bashrc

#Global options {{{
export HISTFILESIZE=999999
export HISTSIZE=999999
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize
shopt -s progcomp
#make sure the history is updated at every command
export PROMPT_COMMAND="history -a; history -n;"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source any bash_completion files
if [ -d /etc/bash_completion.d/ ]; then
    source /etc/bash_completion.d/*
fi

# Source any bashrc.d files
if [ -d $HOME/.bashrc.d/ ]; then
    source $HOME/.bashrc.d/*
fi

# }}}
# include liquidprompt {{{
source $HOME/Tools/liquidprompt/liquidprompt

# }}}
# test powerline {{{
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh 

# }}}
# rvm setup {{{
if [ -e $HOME/.rvm/scripts/rvm ]; then 
  source $HOME/.rvm/scripts/rvm
  PATH=$PATH:$HOME/.rvm/bin
fi

# Refresh shell
alias reload='source ~/.bash_profile'

# Default to System QEMU connection
export LIBVIRT_DEFAULT_URI=qemu:///system

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
