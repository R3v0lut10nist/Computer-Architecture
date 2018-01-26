#array.asm - store user defined number into array of size 8

.data
.align	2 				#align on 2^2 byte (= word) boundary
# .align 0 				#for address errors as it turns of automatic alignment of .word
start:	.asciiz "\nInput array is:\n"
nl:		.asciiz "\n"
output:	.asciiz "Enter number: "
arr:	.word   1, 2, 3, 4, 5, 6, 7, 8

.text
main:
    # initialize loop
    la  $t0, arr 		#array addr
    li  $t1, 1			#index

readloop:
    # print output
    li  $v0, 4
    la  $a0, output
    syscall
    
    # read arr[t1]
    li  $v0, 5
    syscall
    sw  $v0, 0($t0)		#M[$t0+0]=$v0
    
    # index++
    add $t1, 1
    add $t0, 4			#$t0=$t0+4 address of next word
    bgt $t1, 8, print	#if $t1>8 end readloop and (jump)branch to print
    b	readloop

print:
    # print start
    li  $v0, 4
    la  $a0, start
    syscall
    
    # initialize loop counters
    la  $t0, arr		#array addr
    li  $t1, 1			#index

printloop:
    # print arr[t1]
    li  $v0, 1
    lw  $a0, 0($t0)
    syscall
    
    # print newline
    li  $v0, 4
    la  $a0, nl
    syscall
    
    # index++
    add $t1, 1
    add $t0, 4
    bgt $t1, 8, exit		#if $t1>8 end printloop and (jump)branch to exit
    b	printloop

exit:	
	li		$v0, 10						#syscall-10 exit
	syscall
