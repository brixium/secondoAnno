#Dato il programma seguente, indicare in esadecimale il valore dei registri s1-s7 e t2-t4 dopo l’esecuzione. Si
#ricorda che la rappresentazione interna è Little Endian.
	.data
STRINGA:.ascii "abcd"
BYTE:	.word 0x80818283
	.text
	la $t1, STRINGA
	la $t2, BYTE
	lb $s1, 0($t2)
	lh $s2, 0($t2)
	lw $s3, 0($t2)
	lbu $s4, 0($t2)
	lbu $s5, 1($t2)
	lbu $s6, 2($t2)
	lbu $s7, 3($t2)
	lb $t2, 0($t1)
	lb $t3, 1($t1)
	lh $t4, 0($t1)