.data
	space: .asciiz " ,"
	message: .asciiz "Fim do while"
.text

main:
  
  addi $t0, $zero, 0# i = 0
  while:
	bgt $t0, 10, Exit
	jal PrintTheValue
	
	addi $t0, $t0, 1
	
	j while
  
   Exit:
 	li $v0,4
 	la $a0,message
 	syscall 


 #Fim do programa 
 li $v0, 10
 syscall
  
  PrintTheValue:
  	li $v0,1
  	add $a0, $t0, $zero
  	syscall
  	
  	li $v0, 4
  	la $a0, space
  	syscall
  	
  	jr $ra
