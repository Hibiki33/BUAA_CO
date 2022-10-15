.data


.text
	li $v0 5
	syscall
	move $s0, $v0

	li $t0, 4
	div $s0, $t0
	mfhi $t1
	beq $t1, $zero, else4
	li $a0, 0
	li $v0, 1
	syscall
	j end_all	
else4:
	li $t0, 100
	div $s0, $t0
	mfhi $t1
	beq $t1, $zero, else100
	li $a0, 1
	li $v0, 1
	syscall
	j end_all
else100:
	li $t0, 400
	div $s0, $t0
	mfhi $t1
	beq $t1, $zero, else400
	li $a0, 0
	li $v0, 1
	syscall
	j end_all
else400:
	li $a0, 1
	li $v0, 1
	syscall
	
end_all:
li $v0 10
syscall