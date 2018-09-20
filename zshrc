# Use Zplug
export ZPLUG_HOME=/usr/local/opt/zplug

# Prezto
#export _ZPLUG_PREZTO="zsh-users/prezto"

# Use powerlevel9k theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Configure Powerlevel9k
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=7
POWERLEVEL9K_PYTHON_ICON='\U1F40D ' # 🐍
# POWERLEVEL9K_VCS_GIT_ICON=''
# POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
# POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD=100
# POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(red3 darkorange3 darkgoldenrod gold3 yellow3 chartreuse2 mediumspringgreen green3 green3 green4 darkgreen)
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(darkred orange4 yellow4 yellow4 chartreuse3 green3 green4 darkgreen)
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=black
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=black
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=black
POWERLEVEL9K_BATTERY_LOW_FOREGROUND=black

POWERLEVEL9K_GO_VERSION_BACKGROUND=blue

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_vault_cluster go_version rvm virtualenv battery time)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

# Source zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

# Setup p9k
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Add prezto
zplug "sorin-ionescu/prezto", use:init.zsh, hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto"

# # zplug "modules/prompt", from:prezto
zplug "modules/command-not-found", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/docker", from:prezto
zplug "modules/environment", from:prezto
zplug "modules/fasd", from:prezto
zplug "modules/git", from:prezto
zplug "modules/gnu-utility", from:prezto
zplug "modules/history", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/osx", from:prezto
zplug "modules/python", from:prezto
zplug "modules/rsync", from:prezto
# zplug "modules/ruby", from:prezto
zplug "modules/ssh", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/tmux", from:prezto
zplug "modules/utility", from:prezto

zplug "hlissner/zsh-autopair", defer:2
zplug "peterhurford/git-it-on.zsh"
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin
zplug "Tarrasch/zsh-autoenv", defer:2
zplug "trapd00r/LS_COLORS", use:"LS_COLORS", as:command, defer:3
# zplug 'Valodim/zsh-curl-completion'
# zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

zplug "zsh-users/zsh-autosuggestions", at:v0.4.3, defer:3
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow,bold'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30

# zplug "/usr/local/share/zsh/functions", from:local, use:"*", defer:2


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
  zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_rsa-github' 'id_rsa-k5'
fi


zplug load

export TERM=xterm-256color

# Add to fpath
export fpath=($(brew --prefix)/share/zsh-completions $(brew --prefix)/share/zsh/functions $fpath)

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

# Enable direnv
eval "$(direnv hook zsh)"

# Ctags
alias ctags="`brew --prefix`/bin/ctags"

# Setup Hub
if [[ 'brew info hub'  ]]; then
  alias git="`brew --prefix hub`/bin/hub"
fi

#
## Setup GO Dev
#
export GOPATH=$HOME/Go
# export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# Set Go default version
export GIMME_GO_VERSION='1.8.1'
eval "$(gimme)" 2>/dev/null

# Add coreutils to path
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Add Brew sbin dir to PATH
export PATH="$PATH:/usr/local/sbin"

# Additional aliases
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/aliases.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/aliases.zsh"
fi
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/docker-aliases.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/docker-aliases.zsh"
fi
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/kube-aliases.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/kube-aliases.zsh"
fi

# Setup RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

## Setup Pythn virtualenv
# set where virutal environments will live
export WORKON_HOME=$HOME/.virtualenvs
# Use system Python version
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
# Load virtualenvwrapper if present
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi


# Load gcloud completions
if [[ -s "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "`brew --prefix`/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# Local stuff, not from Git
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/zshrc.local"  ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/zshrc.local"
fi

# Puppet tools
if [[ -d '/opt/puppetlabs/pdk/bin' ]]; then
  export PATH="$PATH:/opt/puppetlabs/pdk/bin"
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
