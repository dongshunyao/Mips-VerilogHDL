ori $t1,$0,2
ori $t2,$0,1
addu $t3,$t1,$t2
ori $t4,$0,5
subu $t5,$t4,$t1
beq $t1,$t2,q
sw $t1,4($0)
j w
q: lui $t3,10
w: lw $t6,4($0)
beq $t5,$t3,q
addu $0,$0,$t1