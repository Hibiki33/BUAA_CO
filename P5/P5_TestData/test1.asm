ori $28, $0, 0
ori $29, $0, 0
J0:
jal L0
nop
J1:
jal L1
nop
J2:
jal L2
nop
J3:
jal L3
nop
J4:
jal end
nop
L0:
sw $19, 116($18)
subu $12, $29, $7
lw $29, 344($3)
lw $6, 176($12)
ori $26, $12, 40672
lui $5, 54397
addu $9, $22, $22
sw $16, 256($22)
sw $9, 328($9)
lui $14, 56310
lw $19, 4($4)
sw $16, 332($7)
sw $26, 236($29)
sw $3, 128($16)
addu $12, $30, $18
lui $21, 20661
sw $21, 68($28)
addu $2, $28, $11
addu $0, $25, $9
ori $17, $15, 3556
ori $29, $2, 10050
lui $23, 48511
sw $22, 308($18)
lui $23, 3865
subu $25, $8, $4
sw $0, 272($8)
sw $25, 56($8)
addu $0, $9, $10
ori $25, $17, 46657
addu $15, $16, $21
sw $15, 276($1)
lw $31, 260($0)
subu $5, $31, $22
subu $11, $5, $22
subu $26, $16, $11
lw $11, 8($26)
subu $18, $27, $2
addu $19, $2, $1
addu $15, $19, $19
addu $4, $15, $19
lw $7, 216($2)
sw $15, 308($6)
lw $16, 328($10)
beq $13, $19, J1
nop

L2:
subu $10, $31, $31
lui $9, 48634
lui $29, 30178
ori $17, $13, 10243
addu $17, $26, $13
lw $17, 100($17)
addu $3, $11, $29
ori $6, $3, 8244
lw $3, 172($0)
lw $5, 344($13)
sw $26, 300($16)
subu $8, $8, $20
lui $26, 40057
addu $3, $3, $2
lw $3, 220($0)
lui $16, 9079
ori $29, $17, 3130
lw $6, 188($17)
lui $31, 17160
sw $31, 0($27)
subu $28, $22, $22
sw $28, 24($0)
ori $25, $22, 31898
lui $8, 58424
lui $3, 4226
addu $21, $29, $18
subu $3, $21, $5
sw $31, 148($13)
sw $18, 196($1)
sw $3, 180($5)
lui $3, 25132
ori $11, $23, 10767
subu $21, $2, $16
beq $21, $21, J3
nop

L3:
sw $27, 188($28)
ori $13, $21, 28592
beq $6, $31, J4
nop
sw $12, 200($6)
jr $31
nop

L1:
lui $18, 9954
lui $16, 33863
lui $0, 12736
beq $17, $19, J2
nop
lw $15, 28($0)
lw $29, -3252($17)
sw $26, 388($26)
lui $17, 37680
subu $16, $29, $28
sw $16, 244($5)
addu $5, $14, $8
addu $23, $5, $5
lw $23, 336($29)
lw $21, 236($23)
subu $26, $28, $28
ori $28, $3, 50662
lw $15, 396($0)
jr $31
nop

end:
nop
nop
