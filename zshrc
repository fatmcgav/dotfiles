# Use Zplug
export ZPLUG_HOME=/usr/local/opt/zplug

# Prezto
#export _ZPLUG_PREZTO="zsh-users/prezto"

# Source zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

# Add prezto
zplug "sorin-ionescu/prezto", use:init.zsh, hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto"

# # zplug "modules/prompt", from:prezto
# zplug "modules/command-not-found", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
# zplug "modules/docker", from:prezto
zplug "modules/environment", from:prezto
zplug "modules/fasd", from:prezto
zplug "modules/git", from:prezto
zplug "modules/gnu-utility", from:prezto
zplug "modules/history", from:prezto
# zplug "modules/python", from:prezto
zplug "modules/rsync", from:prezto
# zplug "modules/ruby", from:prezto
zplug "modules/ssh", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/tmux", from:prezto
zplug "modules/utility", from:prezto

zplug "jonmosco/kube-ps1"
zplug "hlissner/zsh-autopair", defer:2
zplug "peterhurford/git-it-on.zsh"
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin
zplug "Tarrasch/zsh-autoenv", defer:2
zplug "trapd00r/LS_COLORS", use:"LS_COLORS", as:command, defer:3

zplug "alexiszamanidis/zsh-git-fzf", from:github

# exa Setup
export EXA_HOME=/usr/local/opt/exa
zplug "ptavares/zsh-exa", from:github, defer:2

# Taskwarrior
zplug "plugins/taskwarrior", from:oh-my-zsh

# zplug 'Valodim/zsh-curl-completion'
# zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
zplug "plugins/fzf", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

zplug "zsh-users/zsh-autosuggestions", at:v0.4.3, defer:3
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow,bold'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30

# zplug "/usr/local/share/zsh/functions", from:local, use:"*", defer:2

# kubectl plugins
zplug "dbz/kube-aliases"
zplug "plugins/kubectl", from:oh-my-zsh

# # zplug "b4b4r07/http_code", as:command, use:bin
# zplug "mrowa44/emojify", \
# 	from:github, \
# 	as:command
#zplug "stedolan/jq", \
#	as:command, \
#	from:gh-r, \
#	rename-to:jq


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# checks if a plugin is installed via zplug
_is_installed() {
  zplug list | grep -q "$@"
}

# Load SSH Identities
if _is_installed 'modules/ssh'; then
  zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_ed25519'
fi

# Load zplug!
zplug load

# OS Specific config
source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"

export TERM=xterm-256color

# dircolors
eval `dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark`

if zplug check "zsh-users/zsh-history-substring-search"; then
	bindkey '\eOA' history-substring-search-up
	bindkey '\eOB' history-substring-search-down
fi


# Quick ZSH reload
function reload() {
  # Reloads ~/.zshrc.
  local zshrc="$HOME/.zshrc"
  if [[ -n "$1" ]]; then
    zshrc="$1"
  fi
  source "$zshrc" && echo 'Reloaded zshrc'
}

# ZSH history
setopt append_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
unsetopt share_history
# setopt share_history
export HISTSIZE=11000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

# Set default username
export DEFAULT_USER="fatmcgav"

# Key bindings
bindkey "^[[1~"  beginning-of-line
bindkey "^[[4~"  end-of-line
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char

# Use vim :)
export EDITOR='vim'
export VISUAL='vim'

# Increase default ulimit
ulimit -n 2048

# # Enable direnv
# eval "$(direnv hook zsh)"

#
## Setup GO Dev
#
export GOPATH=$HOME/Go
# export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# # Set Go default version
# export GIMME_GO_VERSION='1.8.1'
# eval "$(gimme)" 2>/dev/null

# Additional aliases
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/aliases.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/aliases.zsh"
fi
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/docker-aliases.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/docker-aliases.zsh"
fi

# # Setup RVM
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
#   source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# fi

# ## Setup Pythn virtualenv
# # set where virutal environments will live
# export WORKON_HOME=$HOME/.virtualenvs
# # Use system Python version
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
# export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
# # ensure all new environments are isolated from the site-packages directory
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# # use the same directory for virtualenvs as virtualenvwrapper
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# # makes pip detect an active virtualenv and install to it
# export PIP_RESPECT_VIRTUALENV=true
# # Load virtualenvwrapper if present
# if [[ -r /usr/bin/virtualenvwrapper.sh ]]; then
#     source /usr/bin/virtualenvwrapper.sh
# else
#   echo "WARNING: Can't find virtualenvwrapper.sh"
# fi


# Local stuff, not from Git
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local"  ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi

# Puppet tools
if [[ -d '/opt/puppetlabs/pdk/bin' ]]; then
  export PATH="$PATH:/opt/puppetlabs/pdk/bin"
fi

# Taskwarrior aliases
alias in="task add +in"
alias inbox="task in"
alias next="task next"

# ASDF setup
. $(brew --prefix asdf)/libexec/asdf.sh

# Setup Starship prompt
eval "$(starship init zsh)"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/gavinwilliams/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)