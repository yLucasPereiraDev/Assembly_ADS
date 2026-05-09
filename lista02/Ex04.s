.data
	n1: .asciiz "\n Nota 1: "
	n2: .asciiz "\n Nota 2: "
	n3: .asciiz "\n Nota 3: "
	n4: .asciiz "\n Nota 4: "
	med: .asciiz "\n Media: "
	apr: .asciiz "\n Aprovado! "
	exam: .asciiz "\n Exame! "
	ret: .asciiz "\n Retido! "
.text
main:
	#Nota 1
	li $v0, 4
	la $a0, n1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Nota 2
	li $v0, 4
	la $a0, n2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Nota 3
	li $v0, 4
	la $a0, n3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	#Nota 4
	li $v0, 4
	la $a0, n4
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	#Cálculo da média
	add $t4, $t0, $t1
	add $t4, $t4, $t2
	add $t4, $t4, $t3
	
	li $t5, 4
	div $t4, $t5
	mflo $t6
	
	#Média
	li $v0, 4
	la $a0, med
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	#Decisão
	li $t7, 6
	bge $t6, $t7, aprovado
	
	li $t7, 3
	bge $t6, $t7, exame
	
	j retido
	
	aprovado:
	li $v0, 4
	la $a0, apr
	syscall
	j fim
	
	exame:
	li $v0, 4
	la $a0, exam
	syscall
	j fim
	
	retido:
	li $v0, 4
	la $a0, ret
	syscall
	
	fim:
	li $v0, 10
	syscall