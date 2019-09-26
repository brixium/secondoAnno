analizziamo la parte dati

		.data
STRUCT:	.space	20	#20 byte per struct
VECT:	.space	12	#12 byte struct
INT:	.word	23	#4 byte per la word, inizializzata a 23
#per cui la dimensione totale è 20+12+4 = 36 byte in decimale, 24 in esadecimale con offset di 2

		.text
		.global	MAIN
MAIN:	li	$t0, 0XFFF0 ABCC #pseudo-istruzione, che viene spezzata in due istruzioni
		sw	$t0, STRUCT
		lw	$t1, VECT
		beq	$t0, $t0, MODULE
MAINEND:syscall

#quanti byte occupa questo primo modulo per .text? 6x4 = 24 byte (a partire al MAIN e finisce con MAINEND)
	6 = n.istruzioni totali, una volta convertita la pseudo
	4 = n.byte per istruzione (32 bit == 4 B)
	= 18 byte in HEX
#altro modulo
		.data
ALPHA:	.byte 'Y'	#1 byte (=dim tot HEX e DEC)
		.text
		.global	MODULE
RESTART:lw		$t3, INT
MODULE:	lb		$t4, ALPHA
		sub		$t4, $t4, $t3
		beq		$t4, $0, RESTART
MODEND:	j		MAINEND

# queste istruzioni occupano 5x4 = 20 byte (14 in HEX)

-----------------------
TENGO a mente il modulo MAIN di prima
# inserire per ogni istruzione l'indirizzo e per ogni dato l'indirizzo
# dati:
# 20 byte in DEC -> 0x0  non inizializzato
# 12 byte in DEC -> 0x14 non inizializzato
# 4 byte  		 -> 0x20 inizializzato a 23
# testo:
# INDIRIZZO	| ISTRUZIONE
#	0		| lui $t0, FFF0			#queste due righe sono della prima pseudo-istruzione
#	4		| addi $t0, $t0, ABCC	#e questa seconda potrebbe anche essere una ori
#	8		| sw $t0, 0000($gp)		#qualche discorso sul mettere a zero
#	C		| lw $t1, 0000($gp)		#qua si allinea a zero perché sta nel campo dati
#	10		| beq $t0, $t0, 0000	#MODULE la allineo a 0 perché fa parte di un altro modulo
#	14		| syscall

Tabella dei simboli
MAIN	T	0000 0000	
MAINEND	T	0000 0014
STRUCT	D	0000 0000
VECT	D	0000 0014
INT		D	0000 0020

Tabella di rilocazione
INDIRIZZO	| CODICE OPERATIVO	| simbolo
	8		| 		sw			| STRUCT
	C		|		lw			| VECT
	10		|		beq			| MODULE
------------------------
Tengo a mente il modulo MODULE di prima e faccio le stesse cose
--------
Indirizzo base del testo del main: 0x0040 0000, base dei dati: 0x1000 0000 (sono standard)
module (offset col main) 0x0040 0018, base dei dati 0x1000 002
il global pointer viene messo con l'offset di 8000

