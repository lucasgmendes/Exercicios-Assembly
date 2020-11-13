#MULTIPLICAÇÃO DE UMA MATRIZ 3x3 --> X vs Y = R
#Posição dos Bytes da matris:
#
#	|00|04|08|
#	|12|16|20|
#	|24|28|32|
#
.data
X: .space 36 #4 BYTES x 9 (posições da matriz)
Y: .space 36
R: .space 36

la $s0,X
la $s1,Y
la $s2,R

lw $t0,0($s0) #Carrega a matriz X para t0
lw $t1,0($s1) #Carrega a matriz Y para t1

addi $s7,$zero,3 #Parâmetro para o LOOP1
addi $s6,$zero,3 #Parâmetro para o LOOP2
addi $s5,$zero,3 #Parâmetro para o LOOP3

LOOP1:
	madd $t2, $t0, $t1 #multiplica t0 e t1 e acumula a soma das multiplicaçoes em t2
	
	addi $t0, $t0, 4
	addi $t1, $t1, 12
	
	addi $s7, $s7, -1
	bgt $s7, $zero, LOOP1

LOOP2:
	addi $s7,$zero,3 #Reinicia o parâmetro do LOOP1
	
	sw $t2, 0($s2) #Salva na matriz resultante o resultado de um elemento
	addi $s2, $s2, 4
	
	addi $t0, $t0, -8 #Ajusta p/ voltar na 1ª posição da linha da matriz X
	addi $t1, $t1, -20 #Ajusta p/ a proxima coluna da matriz Y
	
	addi $s6, $s6, -1
	
	bgt $s6, $zero, LOOP1
	
LOOP3:
	addi $s7,$zero,3 #Reinicia o parâmetro do LOOP1
	
	addi $t1, $t1, 12 #Ajusta para a proxima linha da matriz X
	lw $t1,0($t1) #Reinicia a matriz Y para o primeiro elemento
	
	addi $s5, $s5, -1
	
	bgt $s5, $zero, LOOP1
#----------------------------------------------------------------------------

#Suponha que a matriz Y está transposta, ou seja, as linhas viraram colunas:

addi $s7, $zero, 3
addi $s6, $s6, 3
LOOP1:
	madd3 $T2, $T0, $T1
	sw   $T2, 0($s2) #Guarda a soma acumulada das multiplicações na matriz R
	addi3 $T1, $T1, 12 #Passa p/ os proximos 3 numeros de Y
	addi $s2, $s2, 4
	
	addi $s7, $s7, -1
	bgt  $s7, $zero, LOOP1
LOOP2:
	addi $s7, $s7, 3 #Reinicia o contador do LOOP1
	
	addi3 $T0, $T0, 12 #Pula p/ a proxima linha de X
	addi3 $T1, $T1, -36 #Volta p/ a primeira posição de Y
	
	addi $s6, $s6, -1
	bgt  $s6, $zero, LOOP1
