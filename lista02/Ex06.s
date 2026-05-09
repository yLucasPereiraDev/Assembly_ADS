.data
	n: .asciiz "\n Digite um número positivo: "
	maior: .asciiz "\n Maior número: "
	menor: .asciiz "\n Menor número: "
.text
main:
	li $t0, 0
	li $t1, 10 
	
ler_primeiro:
	li $v0, 4
	la $a0, n
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	#Se o valor em t2 for menor que 0, ele roda o ler_primeiro novamente
	blt $t2, $zero, ler_primeiro
	
	move $t3, $t2 #Maior
	move $t4, $t2 #Menor
	
	addi $t0, $t0, 1
	
loop:
	beq $t0, $t1, fim
	
	li $v0, 4
	la $a0, n
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	blt $t2, $zero, loop #Ignora os negativos
	
	bgt $t2, $t3, novoMaior #Verifica maior
	blt $t2, $t4, novoMenor #Verefica menor
	
	j continua
	
novoMaior:
	move $t3, $t2
	j continua
	
novoMenor:
	move $t4, $t2

continua:
	addi $t0, $t0, 1
	j loop

fim: 
	li $v0, 4
	la $a0, maior
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall	
	
	li $v0, 4
	la $a0, menor
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 10
	syscall