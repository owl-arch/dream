#!/bin/zsh

# Autor: Marcos Antonio de Carvalho
# Descrição: (UPLOAD) faz um push do projeto da maquina local no Github
# Criado: 2023  Refatorado em 2025

# Vai para o diretório do projeto
cd ~/$1 || exit

logfile="./push.log"
rm $logfile

# Horário de inicio 
start=`date +%s`
node=$(uname -n)
now=$(date +'%A, %d de %B de %Y at %H:%M')
pwd=$(pwd)

# Cabeçalho do Log
echo "Push Log" >$logfile 
echo $now >>$logfile 

# Garante a reinicialização do repositório Git
if [ -d .git ]; then
    rm -r .git
fi    
echo "1. Reinicializando repositório Git" >> $logfile
git init >/dev/null 2>&1

# Adiciona todos os alterados
echo "2. Adiciona todos os arquivos alterados no repositório" >> $logfile
git add . >/dev/null 2>&1

# Documenta a atualização
echo "3. Documenta a atualização do repositório" >>$logfile 
git commit -m "Update by $node in $now" >/dev/null 2>&1

# Configura a 'branch' (ramo)
if git rev-parse --verify HEAD >/dev/null 2>&1; then
  echo "4. Configura a branch para 'main'" >>$logfile 
  git branch -M main >/dev/null 2>&1
else
  echo "Nenhum commit detectado, branch ainda não existe" >>$logfile
fi

# Adiciona pasta no remote:
echo "5. Adiciona pasta local no remote" >>$logfile 
git remote add $1 git@github.com:owl-arch/$1.git >/dev/null 

# Mostra em letras gigantes o nome do projeto/repositório
figlet "push" | lolcat -t -p 1
echo "Projeto: $1 ($pwd)" | lolcat -t -p 3

# Atualiza o projeto no github
echo "6. Atualiza o projeto no repositório do Github" >>$logfile 
git push -uf $1 main # >/dev/null 2>&1

# Remove pasta do remote
echo "7. Remove pasta local do remote" >>$logfile 
git remote remove $1 >/dev/null 2>&1

# Horário de fim
end=`date +%s`

#-- Runtime 
runtime=$((end-start))
echo
date
echo "Runtime $runtime seconds"
echo "Runtime $runtime seconds" >>$logfile 
echo ""

# Volta para o diretório de onde veio
cd - >/dev/null 2>&1

