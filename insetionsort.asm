#--------------------------------------------------------------------------------
# void insertionSort(int numeros[], int tam) {
#    int i, j, eleito;
#    for (i = 1; i < tam; i++){
#       eleito = numeros[i];
#       j = i - 1;
#       while ((j>=0) && (eleito < numeros[j])) {
#          numeros[j+1] = numeros[j];
#          j--;
#       }
#       numeros[j+1] = eleito;
#    }
# }
#--------------------------------------------------------------------------------

.data

ds: .word 4,3,1,9,8,6,7,5,2
sz: .word 9

.text

f_is:	la		$t0, ds					
		la		$t1, sz					
		lw		$t1, 0($t1)				
		addi	$s0, $zero, 1			
loop1:	slt		$t2, $s0, $t1			
		beq		$t2, $zero, exit1		
		sll		$t3, $s0,2				
		add		$t3, $t0,$t3			
		lw		$s1, 0($t3)				
		addi	$s2, $s0,-1				
			
loop2:	sge     $t4, $s2, $zero			
		sll		$t3, $s2, 2				
		add		$t3, $t0,$t3			
		lw		$s3, 0($t3)				
		slt		$t5, $s1, $s3			
		and		$t4, $t4, $t5			
		beq		$t4, $zero, exit2
		sw		$s3, 4($t3)				
		addi	$s2, $s2 -1				
		j		loop2
exit2:	sw		$s1, 4($t3)				
		addi	$s0,$s0,1				
		j		loop1					
exit1:
