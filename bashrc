## Bashrc: Marc Hibbins (@marchibbins)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ------------------------------------------
# General settings
# ------------------------------------------

# Platform name
platform=$(uname)

export EDITOR=vim
export TERM=xterm-256color

# Larger bash history, ignore duplicates
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000

# Append to history, don't overwrite
shopt -s histappend

# Wrap lines correctly after resizing window
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Auto-completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

# Colour for OS X
export CLICOLOR=1

# Use dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# ------------------------------------------
# Aliases
# ------------------------------------------

# cd
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'

# ls
if [[ $platform == 'Linux' ]]; then
    alias ls='ls --color=auto'
elif [[ $platform == 'Darwin' ]]; then
    alias ls='ls -G'
    export LSCOLORS=GxFxCxDxBxegedabagaced
fi

alias l='ls -CF'
alias la='ls -AF'
alias ll='ls -AlF'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'

# Python
alias pym='python manage.py'
alias clearpyc='find . -name "*.pyc" -exec rm {} \;'
alias serve='python -m SimpleHTTPServer'

# ------------------------------------------
# Shortcuts
# ------------------------------------------

# Change into new directory
cdmkdir () {
    mkdir -p "$@" && cd "$@";
}

# ------------------------------------------
# Prompt - credit to @jsummerfield
# ------------------------------------------

parse_virtualenv() {
    if [ -n "$VIRTUAL_ENV" ] ; then
        basename $VIRTUAL_ENV | sed -e 's/\(.*\)/(\1) /'
    fi
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PS1="\n\$(parse_virtualenv)\$(parse_git_branch)\h \e[0;32m\w\e[m\n\$ "

# ------------------------------------------
# Environment
# ------------------------------------------

# Virtualenvwrapper
if [ -x /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Node.js
if [ -x ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi