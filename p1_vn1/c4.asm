.data
	promptStart: .asciiz "Loop starts\n"
	promptEnd: .asciiz "Loop ends\n"
	myArray: .space 40
.text 
	li $s0, 10
	li $t0, 40
	#Prompt Starting message
	li $v0, 4
	la $a0, promptStart
	syscall
	
	
	loop:
		#Condition Stopping the Loop
		beq $s0, 0, exit
		#Arithmetic and Assignment
		addi $s1, $s0, 2
		sw $s1, myArray($t0)
		#Array Index increment
		subi $t0, $t0, 8
		#Index change
		subi $s0, $s0, 2
		j loop
	exit:
	
	#Prompt Ending message
	li $v0, 4
	la $a0, promptEnd
	syscall
	
	#Exit
	li $v0, 10
	
	
	
	
	
