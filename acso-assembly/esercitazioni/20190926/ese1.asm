# non usare fp, variabili allocate nei registri, salvare solo i registri necessari
# 4 richieste:
# 1) Codice MIPS della sezione dichiarativa globale e indirizzo iniziale della variabile
#	Le variabili globali sono messe sulla parte statica della memoria, che va dal basso verso l'alto, sullo heap

# .eqv sono come delle etichette per dei valori, è una traduzione delle define, delle macro
.eqv	N	16	#così definisco la macro che sostituisce 16 a N (#define N 16)

.data
BYTE:	.word 64	#int byte = 64; quello che segue word NON È IL NUMERO DI BYTE MA CIÒ CHE C'È DENTRO
ELEM:	.word		#lascia una parola di memoria non inizializzata
#space lascia il numero di byte definito successivamente, per cui la riga sopra potevo scriverla come .space 4
#LIST:	.space N	#si potrebbe scrivere così ma se si è in dubbio usare i numeri, per cui riscrivo così:
LIST:	.space 16

#Gli indirizzi in memoria. La macro NON È SALVATA in memoria.
#Quelli statici (successivi a .data) sono salvati a partire da 0x1000 0000.
#BYTE parte dal primo disponibile ed è una word (quindi occupa 32 bit, 4 byte)
#ELEM parte da inizio+4 ed occupa 4 byte a partire da 0x1000 0004
#LIST occupa 16 byte in memoria (dato che 1 char occupa 1 byte e ci sono 16 char), a partire da 0x1000 0008
#quello dopo inizierà a 0x1000 0018


# 2) Codice MIPS dello statement da tradurre di MAIN 
# main è funzione chiamante e si deve salvare sulla stack i registri temporanei, a0 - a3 e v0 e v1 nel caso in cui gli servano e se vengono modificati dal chiamato
# in questo caso non serve salvare nulla perché la funzione main non fa nulla prima della chiamata a funzione.
# prima eseguo N-1
li $t0, N
subi $a0, $t0, 1

lw $a1, BYTE
jal BINARY

lw $t0, 0($v0) #carico il valore di ritorno da v0 in t0
sw $t0, ELEM #salvo ELEM su $t0

# 3) area e registri di BINARY
#occhio che gli indirizzi sono prima alti e poi si abbassano piano piano (stack)
#variabili: i, val, p
#i		$a0
#val	$a1
#p		$s0

#area di attivazione. Contenuto simbolico =/= esedecimale
#binary è sia chiamante che chiamata (quest'ultima sicuramente), qundi salvare i registri s0-s7 utilizzati che poi sarebbero sovrascritti.
#bisogna salvare il registro s0 perché viene utilizzato dalla funzione binary e $ra perché è una chiamata annidata e serve sapere dove bisogna saltare
#s0 a 0 e ra a 4 byte
# 4) codice MIPS della funzione BINARY
BINARY:
addiu	$sp, $sp, -8	#aumenta lo stack pointer di 8
.eqv	RA, 4			#spiazzamento di registro ra salvato
.eqv	S0, 0			#sp. reg. s0 salvato
sw		$ra, RA($sp)	#salva reg ra
sw		$s0, S0($sp)	#salva reg s0

# p = &list[i]
la		$t0, LIST		#carica ind iniz di LIST
addu	$t0, $t0, $a0	#calcola ind di LIST [I]
move	$s0, $t0		#aggiorna puntatore p

#if(i<0)
IF:		bge $a0, $zero, ELSEIF	#confronto I<0
		la $v0, LIST 			#prepara valusc ind LIST
		j ENDIF					#vai a ENDIF
#ricordarsi di spliare le pile delle funzioni ricorsive
ELSEIF:	lw		$t1, ($s0)		#carica parola *P
		bne		$t1, $a1, ELSE	# confronta *p == val
		move	$v0, $s0		# prepara valusc varloc P
		j ENDIF					# goto endif
ELSE:	srl		$a0, $a0, 1		# calcola I/2 (divisione intera)
		subi	$a0, $a0, 1		# calcola ... -1
		addi	$a1, $a1, 1		# calcola VAL + 1
		jal		BINARY			# chiamata ricorsiva
ENDIF:	lw		$s0, S0($sp)	# ripristina reg s0
		lw		$ra, RA($sp)	# ripristina reg ra
		addiu	$sp, $sp, 8		# elimina area di attivazione
		jr		$ra				# rientra a chiamante

