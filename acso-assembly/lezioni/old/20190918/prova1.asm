# Procedura MIPS per memorizzare una parola dalla cella di memoria all’indirizzo num1 all’indirizzo num2, lasciando una copia in $t0
lw $t0, num1($zero)
sw $t0, num2($zero)