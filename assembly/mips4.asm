#Procedura MIPS per memorizzare una parola dalla cella di
#memoria all’indirizzo num1 all’indirizzo num2, lasciando una
#copia in $t0

#ho indirizzo num1 e voglio trasferirlo su num2 ma voglio tenere una copia in $t0
	
#nopeify
#la $t0, num1 (qui num1 è un indirizzo di memoria e non un offset)
#li $t0,num2

lw $t0, num1($s0)
sw $t0, num2($s0)