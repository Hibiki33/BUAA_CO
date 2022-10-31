.data
a:	.space	 100
plus: .asciiz "+"
enter:.asciiz "\n"

.macro	 scanInt(%d)
	li	$v0, 5
	syscall
	move	%d, $v0
.end_macro

.macro printInt(%d)
	li	$v0, 1
	move	$a0, %d
	syscall
.end_macro

.macro printPlus
	la	$a0, plus
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
	
	li	$t0, 1
	for1:
	beq	$t0, $s0, for1_end
	
	push($t0)
	
	sw	$t0, a($zero)
	move	$a1, $t0
	li	$a2, 1
	jal	bre	
	
	pop($t0)
	
	addi	$t0, $t0, 1
	j	for1
	for1_end:
	
END

bre:
	push($ra)
	
	addi	$t1, $a2, -1
	
	bne	$a1, $s0, end_if1
		
		li	$t0, 0
		for2:
		beq	$t0, $t1, for2_end
		
			getAddr($t2, $t0)
			lw	$t2, a($t2)
			printInt($t2)
			printPlus
		
		addi	$t0, $t0, 1
		j	for2
		for2_end:
		
		getAddr($t2, $t1)
		lw	$t2, a($t2)
		printInt($t2)
		printEnter
		
		pop($ra)
		jr	$ra
		
	end_if1:

	getAddr($t0, $t1)
	lw	$t0, a($t0)
	sub	$t5, $s0, $a1
	for3:
	bgt	$t0, $t5, for3_end
		
		getAddr($t2, $a2)
		sw	$t0, a($t2)
		
		push($a1)
		push($a2)
		push($t0)
		push($t5)
		
		add	$a1, $a1, $t0
		addi	$a2, $a2, 1 
		jal	bre
		
		pop($t5)
		pop($t0)
		pop($a2)
		pop($a1)
	
	addi	$t0, $t0, 1
	j	for3
	for3_end:

	pop($ra)
	jr	$ra
	
	
	