.data
msg1: .asciiz "Digite o primeiro valor: "
msg2: .asciiz "Digite o segundo valor: "

msg3: .asciiz "\nValores apos a troca:\n"
msg4: .asciiz "Primeiro registrador: "
msg5: .asciiz "\nSegundo registrador: "

.text
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0       #Primeiro valor

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0       #Segundo valor

move $t2, $t0       #registradorAuxiliar = primeiro
move $t0, $t1       #Primeiro = segundo
move $t1, $t2       #Segundo = auxiliar

li $v0, 4
la $a0, msg3
syscall

#Primeiro registrador
li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $t0
syscall

#Segundo registrador
li $v0, 4
la $a0, msg5
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall