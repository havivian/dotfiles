# General Configuration
alias grep="grep --color=always"
alias ls="ls -aF"
alias reload="source ~/.bash_profile"

# Shell Prompt
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
parse_git_branch() {
  if [ "$1" = "true" ]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/.*(\(.*\)).*/\1/'
  else
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  fi
}

if [ -f ~/.git-completion.bash ]; then
 . ~/.git-completion.bash
fi

# ENV declarations
export BUNDLER_EDITOR=atom
export EDITOR=atom

# Building PATH
export PATH=$PATH:~/bin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:./bin
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
eval "$(direnv hook bash)"

# Ruby
alias be="bundle exec"

# Rails
function groutes() {
  greps=""

  for arg in $@
    do greps="$greps | grep $arg"
  done

  cmd="rake routes$greps"
  echo "Executing: $cmd"
  eval $cmd
}

# Git
function grib() { git rebase -i HEAD~$1; }
function gco() { git checkout $1; }
alias grim="git rebase -i master"
alias grid="git rebase -i develop"
alias gam="git commit --amend"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gsoft!="git reset --soft HEAD^"
alias gbs="git bisect start"
alias gbg="git bisect good"
alias gbb="git bisect bad"
alias gbr="git bisect reset"
alias gbc="git bisect --continue"
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Docker
alias dcu="docker-compose up"
function dcus() { docker-compose up $1; }
alias dcub="docker-compose up --build"
function dcr() { docker-compose run $1; }
