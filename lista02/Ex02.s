.data
	raio: .asciiz "\n Digite o raio: "
	comp: .asciiz "\n Comprimeneto da circunferencia: "
.text
main:
	#Raio
	li $v0, 4
	la $a0, raio
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 2
	li $t2, 3
	
	mul $t3, $t1, $t2
	mul $t3, $t3, $t0
	
	li $v0, 4
	la $a0, comp
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall
		
	