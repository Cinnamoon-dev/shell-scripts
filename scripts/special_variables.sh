#!/usr/bin/env bash

# Cheatsheet

echo "PID da sessão do script: $$" 
echo "Saída do último comando executado: $?"
echo "Operador que seleciona argumentos do terminal: $n (onde n é um número, caso n = 0, o nome do programa executado é selecionado)"
echo "Mostra o número de argumentos passado com o script: $#"
echo "Operador para executar o segundo comando caso o primeiro seja executado com sucesso: &&"
echo "Operador para executar o segundo comando caso o primeiro seja executado com falha: ||" 
echo "Operador que redireciona a saída de um comando para outro arquivo: >"

# ---------------------------------------------------------------------------------------------------------- #
# Problema 1: Saber diferenciar: sessão atual != sessão script
# Usar a variável especial $$ e diferenciar pelo PID

echo "PID da sessão do script: $$"

# ---------------------------------------------------------------------------------------------------------- #
# Problema 2: Descobrir se um comando é builtin
# Usar help + command e a variável $? para diferenciar pela saída
# Usar o command test, ou apenas encapsular os seus modificadores entre [[]], para checar igualdades de saída

help command
declare -i response=$?

# test response -eq 0
[[ response -eq 0 ]] && echo "O comando é um comando builtin do shell" || echo "O comando não é um comando builtin do shell"

# É possível simplificar ainda mais fazendo toda a checagem em uma só linha
help command && echo "O comando é um comando builtin do shell" || echo "O comando não é um comando builtin do shell"

# Para não printar a resposta do comando help basta redirecioná-lo para /dev/null
help command &> /dev/null && echo "O comando é um comando builtin do shell" || echo "O comando não é um comando builtin do shell"


# ---------------------------------------------------------------------------------------------------------- #
# Problema 3: Não quero editar o script toda vez que for testar um comando novo
# Usar o $1 para selecionar o primeiro argumento após a chamada do script
# Testar com o $# se foi passado um argumento
# -ne significa not equal, pois nosso script funciona corretamente recebendo apenas um comando

# Tratamento de erro
[[ $# -ne 1 ]] && echo "Digite um comando" && exit 1

# Ou o tratamento pode ser feito assim
[[ $# -eq 0 ]] && echo "É necessário digitar um comando" && exit 1
[[ $# -gt 1 ]] && echo "Digite apenas um comando" && exit 1

help $1 &> /dev/null && echo "$1 é um comando builtin do shell" || echo "$1 não é um comando builtin do shell"

# ---------------------------------------------------------------------------------------------------------- #

exit 0