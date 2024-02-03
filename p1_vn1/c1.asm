.data
	prompt1: .asciiz "Hello, may I have you name, please? \n"
	prompt2: .asciiz "Welcome, "
	name: .space 100
.text
	#Prompt for name input
	li $v0, 4
	la $a0, prompt1
	syscall
	
	#Enter name
	li $v0, 8
	la $a0, name
	li $a1, 100
	syscall
	
	#Display output lead
	li $v0, 4
	la $a0, prompt2
	syscall
	
	#Display name after lead
	li $v0, 4
	la $a0, name
	syscall
	
	#Exit
	li $v0, 10
