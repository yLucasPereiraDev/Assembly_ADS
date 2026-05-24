.data
	msg1: .asciiz "Digite um numero entre 1 e  10000:"
	msg2: .asciiz "\nNumeros primos: \n"
	espaco: .asciiz "\n"
.text
main:
ler:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0  #Numero maximo
	
	#Numero > 1
	li $t1, 1
	ble $t0, $t1, ler
	
	#Numero < 10000
	li $t1, 10000
	bge $t0, $t1, ler
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $t2, 2 #Numero atual
	
loopExterno:
	bgt $t2,$t0, fim
	
	li $t3, 1 # 1 = primo
	
	#Divisor inicia em 2
	li $t4, 2
	
loopInterno:
	#Se divisor == numero, termina
	beq $t4, $t2, mostrar
	
	#Resto = numero/divisor
	div $t2, $t4
	mfhi $t5
	
	#Se resto = 0, nao e primo
	beq $t5, $zero, naoPrimo
	
	addi $t4, $t4, 1
j loopInterno

naoPrimo:
	li $t3, 0

mostrar:
	beq $t3, $zero, proximo

	#Imprime numero primo
	li $v0, 1
	move $a0, $t2
	syscall

	#Espaco
	li $v0, 4
	la $a0, espaco
	syscall

proximo:
	addi $t2, $t2, 1
j loopExterno

fim:
	li $v0, 10
	syscall