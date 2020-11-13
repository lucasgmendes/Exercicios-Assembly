#Escreva um programa que leia 10 inteiros longos n�o sinalizados da entrada padr�o e some apenas os n�meros impares. O teste para n�meros impares deve ser implementado em uma fun��o separada do programa principal. Por fim, imprima a soma de todos os n�meros impares.

.data


.text

main:	addi $s7, $zero, 10
	add $s0, $zero, $zero  # i = 0  (addi $s0, $zero, 0)
	add $s5, $zero, $zero # acumulador = 0

LOOP1:	#le um inteiro
	addi $v0, $zero, 5
	syscall
	
	#testar se o valor lido eh impar (verificar se o ultimo bit � 0)
	add $s1, $v0, $zero
	
	addi $s2, $zero, 1 #zerando e colocando 1 no ultimo bit $s2 ...000001 -- M�SCARA DE BIT
	and $s2, $s2, $s1 # & L�GICO
	
	#VERIFICAR SE s2 � IMPAR
	
	beq $s2, $zero,NEXT1 #If s2 for = a zero vai para o label NEXT1
	add $s5, $s5, $s1
	
NEXT1: 	addi $s0, $s0, 1   # i++
	bne $s0, $s7, LOOP1 # Compara os valores do s0 com o s7 (if s0 != s7) then LOOP1
	
	#imprime o valor acumulado
	addi $v0, $zero, 1
	add $a0, $zero, $s5 
	syscall
	
	#return 0
	addi $v0, $zero, 10
	syscall
	
	
