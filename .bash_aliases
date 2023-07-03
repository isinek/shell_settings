alias ll='ls -algh'

alias ..='cd ../'
alias ...='cd ../../'
alias cdl='cd $1 && ll'

alias mkcd='mkcd_alias() { mkdir -p "$1"; cd "$1"; }; mkcd_alias'

alias gitk='git log --all --graph --decorate --oneline'

