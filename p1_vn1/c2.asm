.data
	promptInputA: .asciiz "Enter a number for a: "
	promptInputB: .asciiz "Enter a number for b: "
	promptInputC: .asciiz "Enter a number for c: "
	promptInputD: .asciiz "Enter a number for d: "
	display: .asciiz "Result (F) = "
.text
	#Prompting A
	li $v0, 4
	la $a0, promptInputA
	syscall
	#Reading A
	li $v0, 5
	syscall
	move $t0, $v0
	#Prompting B
	li $v0, 4
	la $a0, promptInputB
	syscall
	#Reading B
	li $v0, 5
	syscall
	move $t1, $v0
	#Prompting C
	li $v0, 4
	la $a0, promptInputC
	syscall
	#Reading C
	li $v0, 5
	syscall
	move $t2, $v0	
	#Prompting D
	li $v0, 4
	la $a0, promptInputD
	syscall
	#Reading D
	li $v0, 5
	syscall
	move $t3, $v0
	
	#Arithmetic Process
	add $s0, $t0, $t1
	add $s1, $t2, $t3
	addi $t1, $t1, 3
	sub $s0, $s0, $s1
	add $s0, $s0, $t1
	
	#Display leading
	li $v0, 4
	la $a0, display
	syscall
	
	#Display output
	li $v0, 1
	move $a0, $s0
	syscall
	
	#Exit
	li $v0, 10
	syscall
	
