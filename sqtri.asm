.data
    choice: .asciiz "1 for Square, 2 for triangle"
    line: .asciiz "\n"
    star: .asciiz "*"
.text
main:
    la $a0,choice
    la $t0,star
    la $t1,line
    li $v0,4
    syscall
    
    li $v0,5
    syscall

    li $t0,1

    beq $v0,$t0,square

    jal trianglefunc
    j end

    square:
       jal squarefunc 
end:
    li $v0,10
    syscall

squarefunc:
    li $v0,5
    syscall

    move $a1,$v0
    move $a3,$v0
    
    loop0:
        move $a2,$a1
        loop1:
            la $a0,star
            li $v0,4
            syscall
            addi $a2,$a2,-1
            bne $a2,$zero,loop1
        la $a0,line
        li $v0,4
        syscall
        addi $a3,$a3,-1
        bne $a3,$zero,loop0

    jr $ra

trianglefunc:
    li $v0,5
    syscall

    move $a1,$v0
    li $a3,1
    
    loop00:
        move $a2,$a3
        loop11:
            la $a0,star
            li $v0,4
            syscall
            addi $a2,$a2,-1
            bne $a2,$zero,loop11
        la $a0,line
        li $v0,4
        syscall
        addi $a3,$a3,1
        ble $a3,$a1,loop00 

    jr $ra













