# VALE ANCHE COME ESERCIZIO 6

# Come l’esercizio precedente, ma i registri t1 e t0 contengono due indirizzi.
# MAX 7

#Esercizio precedente: 
##Scrivere una sequenza di istruzioni che assegna i valori 1, 2 o 3 al registro s0 in base al risultato del confronto
##tra i registri t1 e t0, che contengono numeri relativi, secondo lo schema seguente: t1 < t0 -> 1, t1 > t0 -> 2 e t1 = t0 -> 3
##MAX 7

seq $t3, $t0, $t1	# if t0 == t1, t3 = 1, else t3 = 0
beq $t3, $zero, DUE	# if t3 == 0, branch to DUE
add $s0, $zero, 2	# $s0 = $s0+2 (if t1==t0)
DUE: sgt $t3, $t1, $t0	# if t1 > t0, t3 = 1, else t3 = 0
beq $t3, $zero, UNO	# if t3 == 0, branch to UNO
add $s0, $zero, 1	# $s0 = 1 (if t1>t0)
UNO: add $s0, $s0, 1	# ++$s0 (always)