# Indicare il risultato dell’esecuzione dei programmi degli esercizi 3 e 4 nei casi seguenti.
#contenuto dei registri | 	s0 in prog. 3	|	s0 in prog. 4	|
#casi 1-3 e 1-4:	-------------------------------------------------
#$t0 = 0x 0000 0005	|	1		|	2		|
#$t1 = 0x FFFF FFF0	|			|			|
#casi 2-3 e 2-4:	-------------------------------------------------
#$t0 = 0x FFFF FFF1	|	1		|	1		|
#$t1 = 0x FFFF FFF0	|			|			|
#			-------------------------------------------------
#prog. 3
#caso 1-3, t0= 5, t1= -16, $s0 = 2
add $t0, $zero, 0x00000005
add $t1, $zero, 0xFFFFFFF0
add $s0, $zero, 1
#caso 2-3, t0 = -15, t1= -16, s0 = 2
add $t0, $zero, 0xFFFFFFF1
add $t1, $zero, 0xFFFFFFF0
add $s0, $zero, 1
#prog. 4
#caso 1-4, t0= 5, t1= -16, s0= 3
add $t0, $zero, 0x00000005
add $t1, $zero, 0xFFFFFFF0
add $s0, $zero, 2
#caso 2-4, t0 = -15, t1= -16, s0 = 2
add $t0, $zero, 0xFFFFFFF1
add $t1, $zero, 0xFFFFFFF0
add $s0, $zero, 1
#programma 3 == programma 4
seq $t3, $t0, $t1	# if t0 == t1, t3 = 1, else t3 = 0
beq $t3, $zero, DUE	# if t3 == 0, branch to DUE
add $s0, $zero, 2	# $s0 = $s0+2 (if t1==t0)
DUE: sgt $t3, $t1, $t0	# if t1 > t0, t3 = 1, else t3 = 0
beq $t3, $zero, UNO	# if t3 == 0, branch to UNO
add $s0, $zero, 1	# $s0 = 1 (if t1>t0)
UNO: add $s0, $s0, 1	# ++$s0 (always)