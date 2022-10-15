.data
matrix1:	.space 256
matrix2:	.space 256
space:		.asciiz " "
enter:		.asciiz "\n"

.macro calc_addr(%dst, %row, %column, %rank)
    	# dts: the register to save the calculated address
    	# row: the row that element is in
    	# column: the column that element is in
    	# rank: the number of lines(rows) in the matrix
	multu	%row, %rank
	mflo	%dst
	addu	%dst, %dst, %column
	sll	%dst, %dst, 2
.end_macro

.macro readInt(%d)
	li	$v0, 5
	syscall
	move	%d, $v0
.end_macro

.macro printInt(%d)
	move	$a0, %d
	li	$v0, 1
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

.macro END
	li	$v0, 10
	syscall
.end_macro



.text
	readInt($s0)			# read n

	# read matrix1
	li	$t0, 0
	in_matrix1_i:
	beq	$t0, $s0, end_in_matrix1_i
	li	$t1, 0
	in_matrix1_j:
	beq	$t1, $s0, end_in_matrix1_j
	
	readInt($t3)
	calc_addr($t4, $t0, $t1, $s0)
	sw	$t3, matrix1($t4)
	
	addi	$t1, $t1, 1
	j	in_matrix1_j
	end_in_matrix1_j:
	addi	$t0, $t0, 1
	j	in_matrix1_i
	end_in_matrix1_i:
	
	# read matrix2
	li	$t0, 0
	in_matrix2_i:
	beq	$t0, $s0, end_in_matrix2_i
	li	$t1, 0
	in_matrix2_j:
	beq	$t1, $s0, end_in_matrix2_j
	
	readInt($t3)
	calc_addr($t4, $t0, $t1, $s0)
	sw	$t3, matrix2($t4)
	
	addi	$t1, $t1, 1
	j	in_matrix2_j
	end_in_matrix2_j:
	addi	$t0, $t0, 1
	j	in_matrix2_i
	end_in_matrix2_i:

	# cal outMatrix
	li	$t0, 0
	c_i:
	beq	$t0, $s0, end_c_i
	li	$t1, 0
	c_j:
	beq	$t1, $s0, end_c_j
	
	li	$s1, 0
	li	$t2, 0
	while:
	beq	$t2, $s0, end_while
	
	calc_addr($t3, $t0, $t2, $s0)
	lw	$t3, matrix1($t3)
	calc_addr($t4, $t2, $t1, $s0)
	lw	$t4, matrix2($t4)
	mult	$t3, $t4
	mflo	$t5
	add	$s1, $s1, $t5
	
	addi	$t2, $t2, 1
	j	while
	end_while:
	
	printInt($s1)
	printSpace
	
	addi	$t1, $t1, 1
	j	c_j
	end_c_j:
	
	printEnter
	
	addi	$t0, $t0, 1
	j	c_i
	end_c_i:
	
END


