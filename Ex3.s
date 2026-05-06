.data
n: .asciiz "Horas normais: "
e: .asciiz "Horas extras: "
d: .asciiz "Desconto: "
res: .asciiz "Salario liquido: "

.text
main:

li $v0,4
la $a0,n
syscall
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,e
syscall
li $v0,5
syscall
move $t1,$v0

li $v0,4
la $a0,d
syscall
li $v0,5
syscall
move $t2,$v0

li $t3,10
li $t4,15

mul $t5,$t0,$t3
mul $t6,$t1,$t4

add $t7,$t5,$t6
sub $t8,$t7,$t2

li $v0,4
la $a0,res
syscall

li $v0,1
move $a0,$t8
syscall

li $v0,10
syscall