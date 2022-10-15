.data
array:		.space 6000

.macro scanInt(%d)
	li	$v0, 5
	syscall
	move	%d, $v0
.end_macro

.macro printInt(%d)
	li	$v0, 1
	move	$a0, %d
	syscall
.end_macro

.macro getAddr(%dst, %src)
	sll	%dst, %src, 2
.end_macro

.macro END
	li	$v0, 10
	syscall
.end_macro

.text
	li	$t0, 1
	sw	$t0, array($zero)	# a[0] = 1
	
	scanInt($s0)			# $s0 = n
	li	$t2, 1			# $t2 = int c = 1
	
	li	$t0, 1			# $t0 = int i = 1
	loop_i:
	bgt	$t0, $s0, loop_i_end
		
	li	$t3, 0			# $t3 = int up = 0
	
	li	$t1, 0			# $t1 = int j = 0
	loop_j:
	beq	$t1, $t2, loop_j_end
	
	getAddr($t4, $t1)
	lw	$t4, array($t4)	# $t4 = a[j]
	mult	$t4, $t0
	mflo	$t5			# $t5 = s = a[j] * i
	add	$t5, $t5, $t3	# s = s + up
	li	$t6, 10
	div	$t5, $t6
	getAddr($t4, $t1)
	mfhi	$t7
	sw	$t7, array($t4)	# a[j] = s % 10
	mflo	$t7
	move	$t3, $t7		# up = s / 10

	addi	$t1, $t1, 1
	j	loop_j
	loop_j_end:
	
	while:
	beqz	$t3, while_end	# while (up != 0)
	getAddr($t4, $t2)
	div	$t3, $t6
	mfhi	$t7
	sw	$t7, array($t4)	# a[c] = up % 10
	addi	$t2, $t2, 1		# c++
	mflo	$t7	
	move	$t3, $t7		# up = up / 10
	j	while
	while_end:
	
	addi	$t0, $t0, 1		# i++
	j	loop_i
	loop_i_end:

	addi	$t0, $t2, -1		# int i = c - 1
	loop:
	bltz	$t0, loop_end
	getAddr($t1, $t0)
	lw	$t1, array($t1)
	printInt($t1)
	addi	$t0, $t0, -1		# i--
	j	loop
	loop_end:
	

END
