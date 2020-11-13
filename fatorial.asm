.data
 printarMenssagem: .asciiz "Entre com um numero para realizar o fatorial: "
 resultadoMenssagem: .asciiz "\nO fatorial do numero é: "
 Numero: .word 0
 Resultado: .word 0
.text

.globl main

main:
	
	li $v0, 4
	la $a0, printarMenssagem
	syscall
	
	#ler o numero do teclado
	li $v0, 5
	syscall
	
	sw $v0, Numero
	
	#chamada da função fatorial
	lw $a0, Numero
	jal Fatorial
	sw $v0, Resultado
	
	#Mostrar o resultado
	
	li $v0, 4
	la $a0, resultadoMenssagem
	syscall
	
	li $v0, 1
	lw $a0, Resultado
	syscall
	
	#Finalizar o programa
	li $v0, 10
	syscall
#-----------------------------------------------------

.globl Fatorial
Fatorial:
	addi $sp,$sp,-8
	sw $ra, 0($sp)
	sw $s0 ,4($sp)
	
	#Caso Base
	
	li $v0, 1
	beq $a0, 0, fimFatorial
	
	#Fatorial (Numero - 1)
	move $s0, $a0
	sub $a0, $a0, 1
	jal Fatorial
	
	mul $v0, $v0, $s0
	
	fimFatorial:
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addi $sp, $sp, 8 
		
		jr $ra
