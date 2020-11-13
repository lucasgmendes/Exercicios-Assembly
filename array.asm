.data
    array: .space 16 #espaço para 4 inteiros
    space: .asciiz ", "
.text

 addi $s0, $zero, 10
 addi $s1, $zero, 20
 addi $s2, $zero, 30
 addi $s3, $zero, 40

 #index = $t0
 
 add $t0, $zero, $zero
 
 sw $s0, array($t0)
 	addi $t0, $t0, 4 #avança um inteiro no index
 sw $s1, array($t0)
 	addi $t0, $t0, 4 #avança um inteiro no index
 sw $s2, array($t0)
 	addi $t0, $t0, 4 #avança um inteiro no index
 sw $s3, array($t0)
 
 
 #zerar indez t0
 addi $t0, $zero, 0
 
 while:
 	beq $t0, 16, exit
 	
 	sw $zero, array($t0)
 	lw $t6, array($t0)
 	
 	addi $t0, $t0, 4
 	
 	#prita os numeros
 	li $v0, 1
 	move $a0, $t6
 	syscall 
 	
 	# PRINTA A ","
 	li $v0, 4
 	la $a0, space
 	syscall
 	
 	j while
 	
 exit:
 	li $v0, 10
 	syscall
 
 
 
 
 
 
 
 
 
 
