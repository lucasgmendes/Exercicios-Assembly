#Desenvolva um programa que leia 42 inteiros longos não sinalizados (32 bits unsigned long)
# e armazene os valores lidos em um array de 42 inteiros inicializado inicialmente com zeros
# em todas as posições. 

#A seguir o programa deve chamar três funções, uma que calcula a soma
# de todos os elementos do array, outra que retorne o menor valor e outra que retorne o maior
# valor. 

#Imprima todos os três resultados das funções na saída padrão. 
#Salve e restaure da pilha todas as variáveis pertinentes (Housekeeping).

.data
array:	.word	0:5 #carrega um array de 5 elementos inicializados com 0
size1:	.word	5
newLine: .asciiz "\n"
.text

#LEITURA DOS NÚMEROS

addi $t0, $zero,0 # index = 0

while:
	beq $t0, 20, imprimir #5 elementos * 4(Bytes)
 	
 	# Lê um inteiro do treclado
 	addi $v0, $zero, 5
 	syscall
 	
 	sw $v0, array($t0)
 	
	addi $t0, $t0, 4 #index ++
	
	j while

imprimir:
	addi $t0, $t0, 0 # index = 0
   
   while2:
	beq $t0, 20, exit
	
	lw $t6, array($t0)
	
	#imprimir os numeros do array
 	li $v0,1
 	addi $a0, $t6, 0
 	syscall
	
	#imprimir quebra de linha
	li $v0,4
	la $a0, newLine
	syscall
	
	addi $t0, $t0, 4
	
	j while2

exit:
	li $v0,10
	syscall