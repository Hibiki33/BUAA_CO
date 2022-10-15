.data
array:		.space 32
symbol:	.space 32
space:		.asciiz " "
enter:		.asciiz "\n"

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

.macro	 printSpace
	la	$a0, space
	li	$v0, 4
	syscall
.end_macro

.macro printEnter
	la	$a0, enter
	li	$v0, 4
	syscall
.end_macro

.macro getAddr(%dst, %src)
	sll	%dst, %src, 2 
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
	li	$s1, 1
	move	$a1, $zero
	jal	FullArray
END	
	
	FullArray:
	push($ra)
	
	bne	$a1, $s0, end_if1
	li	$t0, 0
	loop1:
	beq	$t0, $s0, end_loop1
	getAddr($t1, $t0)
	lw	$t1, array($t1)
	printInt($t1)
	printSpace
	addi	$t0, $t0, 1
	j	loop1
	end_loop1:
	printEnter
	pop($ra)
	jr	$ra
	end_if1:
	
	li	$t0, 0
	loop2:
	beq	$t0, $s0, end_loop2
	getAddr($t1, $t0)
	lw	$t1, symbol($t1)
	bne	$t1, $zero, end_if2
	
	getAddr($t1, $a1)
	addi	$t2, $t0, 1
	sw	$t2, array($t1)
	
	getAddr($t1, $t0)
	sw	$s1, symbol($t1)
	
	push($a1)
	push($t0)
	
	addi	$a1, $a1, 1
	jal	FullArray

	pop($t0)
	pop($a1)
	
	getAddr($t1, $t0)
	sw	$zero, symbol($t1)
	
	end_if2:
	addi	$t0, $t0, 1
	j	loop2
	end_loop2:
	
	pop($ra)
	jr	$ra

