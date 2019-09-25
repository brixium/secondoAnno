.data
VETT: 	.word 1,9,3,4,3,1,5,7,8,2,3
MAX: 	.space 4
P:	.space 4
I:	.space 4

.text
.global MAIN
MAIN:	lw $t0, VETT
	sw $t0, MAX
	la $t0, VETT
	sw $t0, P #ora indirizzo VETT
	sw $zero, I
LOOP:	lw $t0, I
	li $t1, 10
	bge $t0, $t1, ENDLOOP
	#if (*p>max)
	la $t0, P
	lw $t0, 0($t0)
	lw $t1, MAX
	bge $t1, $t0, ENDIF
	sw $t0, MAX
ENDIF:	lw $t0, P #i++ che però è di 4 in 4
	addiu $t0, $t0, 4
	sw $t0, P
	#non so se ste 3 sono corrette
	lw $t0, I
	addiu $t0, $t0, 1
	sw $t0, I
	j LOOP
ENDLOOP:
	li $v0, 10
	syscall #exit
