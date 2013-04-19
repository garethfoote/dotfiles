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
alias gs='git status'
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
alias l='ls -CF'
alias la='ls -AF'
alias ll='ls -AlF'

# virtualenvwrapper setup
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
