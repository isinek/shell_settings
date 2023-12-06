alias ls='ls --color=auto'
alias ll='ls -algh'
alias less='less --RAW-CONTROL-CHARS'
alias grep='grep --color=auto'

alias ..='cd ../'
alias ...='cd ../../'
alias cdl='cd $1 && ll'

alias mkcd='mkcd_alias() { mkdir -p "$1"; cd "$1"; }; mkcd_alias'

alias gitk='git log --all --graph --decorate --oneline'
alias gd='git diff --histogram'

alias nv='nvim'

