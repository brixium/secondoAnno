#TEMA D'ESAME 23 LUGLIO 2018
.eqv 	N, 4 #è la define
.data	#allocata a partire dall'indirizzo 0x 1000 0000
VECTOR:		.space 16	#arriva a 0x1000 0010
ADDRESS:	.space 4	#arriva a 0x1000 0014
DATO:		.space 4	#arriva a 0x1000 0018

MAIN:		
		lw $a0, DATO
		jal SEARCH
		sw $v0, ADDRESS
SEARCH: 
		#value sta su a0, assegnamo s0 a counter e poi lo salviamo sulla pila
		addiu $sp, $sp-4
		sw $0, 0($sp)
		li $s0, 0	#counter = 0
		li $t0, N
WHILE:	bge $s0, $t0, END_WHILE #diciamo quando si esce, al contrario del C
		la  $t1, VECTOR#faccio l'if: carico il vector di counter (prima indirizzo, moltiplico x 4, sommo e prendo indirizzo)
		sll $t2, $s0, 2
		sum $t1, $t1, $t2
		lw $t3, 0($t1)
		beq $t3, $s0, END_WHILE
		addi, $s0, $s0, 1
		j WHILE

#rimane solamente l'ultima istruzione di C
