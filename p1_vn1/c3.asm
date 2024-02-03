.data 
	promptStart: .asciiz "Program starts\n"
	promptF: .asciiz "f = "
	newLine: .asciiz "\n"
	promptEnd: .asciiz "Program ends\n"
.text
	li $s0, 0
	li $s1, 3
	li $s2, 5
	#Prompting Start
	li $v0, 4
	la $a0, promptStart
	syscall
	loop:
		#Condition for stop
		beq $s0, 5, exit
		
		#Arithmetic Process
		add $t0, $s0, $s1
		sub $t0, $t0, $s2
		
		#Increase index - $s0
		addi $s0, $s0, 1
		
		#Display lead
		li $v0, 4
		la $a0, promptF
		syscall
		
		#Display F each cycle
		li $v0, 1
		move $a0, $t0
		syscall
		
		#New line
		li $v0, 4
		la $a0, newLine
		syscall
		
		j loop
		
	exit:
	
	#Prompting End
	li $v0, 4
	la $a0, promptEnd
	syscall
	
	#Exit
	li $v0, 10
