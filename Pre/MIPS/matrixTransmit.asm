.data
matrix: .space 10000
str_enter: .asciiz "\n"
str_space: .asciiz " "

.macro getindex(%ans, %i, %j)	# %ans = (%i * 50 + %j) * 4
	li $t9, 50
	mult %i, $t9
	mflo %ans
    add %ans, %ans, %j
    sll %ans, %ans, 2
.end_macro

.text
	li $v0, 5
	syscall
	move $s0, $v0						# load n into $s0 
	li $v0, 5
	syscall
	move $s1, $v0						# load m into $s1

	
	li $t0, 0							# int i = 0;
	in_i:
		beq $t0, $s0, in_i_end
		li $t1, 0						# int j = 0;
		in_j:
			beq $t1, $s1, in_j_end 
			li $v0, 5
			syscall
			getindex($t2, $t0, $t1)
			sw $v0, matrix($t2)
			addi $t1, $t1, 1
			j in_j
		in_j_end:
		addi $t0, $t0, 1
		j in_i
	in_i_end:

	add $t0, $zero, $s0					
	addi $t0, $t0, -1					# int i = n - 1;
	out_i:
		beq $t0, -1, out_i_end
		add $t1, $zero, $s1				
		addi $t1, $t1, -1				# int j = m - 1;
		out_j:	
			beq $t1, -1, out_j_end	
			getindex($t2, $t0, $t1)
			lw $t3, matrix($t2)
			beq $t3, 0, else
			
			move $a0, $t0
			add $a0, $a0, 1
			li $v0, 1
			syscall
			
			la $a0, str_space
			li $v0, 4
			syscall
			
			move $a0, $t1
			add $a0, $a0, 1
			li $v0, 1
			syscall
			
			la $a0, str_space
			li $v0, 4
			syscall
			
			move $a0, $t3
			li $v0, 1
			syscall
		
			la $a0, str_enter
			li $v0, 4
			syscall
			
			else:
			addi $t1, $t1, -1
			j out_j
		out_j_end:
		addi $t0, $t0, -1
		j out_i
	out_i_end:
	
	li $v0, 10
	syscall
