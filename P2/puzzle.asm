.data
matrix:	.space 256
finished:	.space 256

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

.macro getAddr(%dst, %row, %column, %rank)
	multu	%row, %rank
	mflo	%dst
	addu	%dst, %dst, %column
	sll	%dst, %dst, 2
.end_macro

.macro END
	li	$v0, 10
	syscall
.end_macro

.macro push(%d)
	sw	%d, 0($sp)	
	addi	$sp, $sp, -4
.end_macro

.macro	 pop(%d)
	addi	$sp, $sp, 4
	lw	%d, 0($sp)
.end_macro

.text
	scanInt($s0)		# $s0 = n
	scanInt($s1)		# $s1 = m
	li	$s4, 0		# $s4 = sum = 0
	li	$s5, 1		# $s5 = const int 1
				
	# input matrix nums
	li	$t0, 0
	in_i:
	beq	$t0, $s0, in_i_end
	li	$t1, 0
	in_j:
	beq	$t1, $s1, in_j_end
	
	scanInt($t2)
	getAddr($t3, $t0, $t1, $s1)
	sw	$t2, matrix($t3)
	
	addi	$t1, $t1, 1
	j	in_j
	in_j_end:
	addi	$t0, $t0, 1
	j	in_i
	in_i_end:
	
	# input start & end point
	scanInt($a1)
	addi	$a1, $a1, -1		# $a1 = x
	scanInt($a2)
	addi	$a2, $a2, -1		# $a2 = y
	
	scanInt($s2)
	addi	$s2, $s2, -1		# $s2 = x_end
	scanInt($s3)
	addi	$s3, $s3, -1		# $s3 = y_end
	# dfs(x, y)
	jal	dfs
	
	printInt($s4)
END

	dfs:		# $a1 = x, $a2 = y, $s2 = x_end, $s3 = y_end
	push($ra)
	
	# if x == x_end && y == y_end
	# sum++
	# return
	bne	$a1, $s2, end_if_success
	bne	$a2, $s3, end_if_success
	addi	$s4, $s4, 1
	pop($ra)
	jr	$ra
	end_if_success:
	
	# finished[x][y] = 1
	getAddr($t0, $a1, $a2, $s1)
	sw	$s5, finished($t0)
	
	# dir x - 1
	addi	$t0, $a1, -1
	bltz	$t0, end1
	getAddr($t1, $t0, $a2, $s1)
	lw	$t2, finished($t1)
	bne	$t2, $zero, end1
	lw 	$t2, matrix($t1)
	bne	$t2, $zero, end1
	push($a1)
	push($a2)
	move	$a1, $t0
	jal	dfs
	pop($a2)
	pop($a1)
	end1:
	
	# dir	x + 1
	addi	$t0, $a1, 1
	bge	$t0, $s0, end2
	getAddr($t1, $t0, $a2, $s1)
	lw	$t2, finished($t1)
	bne	$t2, $zero, end2
	lw 	$t2, matrix($t1)
	bne	$t2, $zero, end2
	push($a1)
	push($a2)
	move	$a1, $t0
	jal	dfs
	pop($a2)
	pop($a1)
	end2:
	
	# dir y - 1
	addi	$t0, $a2, -1
	bltz	$t0, end3
	getAddr($t1, $a1, $t0, $s1)
	lw	$t2, finished($t1)
	bne	$t2, $zero, end3
	lw 	$t2, matrix($t1)
	bne	$t2, $zero, end3
	push($a1)
	push($a2)
	move	$a2, $t0
	jal	dfs
	pop($a2)
	pop($a1)
	end3:
	
	# dir y + 1
	addi	$t0, $a2, 1
	bge	$t0, $s1, end4
	getAddr($t1, $a1, $t0, $s1)
	lw	$t2, finished($t1)
	bne	$t2, $zero, end4
	lw 	$t2, matrix($t1)
	bne	$t2, $zero, end4
	push($a1)
	push($a2)
	move	$a2, $t0
	jal	dfs
	pop($a2)
	pop($a1)
	end4:

	# finished[x][y] = 0
	getAddr($t0, $a1, $a2, $s1)
	sw	$zero, finished($t0)
	
	# return
	pop($ra)
	jr	$ra
