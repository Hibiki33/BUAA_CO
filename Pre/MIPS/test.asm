.data
matrix: .space 10000
space: .asciiz " "
enter: .asciiz "\n"

.macro scanf(%d)
	li	$v0, 5
	syscall
	move	%d, $v0
.end_macro

.macro print(%d)
	li	$v0, 1
	move	$a0, %d
	syscall
.end_macro

.macro	 index(%ans, %i, %j)
	mul	%ans, %i, 50
	add	%ans, %ans, %j
	sll	%ans, %ans, 2
.end_macro

.macro end
	li	$v0, 10	
	syscall
.end_macro

.macro print_space
	la	$a0, space
	li	$v0, 4
	syscall
.end_macro

.macro print_enter
	la	$a0, enter
	li	$v0, 4
	syscall
.end_macro

.text 
	scanf($s0)
	scanf($s1)
	li	$t0, 0
	begin_i:
	beq	$t0, $s0, end_i
	li	$t1, 0
	begin_j:
	beq	$t1, $s1, end_j
	scanf($t3)
	index($t4, $t0, $t1)
	sw	$t3, matrix($t4)
	addi	$t1, $t1, 1
	j	begin_j
	end_j:
	addi	$t0, $t0, 1
	j	begin_i
	end_i:
	
	li	$t0, 0
	begin_i_out:
	beq	$t0, $s0, end_i_out
	li	$t1, 0
	begin_j_out:
	beq	$t1, $s1, end_j_out
	index($t4, $t0, $t1)
	lw	$t3, matrix($t4)
	print($t3)
	print_space
	addi	$t1, $t1, 1
	j	begin_j_out
	end_j_out:
	print_enter
	addi	$t0, $t0, 1
	j	begin_i_out
	end_i_out:
end


