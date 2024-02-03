.data
	prompt1: .asciiz "Enter number of homeworks: "
	prompt2: .asciiz "Enter average time to complete each homework (in hours): "
	prompt3: .asciiz "Enter number of exercises: "
	prompt4: .asciiz "Enter average time to complete each exercise (in hours): "
	result:  .asciiz "Total work time is: "
.text
main:
	li $a0, 0
	# Prompt user for inputs
	li $v0, 4 
	la $a0, prompt1
	syscall
	# Read 1st integer
	li $v0, 5
	syscall
	move $s0, $v0

	li $v0, 4
	la $a0, prompt2 
	syscall
	# Read 2nd integer
	li $v0, 5
	syscall
	move $s1, $v0
	# Jump to hw_func
	jal hw_func
	
	li $v0, 4
	la $a0, prompt3
	syscall
	# Read 3rd integer
	li $v0, 5
	syscall
	move $s2, $v0

	li $v0, 4
	la $a0, prompt4 
	syscall
	# Read 4th integer
	li $v0, 5
	syscall
	move $s3, $v0
	# Jump to exercise_func
	jal exercise_func

	# Printing result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall

	# Exit program
	li $v0, 10
	syscall
exit:
	#Exit
	li $v0, 10
hw_func:
	addi $sp, $sp, -4 	# Decrement stack pointer
    	sw $ra, 0($sp) 		# Store return address
	mult $s0, $s1 		# Multiply number of homeworks by average time per homework
	mflo $t0 		# Move the result to $t0
	jal total		# Jump to total
	lw $ra, 0($sp)		# Load return address
	addi $sp, $sp, 4	# Clear stack
	jr $ra			# Jump back to the address in main
exercise_func:
	addi $sp, $sp, -4 	# Decrement stack pointer
    	sw $ra, 0($sp) 		# Store return address
	mult $s2, $s3 		# Multiply nxumber of exercises by average time per exercise
	mflo $t0		# Move the result to $t0
	jal total		# Jump to total
	lw $ra, 0($sp)		# Load return address
	addi $sp, $sp, 4	# Clear stack
	jr $ra			# Jump back to the address in main
total:
	add $t1, $t1, $t0
	jr $ra
