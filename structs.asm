############################################################
#structs.m
#
#typedef struct P3D{
#      int x;
#      int y;
#      int z;
#      char nome[10];
#    } Ponto3D;
#
#int main()
#{
#    Ponto3D p1, p2;
#
#    p1.x = 31;
#    p1.y = 42;
#    p1.z = 53;
#
#    p2.x = p1.x + p1.y;
#    p2.y = p1.y + p1.z;
#    p2.z = p1.x + p1.z;
#
#    return 0;
#}
#DDA 31.08.2016
############################################################

.data
p1: .space 24  #22 efetivamente usados
p2: .space 24
.text
        #$t0 aponta para o primeiro byte da struct p1
        la      $t0, p1         
        #$t1 aponta para o primeiro byte da struct p2
        la      $t1, p2        
        
        #####p1.x = 31
        addi    $t7, $zero, 31 
        sw      $t7, 0($t0)
        #####p1.y = 42        
        addi    $t7, $zero, 42
        #calcula onde está p1.y na memória
        add     $t6, $t0, 4
        sw      $t7, 0($t6)
        #####p1.z = 53        
        addi    $t7, $zero, 53
        #calcula onde está p1.y na memória
        add     $t6, $t0, 8
        sw      $t7, 0($t6)
        #p2.x = p1.x + p1.y;
        lw      $t2, 0($t0)   #p1.x
        addi    $t6, $t0, 4
        lw      $t3, 0($t6)   #p1.y
        add     $t2, $t2, $t3
        sw      $t2, 0($t1)   #p2.x = p1.x + p1.y 
        
        #p2.y = p1.y + p1.z;
        addi    $t6, $t0, 4
        lw      $t3, 0($t6)   #p1.y
        addi    $t6, $t0, 8
        lw      $t2, 0($t6)   #p1.z
        add     $t2, $t2, $t3
        addi    $t6, $t1, 4
        sw      $t2, 0($t6)   #p2.y = p1.y + p1.z
               
        #p2.z = p1.x + p1.z;        
        lw      $t3, 0($t0)   #p1.x
        addi    $t6, $t0, 8
        lw      $t2, 0($t6)   #p1.z
        add     $t2, $t2, $t3
        addi    $t6, $t1, 8
        sw      $t2, 0($t6)   #p2.z = p1.x + p1.z 
        
        li $v0, 10
        syscall