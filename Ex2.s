.data
p: .asciiz "Qtd pequenas: "
m: .asciiz "Qtd medias: "
g: .asciiz "Qtd grandes: "
res: .asciiz "Total: "

.text
main:

li $v0,4
la $a0,p
syscall
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,m
syscall
li $v0,5
syscall
move $t1,$v0

li $v0,4
la $a0,g
syscall
li $v0,5
syscall
move $t2,$v0

li $t3,10
li $t4,12
li $t5,15

mul $t6,$t0,$t3
mul $t7,$t1,$t4
mul $t8,$t2,$t5

add $t9,$t6,$t7
add $t9,$t9,$t8

li $v0,4
la $a0,res
syscall

li $v0,1
move $a0,$t9
syscall

li $v0,10
syscall