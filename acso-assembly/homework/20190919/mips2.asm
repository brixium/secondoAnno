# Scrivere una sequenza di istruzioni che scrive il valore –1 nel registro s6 se il bit in decima posizione (da 
# sinistra) del registro s0 vale 1 (altrimenti s6 rimane inalterato).
# NO PSEUDO, MAX 5

add $t0, $zero, 512 # creo la maschera in t0
add $s0, $zero, $t0 #caso in cui ho $t0 == $t1
and $t1, $s0, $t0 # se t1 è diverso dalla maschera t0 allora salto
bne $t0, $t1, END #salto a end
add $s6, $zero, -1
END: