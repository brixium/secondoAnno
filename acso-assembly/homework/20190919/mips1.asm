#Scrivere una sequenza di istruzioni che scrive il valore –1 nel registro s6 se il bit in settima posizione (da
#destra) del registro s0 vale 1 (altrimenti s6 rimane inalterato). Si suppone che i 16 bit più significativi di s0
#siano tutti a 0.
#NO PSEUDO, MAX 3

#maschera tra $s6 e il bit in settima posizione da destra a 1, tutto il resto a zero.
add $t1, $zero, 64 #dentro t1 ho la maschera
#add $s0, $zero, $t1 #caso in cui ho $t1 == $t2
and $t2, $t1, $s0 #eseguo il bitwise and tra $t1 (maschera) e $s0 (valore da controllare)
# if(t2 == t1)
#	s6 = -1
#
bne $t1, $t2, END #se t1 è diverso da t2, salto alla riga con la label END
add $s6, $zero, -1 #altrimenti salva in $s6 il valore -1
END:

# SOLUZIONE.
# Le prime 2 righe si potevano riassumere con questa:
andi $t3, $s0, 64
#se l'operazione AND tra la maschera e t3 dà come risultato 0, allora il bit non è attivo, pertanto il programma viene fatto saltare e terminare
beq  $t3, $zero, FALSO
#se invece la AND dà come risultato 64, setto -1 dentro al registro $s6
addi $s6, $zero, -1
FALSO: