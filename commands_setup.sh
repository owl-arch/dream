# Autor: Marcos Antonio de Carvalho
# Descrição: setup de alias de comandos uteis

#  ******************************************
#    Definição dos comandos mais utilizados
#  ******************************************
# Arquivos e Diretórios
alias  l="exa -lF"
alias ll="exa -laF"
alias  k="k -ht"
alias kk="k -a"
alias ld="figlet Diretory Tree | lolcat; tree -dp" # Mostra apenas os diretórios
alias lf="figlet File Tree | lolcat; tree -a"      # Mostra diretórios e arqivos
# SYSTEM
alias os="figlet System | lolcat; neofetch" # Informações sobre Sistema operacional
alias df="figlet pyDF | lolcat; pydf"
alias fs="figlet FileSystem | lolcat; hdparm -f -T -t /dev/sdc; echo; findmnt -lo source,target,fstype,label,options,used -t ext4; echo"
# PROCESS
#alias ps="figlet Process| lolcat; ps | grep -v ps | grep -v grep"
alias ps="figlet Process| lolcat; ps -a -eo user,cmd,pid,%cpu,%mem --sort=-%mem | grep -v ps | grep -v grep | grep -v init | grep -v .vscode  | grep -v VSCOD | grep -v zsh"
alias pstree="figlet Process Tree| lolcat; pstree --color=age "
# DOCKER
alias dc="figlet Docker-Compose | lolcat; docker-compose"
alias d="figlet Docker | lolcat; docker"
# GIT
# Beautiful git log graph shortcut (shown in the top image)
alias gl="git log --oneline --all --graph --decorate  $*"
alias gs="git status"
# alias clone="~/dream/k-git_clone"
alias clone="~/dream/clone.sh"
alias push="~/dream/push.sh"
# DEV
alias python=python3
alias py=python3

