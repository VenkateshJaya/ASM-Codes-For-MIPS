.data
    string1: .asciiz "koushik"
    string2: .asciiz "swaminathan"
    line: .asciiz "\n"
    return: .space 20

.text
main:
    li $t1,'a'
    li $t2,'e'
    li $t3,'i'
    li $t4,'o'
    li $t5,'u'
    la $a1,string2
    jal vowels
    move $a0,$v0
    li $v0,1
    syscall
    la $a0,line
    li $v0,4
    syscall
    la $a0,return
    li $v0,4
    syscall
    la $a0,line
    li $v0,4
    syscall

    la $a1,string1
    jal vowels
    move $a0,$v0
    li $v0,1
    syscall
    la $a0,line
    li $v0,4
    syscall
    la $a0,return
    li $v0,4
    syscall
    la $a0,line
    li $v0,4
    syscall

    li $v0,10
    syscall

vowels:
    la $v1,return
    li $v0,0 
loop:
    lb $a0,($a1)
    beq $a0,$t1,increment
    beq $a0,$t2,increment
    beq $a0,$t3,increment
    beq $a0,$t4,increment
    beq $a0,$t5,increment
    lb $t7,($a1)
    sb $t7,($v1)
    addi $v1,$v1,1
notvowel:
    addi $a1,$a1,1
    lb $t6,($a1)
    bne $t6,$zero,loop
    jr $ra

increment:
    addi $v0,$v0,1
    j notvowel












