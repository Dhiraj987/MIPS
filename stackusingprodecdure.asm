 .text 


#index counter -number iteraties 
#we need to run the code 6 times for the 6 values $s2<-- 6
#s0- location for the number we need to process
#$s1 and $s2 is what bounds the iterations

	la $s0,nm 	#loads nm (the random six values that are stored in nm) into $s0-- base address
	
	li $s1,0	#how many numbers did we process, like iteration counter
	addi $s2,$zero,6	#we need to do this 
	
loop:	lw $t1, 0($s0)	#gets the first value stored in $s0 and stores it into $t1
	
	#we need to pass the argument through a registers
	move $a0,$t1	#place the x/t1 into a0
	
	jal calc	#go to the procedure
	
	#return
	#at this case v0 has the product as it is implemented in the code below
	
	move $a0,$v0	#save the product into a0
	li $v0,1	#display the integer
	syscall
	
	
	li $v0,11		#inserting a new line
	li $a0,10
	syscall
	
	addi $s0,$s0,4		#point to the next number
	addi  $s1,$s1,1		#incrementing the $s1	
	bne $s1,$s2, loop	#loop when s1!=s2
	
	li $v0,10		#terminate the code
	syscall	

calc: #here is my procedure
	#a0 has the number we need to work on 

	add $t1,$0, $a0		#store a0 into t1

	addi $t2,$t1,-2		#x-2 in $t2
	addi $t3,$t1,5		#x+5 in $t3
	mul $t3,$t2,$t3		#store ()*() into $t3
	move $v0, $t3		#move the vaklue of $t3 into $v0

	jr $ra	#return flight, it stores the return address
	

.data			#used to load data in the memory
nm: .word 24,72,6,18,43,37	#6 random integers will be stored in the consequitive memory
mm: .word 5:8			#stores 8 5's in the memory right after the 6 random numbers
jj: .space 20			#provides empty space of 20 bytes right after the 8 5's
gg: .word 122			#stores 122 in the memory after the empty space