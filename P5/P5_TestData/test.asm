ori $28, $0, 0
add $29, $0, $0
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
jal L4
nop
J5:
jal end
nop
L4:
ori $6, $6, 52804
sw $7, 68($8)
sw $14, 60($0)
lw $9, 200($28)
lw $20, 380($0)
lw $3, 60($24)
jr $31
nop

L1:
sw $15, 8($30)
ori $9, $11, 62541
lui $7, 19325
ori $7, $9, 12307
sw $30, 180($0)
lw $28, 232($2)
add $20, $1, $9
ori $25, $13, 41195
sub $10, $4, $5
lui $10, 65291
sw $10, 304($15)
lui $8, 23715
lw $21, 188($0)
lui $19, 4026
lui $23, 65410
sub $31, $24, $18
lui $18, 62554
ori $31, $31, 53289
sw $10, 4($0)
ori $13, $18, 34068
add $28, $1, $11
ori $9, $30, 63417
lui $1, 55552
add $27, $7, $6
ori $0, $12, 28266
sub $18, $27, $9
sw $28, 368($0)
sw $13, 132($16)
sw $26, 396($3)
ori $14, $23, 44627
lw $31, 874($18)
sub $30, $24, $1
ori $17, $24, 54551
lui $10, 35847
add $20, $10, $10
add $18, $7, $1
ori $18, $13, 17047
sw $23, 108($11)
add $18, $23, $17
sw $18, 40($0)
sw $6, 268($5)
lw $24, 148($26)
lui $30, 28158
lw $25, 280($0)
ori $25, $10, 30799
ori $8, $17, 24298
ori $2, $29, 63340
sw $20, 224($26)
lui $2, 42731
add $9, $18, $11
ori $31, $0, 12312
jr $31
nop

L2:
lui $13, 14233
sw $19, 336($0)
add $14, $18, $20
lw $23, 368($0)
add $13, $14, $23
lui $13, 64658
add $17, $13, $22
add $14, $20, $2
lui $25, 51970
lw $21, 16($26)
sub $31, $18, $14
ori $31, $0, 12320
jr $31
nop

L0:
sub $30, $9, $23
sub $19, $30, $13
jr $31
nop

L3:
lui $16, 29208
lw $4, 344($15)
lw $5, 268($0)
add $4, $10, $8
sw $5, 224($0)
ori $23, $16, 22052
sw $7, 40($12)
sw $16, 180($0)
lw $8, 32($0)
sub $17, $23, $4
sw $11, 344($0)
sw $7, 272($8)
sw $31, 276($21)
ori $0, $17, 57978
ori $31, $31, 15664
ori $24, $10, 39489
add $4, $19, $28
lw $24, 80($12)
lui $4, 41994
lw $10, 48($0)
lw $21, 248($0)
lw $4, 336($0)
beq $26, $22, J4
nop

end:
nop
nop