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
# SSH - See ~/.ssh/config

# ls
if [[ $os == 'Linux' ]]; then
    alias ls='ls --color=auto'
    alias l='ls -CF --color'
    alias la='ls -AF --color'
    alias ll='ls -AlF --color'
    alias ls='ls -F --color'
elif [[ $os == 'Darwin' ]]; then
    alias ls='ls -G'
    alias l='ls -CFG'
    alias la='ls -AFG'
    alias ll='ls -AlFG'
    alias ls='ls -FG'
fi

alias watch='watch '
alias ack='ack-grep'

# virtualenvwrapper setup
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Google Cloud SDK
if [ -f '/Users/gfoote/local/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/gfoote/local/google-cloud-sdk/path.zsh.inc'; fi

# Shell command completion for gcloud
if [ -f '/Users/gfoote/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/gfoote/local/google-cloud-sdk/completion.zsh.inc'; fi

# Python
export PATH="${PATH}:/Users/gfoote/Library/Python/2.7/bin"

source ~/.env

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
