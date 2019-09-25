.text
.global MAIN
MAIN: 	li $s0, 1
		li $s1, 2
		li $s2, 3
		li $s3, 4
		li $s4, 5
		#preparazione primi 4 parametri funct.
		move $a0, $s0
		move $a1, $s1
		move $a2, $s2
		move $a3, $s3
		#il quinto lo passo sullo stack
		addiu $sp, $sp-4
		sw $s4, 0($sp)
		jal BIG_FUN
		move $s5, $v0
		li $v0, 10
		syscall
#main finito, traduciamo big fun. Bisogna salvare $ra nelle funzioni non foglia per mantenere il contenuto nella big-fun
#salvo a0, a1 e a2 
BIG-FUN:	addiu $sp, $sp, -16 #alloco 16 byte sullo stack pointer
			sw $ra, 12($sp)
			sw $a0, 8($sp)
			sw $a1, 4($sp)
			sw $s2, 0($sp)
			#calcolo espressioni da sx a dx e preparo la funzione
			move $a0, $a3 #prepara parametri sums
			lw $a1, 16($sp)
			jal SUMS
			#ripristino a, b e c nei registri dalla pila e li metto in a0
			lw $t0, 8($sp) #era a0
			lw $t1, 4($sp)
			lw $t2, 0($sp) 
			addiu $sp, $sp, 12
			add $t3, $v0, $t2 #somma
			mult $t0, $t1 #moltipl. si fa prima
			mflo $t4 #prendo gli ultimi 32 bit di roba
			add $v0, $t3, $t4
			#ricarico ra e passo al chiamante
			lw $ra, ($sp)
			addiu $sp, $sp, 4
			jr $ra

SUMS:		mult $a0, a1
			mflo $t0
			li $t1, 17
			add $t0, $t0, $t1
			jr $ra
