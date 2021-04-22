.text


la $s0,aa	#loading the first empty space that we need for random integers
la $s3,bb	#loading the second empty space we need to store the modified results

li $s6, 0	#initial number for the iteration for the creation of random integers
li $s7, 13	#number of iterations while crearting the loop-- it terminates before loading the value so no. of ints that we need+1

li $s1,0	#iterations to calculate the modified numbers
li $s2,12	#total numbers of iterations to modifying the random array

LOOP:
li	$a0, 1		#random generator id
li	$a1, 710	# upper bound of the range: (max-min)
li	$v0, 42		# random int range
syscall

addi	$s6, $s6, 1	# increment the number of iterations
beq	$s6, $s7, step1	# branch to step1 if iterations is 12


addi $t4,$a0,58		#setting the lower bound of the randomly generated integers

sw $t4,0($s0)		#storing the random numbers as an array
addi $s0,$s0,4		#increasing the placements of the array


j	LOOP	# Do another iteration 

step1:	
	addi $s0,$zero,268500992	#resetting the address of the $s0 so that the step2 can start from the initial position
	
step2: 	lw $t1,0($s0)		#loading the $s0 stored number (as pointed by the placemenr- 0) into $t1 
	
	move $a0,$t1		#moving the loaded number/argument into $a0 so that the callee can access them
	
	jal modifier		#where the callee is called
	
	sw $v1,0($s3)		#moving the modified results into $s3 or the empty space bb
	addi $s0,$s0,4		#increasing the pointer of $s0 or aa
	addi $s3,$s3,4		#increasing the pointer of $s3 or bb
	
	addi $s1,$s1,1		#upgrading the interations count
	bne $s1,$s2, step2	#conditional check when the loop breaks
	
	
	li $v0,10		#terminates when everything is completed
	syscall
	
	#callee
	modifier: 
	add $s4,$0,$a0		#move the arguments into $s4
	addi $s5,$0,2		#store 2 into $s5
	
	div $s4,$s5	#num mod 2
	mfhi $s5	#move the remainder into $s5
		
	beq $s5,0, even		#jump to even if the remainder is 0
	
	#do this is its not even
	addi $s4,$s4,-48	#subtract 48 from the value 
	
	move $v1, $s4		#move the value/output into $v1
	jr $ra		#jump to the caller
				
			
	#if its even, do this
	even:		
	addi $s4,$s4,27		#add 27 to the value
			
	move $v1,$s4		#move the calculated value into $v1
	jr $ra		#jump to the caller

.data
aa:	.space 48
bb:	.space 48