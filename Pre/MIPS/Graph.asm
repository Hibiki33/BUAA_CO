# #include <stdio.h>
# int G[8][8];
# int book[8];
# int m, n, ans;
#
# void dfs(int x) {
#     book[x] = 1;
#     int flag = 1, i;
#     for (i = 0; i < n; i++) {
#         flag &= book[i];
#     }
#     if (flag && G[x][0]) {
#         ans = 1;
#         return;
#     }
#     for (i = 0; i < n; i++) {
#         if (!book[i] && G[x][i]) {
#             dfs(i);
#         }
#     }
#     book[x] = 0;
# }
#
# int main() {
#     scanf("%d%d", &n, &m);
#     int i, x, y;
#     for (i = 0; i < m; i++) {
#         scanf("%d%d", &x, &y);
#         G[x - 1][y - 1] = 1;
#         G[y - 1][x - 1] = 1;
#     }
#     dfs(0);
#     printf("%d", ans);
#     return 0;
# }

.data
graph:    .space 256
finished: .space 32

.macro getindex(%ans, %i, %j)			# %ans = (%i * 8 + %j) * 4
	sll %ans, %i, 3
    	add %ans, %ans, %j
    	sll %ans, %ans, 2 
.end_macro

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


.text
	li   $v0, 5
	syscall
	move $s0, $v0						# load n
	li   $v0, 5
	syscall
	move $s1, $v0						# load m
	li   $s2, 1							# const $s2 = 1
	
	li   $t0, 0							# for int i = 0; ($t0 = i)
	graph_in:
		beq  $t0, $s1, graph_in_end		# i < m;
		li   $v0, 5
		syscall
		move $t1, $v0					# scanf x;
		addi $t1, $t1, -1				# x -= 1; ($t1 = x - 1)
		li   $v0, 5
		syscall
		move $t2, $v0					# scanf y;
		addi $t2, $t2, -1				# y -= 1; ($t2 = y - 1)
		getindex($t3, $t1, $t2)	
		sw   $s2, graph($t3)				# store graph[x - 1][y - 1] = 1
		getindex($t3, $t2, $t1)
		sw   $s2, graph($t3)				# store graph[y - 1][x - 1] = 1	
		addi $t0, $t0, 1					# i++;
		j    graph_in
	graph_in_end:

# $s0 = n, $s1 = m, $s2 = 1, $s3 = ans
	li   $s3, 0							# init ans = 0
	li   $a0, 0
	jal	 dfs								# dfs(0)

	move $a0, $s3
	li   $v0, 1
	syscall								# printf ans
	
	li   $v0, 10
	syscall
		
dfs:
# $a0 = x, $t0 = i, $t1 = x * 4, $t2 = flag
	addi $sp, $sp, -12
	sll  $t1, $a0, 2						# $t1 = x * 4
	sw   $s2, finished($t1)				# finished[x] = 1
	# sw   $a0, 0($sp)
	
	li   $t0, 0							# int i = 0;
	li   $t2, 1							# $t2 = flag = 1
	loop1:
		beq  $t0, $s0, end_loop1			# i < n;
		sll  $t3, $t0, 2					# $t3 = i * 4
		lw   $t3, finished($t3)			# $t3 = finished[i]
		and  $t2, $t2, $t3				# flag $= finished[i]
		addi $t0, $t0, 1					# i++;
		j    loop1
	end_loop1:
	
	bne  $t2, 1, flag0_or_g0				# if flag = 1
	getindex($t3, $a0, $zero)	
	lw   $t3, graph($t3)					# $t3 = graph[x][0]		
	bne  $t3, 1, flag0_or_g0				# if graph[x][0] = 1
	li   $s3, 1							# flag = 1
	j    end_dfs   
	flag0_or_g0: 
	
	li   $t0, 0							# int i = 0;
	loop2:
		beq  $t0, $s0, end_loop2
		
		sll  $t3, $t0, 2
		lw   $t3, finished($t3)
		bne  $t3, 0, finish1_or_g0
		getindex($t3, $a0, $t0)
		lw   $t3, graph($t3)
		bne  $t3, 1, finish1_or_g0
		
		sw   $a0, 0($sp)
		sw   $ra, 4($sp)
		sw   $t0, 8($sp)
		
		move $a0, $t0
		jal  dfs
		
		lw   $t0, 8($sp)
		lw   $ra, 4($sp)
		lw   $a0, 0($sp)
		
		finish1_or_g0:
		addi $t0, $t0, 1
		j    loop2
		
	end_loop2:

end_dfs:
	sll  $t1, $a0, 2
	sw   $zero, finished($t1)   			# finished[x] = 0
	addi $sp, $sp, 12
	jr   $ra
