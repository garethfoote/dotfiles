## Bash config: Gareth Foote (@gaffafoote)

#cd
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'

#GIT
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gsl='git shortlog'
alias gs='git status'
alias gss='git status --short'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
#See files affected by git commit. Requries commit id.
alias git-ci-affected='git show --pretty="format:" --name-only'

export EDITOR=vim
export TERM=xterm-256color
export SVN_EDITOR=vim
export PATH="$PATH:/opt/vagrant/bin"


# SSH - See ~/.ssh/config
# alias ssh-lenny="ssh webdev@192.168.56.51"
# alias ssh-webfaction="ssh foote@foote.webfactional.com"

# ls
if [[ $platform == 'Linux' ]]; then
    alias ls='ls --color=auto'
elif [[ $platform == 'Darwin' ]]; then
    alias ls='ls -G'
    export LSCOLORS=GxFxCxDxBxegedabagaced
fi
alias l='ls -CF --color'
alias la='ls -AF --color'
alias ll='ls -AlF --color'
alias ls='ls -F --color'

alias watch='watch '
alias ack='ack-grep'

#tmux
alias tmux='tmux -2'

# virtualenvwrapper setup
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ls dir colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

source ~/config/tmuxinator.bash

# Show git branch on command line prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\$(parse_git_branch)${debian_chroot:+($debian_chroot)}\w$ "
