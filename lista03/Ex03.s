.data
	n1: .asciiz "\n Digite o primeiro número: "
	n2: .asciiz "\n Digite o segundo número: "
	dif: .asciiz "\n Diferença: "
.text
main:
	#Input n1
	li $v0, 4
	la $a0, n1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Input n2
	li $v0, 4
	la $a0, n2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	bgt $t0, $t1, maior
	
	sub $t2, $t1, $t0
	j fim
	
	maior:
	sub $t2, $t0, $t1
	
	fim:
	li $v0, 4
	la $a0, dif
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall