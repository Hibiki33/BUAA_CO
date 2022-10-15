.data
string	:	.space 100

.macro scanInt(%d)
	li	$v0, 5
	syscall
	move	%d, $v0
.end_macro

.macro scanChar(%d)
	li	$v0, 12
	syscall
	move	%d, $v0
.end_macro

.macro	 printInt(%d)
	li	$v0, 1
	move	$a0, %d
	syscall
.end_macro

.macro	 getAddr(%dst, %src)
	sll	%dst, %src, 2
.end_macro

.macro	 END
	li	$v0, 10
	syscall
.end_macro

.text 
	scanInt($s0)				# read n
	
	# read string
	li	$t0, 0 
	in_loop:
	beq	$t0, $s0, end_in_loop
	
	getAddr($t1, $t0)
	scanChar($t2)
	sw	$t2, string($t1)
	
	addi	$t0, $t0, 1
	j	in_loop
	end_in_loop:
	
	# judge
	li	$t0, 0 
	subi	$t3, $s0, 1 
	out_loop:
	beq	$t0, $s0, end_out_loop
	
	getAddr($t1, $t0)
	lw	$t2, string($t1)
	getAddr($t1, $t3)
	lw	$t4, string($t1)
	bne	$t2, $t4, erro
	
	addi	$t0, $t0, 1
	subi	$t3, $t3, 1
	j	out_loop
	end_out_loop:

	li	$s1, 1
	printInt($s1)

END
	erro:
	li	$s1, 0
	printInt($s1)
	END
