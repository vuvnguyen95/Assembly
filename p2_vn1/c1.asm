.data
prompt1: .asciiz "Enter number #"
prompt2: .asciiz ": "
result: .asciiz "The minimum number is: "
error: .asciiz  "Error: input must be positive\n"

.text
main:
  # initialize variables
  li $t0, 1 # counter
  li $t1, 0 # minimum number
  li $t2, 0 # input number

  # loop to read input numbers
loop:
  	bgt $t0, 3, exit
    	# print prompt
    	la $a0, prompt1
    	li $v0, 4
    	syscall
    	
    	li $v0, 1
    	move $a0, $t0
    	syscall
    	
    	la $a0, prompt2
    	li $v0, 4
    	syscall

    	# read input number
    	li $v0, 5
    	syscall
    	move $t2, $v0
    	beqz  $t2, increment
    	# check if input number is positive
    	bgez $t2, check_min

    	# print error message and loop again
    	li $v0, 4
    	la $a0, error
    	syscall
    	j loop
    	
  	check_min:
    		# check if input number is less than current minimum
    		beq $t0, 0, set_min
    		beqz $t1, set_min
    		bge $t2, $t1, increment

    	set_min:
      		# set input number as new minimum
      		move $t1, $t2

    	increment:
      		# increment counter
      		addi $t0, $t0, 1
    		j loop
exit:
print_min:
	# print minimum number
    	li $v0, 4
    	la $a0, result
    	syscall

    	li $v0, 1
    	move $a0, $t1
    	syscall

    	# exit program
    	li $v0, 10
    	syscall
