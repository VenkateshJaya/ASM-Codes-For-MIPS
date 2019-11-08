.data
    choice: .asciiz "1 for Square, 2 for triangle"
    line: .asciiz "\n"
    star: .asciiz "*"
    space: .asciiz " " 
.text
main:
    li $t6,2
    la $t0,star
    la $t1,line

    jal trianglefunc

    li $v0,10
    syscall

trianglefunc:
    li $v0,5
    syscall

    move $a1,$v0
    li $a3,1
    
    loop00:
        move $a2,$a3
        sub $t5,$a1,$a3
        loop11:
            div $t5,$t6
            mflo $t5
            bne $t5,$zero,loop3
        back:    
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

    loop3:
        la $a0,space
        li $v0,4
        syscall
        addi $t5,$t5,-1
        bne $t5,$zero,loop3
        j back











