.data
num1: 	.float 12.0
num2: 	.float 703.0
bmi1:	.float 18.5
bmi2:	.float 24.9

prompt_weight: 	.asciiz "Enter weight (in lbs): "
prompt_height: 	.asciiz "Enter height (in feet): "
normal:		.asciiz "BMI index is Normal\n"
under:		.asciiz "BMI index is Underweight\n"
over:		.asciiz "BMI index is Overweight\n"

.text
loop: 
	l.s $f1, num1
	l.s $f2, num2
	l.s $f6, bmi1
	l.s $f7, bmi2
    	# Prompt the user for weight
    	li $v0, 4           # system call for print string
    	la $a0, prompt_weight
    	syscall

    	# Read in the weight
    	li $v0, 6          	 # system call for read float
    	syscall
    	mov.s $f3, $f0      	# move the weight to $f3
    
    	# Prompt the user for height
    	li $v0, 4           	# system call for print string
    	la $a0, prompt_height
    	syscall

    	# Read in the height
    	li $v0, 6           	# system call for read float
    	syscall
    	mov.s $f4, $f0      	# move the height to $f4
    	mul.s $f4, $f4, $f1 	# height times 12

    	# Calculate BMI
    	mul.s $f5, $f4, $f4 	# height (in inches) squared
    	div.s $f5, $f3, $f5 	# weight (in lbs) divided by height (in inches) squared
    	mul.s $f5, $f5, $f2  	# multiply by 703
    	
    	# Upper bound condition (BMI <= 24.9)
    	c.le.s $f5, $f7
    	bc1t lower		# if true, move to lower to check for more condition
    	bc1f over_display	# if false, move to over_display
    
exit:
	# Exit program
    	li $v0, 10          # system call for exit
    	syscall
    
lower:
	# Checking for lower bound condition (BMI < 18.5)
    	c.lt.s $f5, $f6
    	bc1f normal_display	# if true, move to normal_display
    	bc1t under_display	# if false, move to under_display
    
normal_display:
        # Print BMI normal message
    	li $v0, 4           # system call for print string
    	la $a0, normal
    	syscall
    	j loop
under_display:
    	# Print BMI underweight message
    	li $v0, 4           # system call for print string
    	la $a0, under
    	syscall
    	j loop
over_display:
        # Print BMI overweight message
    	li $v0, 4           # system call for print string
    	la $a0, over
    	syscall
    	j loop