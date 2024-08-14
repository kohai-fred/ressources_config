# Replace ls with lsd

alias ls="lsd -G --color always"
alias lsa="lsd -GA"
alias lla="lsd -lA"
alias lst="lsd -A --tree --depth 2"
lstd(){
  lsd -A --tree --depth $1
}
