.data
matrix:	.space 800
core_matrix:	.space 800
space:		.asciiz " "
enter:		.asciiz "\n

.macro calc_addr(%dst, %row, %column, %rank)
	multu	%row, %rank
	mflo	%dst
	addu	%dst, %dst, %column
	sll	%dst, %dst, 2
.end_macro

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

.macro printSpace
	la	$a0, space
	li	$v0, 4
	syscall
.end_macro

.macro printEnter
	la	$a0, enter
	li	$v0, 4
	syscall
.end_macro

.macro	 END
	li	$v0, 10
	syscall
.end_macro

.text
	scanInt($s0)		# m1 -> $s0
	scanInt($s1)		# n1 -> $s1
	scanInt($s2)		# m2 -> $s2
	scanInt($s3)		# n2 -> $s3

	# input matrix
	li	$t0, 0		# $t0 = i = 0
	in1_i:
	beq	$t0, $s0, in1_i_end
	li	$t1, 0		# $t1 = j = 0
	in1_j:
	beq	$t1, $s1, in1_j_end
	
	scanInt($t2)
	calc_addr($t3, $t0, $t1, $s1)
	sw	$t2, matrix($t3)
	  
	addi	$t1, $t1, 1
	j	in1_j
	in1_j_end:
	addi	$t0, $t0, 1
	j	in1_i
	in1_i_end:
	
	# input core_matrix
	li	$t0, 0		# $t0 = i = 0
	in2_i:
	beq	$t0, $s2, in2_i_end
	li	$t1, 0		# $t1 = j = 0
	in2_j:
	beq	$t1, $s3, in2_j_end
	
	scanInt($t2)
	calc_addr($t3, $t0, $t1, $s3)
	sw	$t2, core_matrix($t3)
	  
	addi	$t1, $t1, 1
	j	in2_j
	in2_j_end:
	addi	$t0, $t0, 1
	j	in2_i
	in2_i_end:
	
	# cal conv
	sub	$s4, $s0, $s2
	addi	$s4, $s4, 1		# mo = $s4 = m1 - m2 + 1
	sub	$s5, $s1, $s3
	addi	$s5, $s5, 1		# no = $s5 = n1 - n2 + 1
	
	li	$t0, 0		# $t0 = i = 0
	out_i:
	beq	$t0, $s4, out_i_end
	li	$t1, 0		# $t1 = j = 0
	out_j:
	beq	$t1, $s5, out_j_end
	
	li	$t2, 0		# sum = $t2 = 0
	
	li	$t3, 0		# xo = $t3 = 0
	cal_i:
	beq	$t3, $s2, cal_i_end
	li	$t4, 0		# yo = $t4 = 0
	cal_j:
	beq	$t4, $s3, cal_j_end
	
	add 	$s6, $t0, $t3
	add	$s7, $t1, $t4
	calc_addr($t5, $s6, $s7, $s1)
	lw	$t5, matrix($t5)		# f(i + xo, j + yo)
	calc_addr($t6, $t3, $t4, $s3)
	lw	$t6, core_matrix($t6)	# h(xo, yo)
	multu	$t5, $t6
	mflo	$t7
	add	$t2, $t2, $t7
	
	addi	$t4, $t4, 1
	j	cal_j
	cal_j_end:
	addi	$t3, $t3, 1
	j	cal_i
	cal_i_end:
	
	printInt($t2)
	printSpace
	
	addi	$t1, $t1, 1
	j	out_j
	out_j_end:
	printEnter
	addi	$t0, $t0, 1
	j	out_i
	out_i_end:
	

END
