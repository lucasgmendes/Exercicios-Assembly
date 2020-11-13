############################################################
#IO.m
#
#DDA 31.08.2016
############################################################


.data
inteiro:  .word    42
real:     .float   3.1415
duplo:    .double  2.718281828459045235360287471352662497757247093
enter:    .asciiz  "\n"
hworld:   .asciiz  "Oi Mundo!"
sbuffer:  .space   30

.macro done
       li $v0, 10
       syscall
.end_macro

.macro printNewLine
       li $v0, 4
       la $a0, enter
       syscall
.end_macro

.text
       la        $s0, inteiro
       lw        $s0, 0($s0)
       
       la        $s1, real
       lwc1      $f20, 0($s1)
       
       la        $s2, duplo
       lwc1      $f22, 0($s2)
       lwc1      $f23, 4($s2)

       la        $s3, hworld
#imprime inteiro       
       li        $v0, 1   #código da syscall
       add       $a0, $zero, $s0
       syscall
       printNewLine
#imprime inteiro em haxadecimal
       li        $v0, 34  #código da syscall
       add       $a0, $zero, $s0
       syscall
       printNewLine
#imprime inteiro em binário
       li        $v0, 35  #código da syscall
       add       $a0, $zero, $s0
       syscall
       printNewLine
#imprime um float
       li       $v0, 2
       mov.s    $f12, $f20
       syscall
       printNewLine
#imprime um double
       li       $v0, 3
       mov.d    $f12, $f22 
       syscall
       printNewLine
#imprime string
       li       $v0, 4
       add      $a0, $zero, $s3
       syscall
       printNewLine
############################################################
       
#lê inteiro
       li       $v0, 5 
       syscall
#lê real
       li       $v0, 6
       syscall
#lê duplo
       li      $v0, 7
       syscall
#lê string
       li      $v0, 8
       addi    $a1, $zero, 30
       la      $a0, sbuffer
       syscall
       
       
       done