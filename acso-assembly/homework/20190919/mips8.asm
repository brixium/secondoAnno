#Siano L1 e L2 due etichette di un programma. Scrivere una sequenza di istruzioni che assegna al registro s0 il
#valore 1 se L1 > L2, il valore 0 in caso contrario.

bgt L1, L2, FIN #if(L1>L2) branch to FIN;
add $s0, $zero, 0 #s0 = 0
break
FIN:
add $s0, $zero, 1 #s0 = 1