sumSquare: addi sp, sp -12 # Make space for 3 words on the stack
	sw ra, 0(sp) # Store the return address
	sw s0, 4(sp) # Store register s0
	sw s1, 8(sp) # Store register s1
	add s0, a0, x0 # Set s0 equal to the parameter n
	add s1, x0, x0 # Set s1 (accumulator) equal to 0
loop: bge x0, s0, end # Branch if s0 is not positive
	add a0, s0, x0 # Set a0 to the value in s0, setting up
	# args for call to function square
	jal ra, square # Call the function square
	add s1, s1, a0 # Add the returned value into s1
	addi s0, s0, -1 # Decrement s0 by 1
	jal x0, loop # Jump back to the loop label
end: add a0, s1, x0 # Set a0 to s1 (desired return value)
	lw ra, 0(sp) # Restore ra
	lw s0, 4(sp) # Restore s0
	lw s1, 8(sp) # Restore s1
	addi sp, sp, 12 # Free space on the stack for the 3 words
	jr ra # Return to the caller