.data
	v1: .asciiz "\n Digite o primeiro número: "
	v2: .asciiz "\n Digite o segundo número: "
	soma: .asciiz "\n Somatório dos ímpares: "
.text
main:
	#Valor 1
	li $v0, 4
	la $a0, v1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Valor 2
	li $v0, 4
	la $a0, v2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	bgt $t0, $t1, maior
	
	move $t2, $t0
	move $t3, $t1
	j continuar
	
	maior:
	move $t2, $t1
	move $t3, $t0
	
	continuar:
	move $t4, $t2
	li $t5, 0
	
	loop:
	addi $t4, $t4, 1
	
	bge $t4, $t3, fimLoop
	
	li $t6, 2
	div $t4, $t6
	mfhi $t7
	
	beq $t7, $zero, loop
	add $t5, $t5, $t4
	
	j loop
	
	fimLoop:
	li $v0, 4
	la $a0, soma
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 10
	syscall
