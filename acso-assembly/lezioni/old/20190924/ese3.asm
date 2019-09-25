#traduzione di ese3.c
#int sum(int a, int b){
#	int d;
#	d = a+b;
#	return d;
#}
#
#void main(){
#	int a,b,c;	
#	a=5;
#	b=3;
#	c=sum(a+b);
#	return 0;
#}
# NO AREA .data PERCHÉ NO VARIABILI GLOBALI. Variabili locali su registi o su pila.
# queste 3 variabili sono caricate nei registri s per convenzione MIPS
# s0<-a, s1<-b, s2<-c
.text
.global MAIN
MAIN:	li $s0, 5
		li $s1, 3
		#adesso chiamata a funzione e quindi sposto s0 in a0 e s1 in a1
		move $a0, $s0
		move $a1, $s1
		jal SUM #chiamo funzione
		move $s2, $v0 #recupero il risultato della sum (v0) e la mette in s2
		li $v0, 10
		syscall #esce

#salviamo il registro di d sulla pila, come si fa? con lo stack pointer. Ricordiamo che la pila va dagli indirizzi alti a quelli bassi. Sposto il puntatore di 4 celle e poi faccio la push
SUM:	addiu $sp, $sp-4 #sottraggo di 4 per far spazio sulla pila
		sw $s0, 0($sp)	#adesso ho preso il mio s0
		add $s0, $a0, $a1 #somma parametri
		move $s0, $v0 #preparo valore per la return ma prima di restituire, ripristino s0 col valore che aveva nel main e rimetto a posto lo stack pointer
		lw $s0, 0($sp)
		addiu $sp, $sp, 4
		jp $ra

