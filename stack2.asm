.text 

	la $s0,nm 	#loads nm (the random six values that are stored in nm) into $s0
	
	lw $t1, 0($s0)	#gets the first value stored in $s0 and stores it into $t1
	
	addi $t1,$t0,24		#test value for x is 12
	addi $t2,$t1,-2		#x-2 in $t2
	addi $t3,$t1,5		#x+5 in $t3
	mul $t4,$t2,$t3		#store ()*() into $t4

	li $v0,1		#display the results
	move $a0,$t4		#get the result into a0
	syscall
	
	li $v0,10		#terminate the code
	syscall	


.data			#used to load data in the memory
nm: .word 24,72,6,18,43,37	#6 random integers will be stored in the consequitive memory
mm: .word 5:8			#stores 8 5's in the memory right after the 6 random numbers
jj: .space 20			#provides empty space of 20 bytes right after the 8 5's
gg: .word 122			#stores 122 in the memory after the empty space