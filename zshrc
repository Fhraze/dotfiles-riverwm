# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fhraze/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#
#  Theming
#

PROMPT='[%F{magenta}%n%f@%F{cyan}%m%f %B%~%b] %B%F{red}>%f%b'
RPROMPT='[%F{yellow}%?%f]'

#
#  Functionality
#

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

#
#  Aliases and Paths
#

typeset -U path PATH
path=(~/.local/bin $path)
export PATH

alias river='dbus-launch --sh-syntax --exit-with-session river'

alias find='fd'
alias grep='rg'
alias ls='eza --sort=type --icons=always'

alias ff='fastfetch'
