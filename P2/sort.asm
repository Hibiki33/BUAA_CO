.data
array:		.space	 8000
space:		.asciiz " "
enter:		.asciiz "\n"

.macro	 scanInt(%d)
	li	$v0, 5
	syscall
	move	%d, $v0
.end_macro

.macro	 printInt(%d)
	li	$v0, 1
	move 	$a0, %d
	syscall
.end_macro

.macro	 printSpace
	la	$a0, space
	li	$v0, 4
	syscall
.end_macro

.macro	 printEnter
	la	$a0, enter
	li	$v0, 4
	syscall
.end_macro

.macro push(%d)
	sw	%d, 0($sp)
	addi	$sp, $sp, -4
.end_macro

.macro pop(%d)
	addi	$sp, $sp, 4
	lw	%d, 0($sp)
.end_macro

.macro getAddr(%dst, %src)
	sll	%dst, %src, 2
.end_macro

.macro	 END
	li	$v0, 10
	syscall
.end_macro

.text
	scanInt($s0)
	
	li	$t0, 0
	for_in:
	beq	$t0, $s0, for_in_end
	
		scanInt($s1)
		scanInt($s2)
		sll	$t1, $t0, 1
		getAddr($t1, $t1)
		sw	$s1, array($t1)
		addi	$t1, $t1, 4
		sw	$s2, array($t1)
	
	addi	$t0, $t0, 1
	j	for_in
	for_in_end:

	li	$t0, 0
	addi	$s3, $s0, -1
	for_i:
	beq	$t0, $s3, for_i_end

		li	$t1, 0
		sub	$s4, $s3, $t0
		for_j:
		beq	$t1, $s4, for_j_end

			sll	$s5, $t1, 1
			addi	$s6, $s5, 2
			getAddr($s5, $s5)
			getAddr($s6, $s6)
			lw	$t2, array($s5)
			lw	$t3, array($s6)
			bge	$t2, $t3, if_end
			
				move	$t4, $t2
				sw	$t3, array($s5)
				sw	$t4, array($s6)
				
				addi	$s5, $s5, 4
				addi	$s6, $s6, 4
				lw	$t2, array($s5)
				lw	$t3, array($s6)
				move	$t4, $t2
				sw	$t3, array($s5)
				sw	$t4, array($s6)
			
			j	else_if_end
			if_end:
			
			sll	$s5, $t1, 1
			addi	$s6, $s5, 2
			getAddr($s5, $s5)
			getAddr($s6, $s6)
			lw	$t2, array($s5)
			lw	$t3, array($s6)
			bne	$t2, $t3, else_if_end
				
				addi	$s5, $s5, 4
				addi	$s6, $s6, 4
				lw	$t2, array($s5)
				lw	$t3, array($s6)
				bge	$t2, $t3, else_if_end
				
					move	$t4, $t2
					sw	$t3, array($s5)
					sw	$t4, array($s6)
				
					addi	$s5, $s5, -4
					addi	$s6, $s6, -4
					lw	$t2, array($s5)
					lw	$t3, array($s6)
					move	$t4, $t2
					sw	$t3, array($s5)
					sw	$t4, array($s6)		
			
			else_if_end:
			
		
		addi	$t1, $t1, 1
		j	for_j
		for_j_end:
	
	addi	$t0, $t0, 1
	j	for_i
	for_i_end:

	li	$t0, 0
	for_out:
	beq	$t0, $s0,	for_out_end
		
		sll	$t1, $t0, 1
		getAddr($t1, $t1)
		lw	$s1, array($t1)
		printInt($s1)
		printSpace
		addi	$t1, $t1, 4
		lw	$s2, array($t1)
	 	printInt($s2)
	 	printEnter
	
	addi	$t0, $t0, 1
	j	for_out
	for_out_end: 


END
