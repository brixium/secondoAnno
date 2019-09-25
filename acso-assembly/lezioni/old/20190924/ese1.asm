## DATI GLOBALI C
#int vett[10] = {1,9,3,4,3,1,5,7,8,2,3};
#int max, i;
## MAIN
#void main(){
#	max = vett[0];
#	for(i=0; i<10; i++)
#		if(vett[i] > max)
#			max = vett[i];
#	return 0;
#}

# i _dati globali_ sono .data
.data
#c'è del codice in questi errori
VETT: .word 1,9,3,4,3,1,5,7,8,2,3
#se non fosse stato inizializzato nel momento della dichiarazione sarebbe stato .space 40
MAX: 	.space 4
I:		.space 4
#in totale l'area di memoria allocata per i dati sono 48 byte

.text #segmento codice
.global MAIN #dichiaro etichetta globale che indica la prima istruzione del mio programma
MAIN:	lw $t0, VETT #carico in memoria il primo elemento del vettore con una _pseudoistruzione_ (load word con etichetta), poi convertita dal compilatore con indirizzo e spiazzamento
		sw $t0, MAX #altra pseudo perché ha etichetta
# con queste due righe sopra scritte ho realizzato la prima riga in C
		sw $0, I #sempre pseudo
LOOP:	lw $t0, I #creo etichetta loop per fare un bel salto che traduce il for e carico I dentro a t0
		li $t1, 10 #carico 10 in t1
		bge $t0, $t1, ENDLOOP #confronto: se I(t0) è >= 10(t1), ho finito e salto a ENDLOOP
		lw $t1, VETT # istruzione dentro condizione if
		lw $t0, I	#carico I in t0
		sll $t0, $t0, 2 #moltiplicazione per 4 di t0 = I
		addu $t0, $t1, $t0 #somma unsigned di indirizzi
		lw $t0, 0($t0) #t0 è indirizzo di vet[i], in $t0 ci metterò il valore
		##con questo ho recuperato vet[i] dentro alla condizione del for. Adesso recupero max
		lw $t1, MAX
		ble $t0, $1, ENDIF #confronto if: se la condizione è verificata, salto, altrimenti proseguo
		sw $t0, MAX
ENDIF:	lw $t2, I #fine ciclo, aumento i (i++)
		addiu $t2, $t2, 1 #incremento di 1
		sw $t2, I #store word I dentro t2
		j LOOP #ritorno all'inizio del loop
ENDLOOP:	#faccio la syscall exit(10)
		li $v0, 10
		syscall
##FINE.
