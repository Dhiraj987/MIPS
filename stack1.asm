#x:$t1


	addi $t1,$t0,12		#test value for x is 12
	addi $t2,$t1,-2		#x-2 in $t2
	addi $t3,$t1,5		#x+5 in $t3
	mul $t4,$t2,$t3		#store ()*() into $t4

	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,10
	syscall