.data
	comp: .asciiz "\n Digite o comprimento: "
	larg:.asciiz "\n Digite a largura: "
	alt: .asciiz "\n Digite a altura: "
	vol: .asciiz "\n Volume: "
.text
main:
	#Comprimento
	li $v0, 4
	la $a0, comp
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Largura
	li $v0, 4
	la $a0, larg
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Altura
	li $v0, 4
	la $a0, alt
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	mul $t3, $t0, $t1
	mul $t3, $t3, $t2
	
	li $v0, 4
	la $a0, vol
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	#Finaliza os processos
	li $v0, 10
	syscall