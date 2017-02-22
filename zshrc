#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# # Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# # Customize to your needs...
# # Additional aliases
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/aliases.zsh"  ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/aliases.zsh"
# fi

# Testing Zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Prezto
export _ZPLUG_PREZTO="zsh-users/prezto"
zplug "modules/prompt", from:prezto
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Configure Powerlevel9k
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_VCS_GIT_ICON=''
# POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
# POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(rvm time)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

# zplug "modules/command-not-found", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/environment", from:prezto
# zplug "modules/fasd", from:prezto
zplug "modules/git", from:prezto
zplug "modules/gnu-utility", from:prezto
zplug "modules/history", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/osx", from:prezto
zplug "modules/python", from:prezto
zplug "modules/rsync", from:prezto
zplug "modules/ruby", from:prezto
# zplug "modules/ssh", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/tmux", from:prezto
zplug "modules/utility", from:prezto

zplug "hlissner/zsh-autopair", defer:2
zplug "johnhamelink/rvm-zsh"
zplug "peterhurford/git-it-on.zsh"
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin
zplug "Tarrasch/zsh-autoenv", defer:2
zplug "trapd00r/LS_COLORS", use:"LS_COLORS", as:command, defer:3
zplug 'Valodim/zsh-curl-completion'
zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

zplug "b4b4r07/http_code", as:command, use:bin
zplug "mrowa44/emojify", \
	from:github, \
	as:command
zplug "stedolan/jq", \
	as:command, \
	from:gh-r, \
	rename-to:jq


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# dircolors
eval `dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark`

if zplug check "zsh-users/zsh-history-substring-search"; then
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
fi

# ZSH history
setopt append_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt share_history
export HISTSIZE=11000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

export DEFAULT_USER="gavinw"

# Use vim :) 
export EDITOR='vim'
export VISUAL='vim'

# Increase default ulimit
ulimit -n 2048

#
## Setup GO Dev
#

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Homebrew Github
export HOMEBREW_GITHUB_API_TOKEN=8cc8f58ec05aa7963c63d374c7c0cf08286fc3ff

# Additional aliases
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/aliases.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/aliases.zsh"
fi
