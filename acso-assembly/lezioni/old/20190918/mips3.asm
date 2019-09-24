lw $t0, 100($s0)
# carica la parola (load word) dalla cella di memoria di di indirizzo
(num1 + $s0) in $t0
sw $t0, 100($s0)
# salva la parola (store word) in $t0 all'indirizzo (num1 + $s0)
li $v0, 4
# carica la costante 4 in $v0 (load immediate)
la $a0, 100
# carica l'indirizzo (load address) num1 in $a0