gomkdir(){ ## Créer un dossier et se déplacer dedans
    mkdir $1 && cd $_
}

# quickly edit and source .zshrc
alias vz="vi ~/.zshrc"
alias sz=" source ~/.zshrc; echo '~/.zshrc sourced'"

# IP alias and functions
alias ip="ifconfig -a | egrep -A 7 '^en0' | grep inet | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])' | head -n 1"
alias myip="curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'"

# Pretty print the PATH
alias path='echo; tr ":" "\n" <<< "$PATH"; echo;'
