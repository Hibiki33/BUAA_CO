.data
array:		.space 1000

.macro scanInt(%d)
	li	$v0, 5
	syscall
	move	%d, $v0
.end_macro

.macro printInt(%d)
	move	$a0, %d
	li	$v0, 1
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
	scanInt($s0)			# $s0 = n
	
	li	$t0, 0			# i = 0
	in1:
	beq	$t0, $s0, in1_end
	
		scanInt($t1)			# $t1 = in
		getAddr($t2, $t0)
		sw	$t1, array($t2)	# a[i] = in
	
	addi	$t0, $t0, 1
	j	in1
	in1_end:
	
	scanInt($s1)			# $s1 = k
	
	# $t0 = i
	# $t1 = j
	# $t2 = maxIndex
	# $t3 = maxNum
	
	li	$t0, 0
	del_i:
	beq	$t0, $s1, del_i_end
	
		li	$t2, 0
		li	$t3, 0
	
		li	$t1, 0
		del_j:
		beq	$t1, $s0, del_j_end
		
			getAddr($t4, $t1)
			lw	$t4, array($t4)
		
			bge	$t3, $t4, end_if1
				
				move	$t2, $t1
				move	$t3, $t4
		
			end_if1:
		
		addi	$t1, $t1, 1
		j	del_j
		del_j_end:
		
		getAddr($t4, $t2)
		li	$t5, -1
		sw	$t5, array($t4)
	
	addi	$t0, $t0, 1
	j	del_i
	del_i_end:

	li	$t0, 0
	out:
	beq	$t0, $s0, out_end
	
		getAddr($t1, $t0)
		lw	$t1, array($t1)
		
		beq	$t1, -1, end_if2
		
			printInt($t1)	
	
		end_if2:

	addi	$t0, $t0, 1
	j	out
	out_end:

END
