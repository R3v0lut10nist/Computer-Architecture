#add.asm - ADD the 2 numbers provided by the user

.data
output_1:	.asciiz "Enter the 1st number: "	
output_2:	.asciiz "Enter the 2nd number: "
answer:		.asciiz "The answer is: "
nl:			.asciiz	"\n"

.text
main:
	#print output-1
	li		$v0, 4						#sycall-4 prints string (addr stored in $a0)
	la		$a0, output_1				
	syscall
	
	#read input into $t0
	li		$v0, 5						#syscall-5 reads the user input into register $v0
	syscall
	move	$t0, $v0
	
	#print output-2
	li		$v0, 4
	la		$a0, output_2
	syscall
	
	#read input into $t1
	li		$v0, 5
	syscall
	move	$t1, $v0
	
	#add the numbers stored in $t0 and $t1
	add		$v1,$t0,$t1
	
	#print answer
	li		$v0, 4
	la		$a0, answer
	syscall
	li		$v0, 1						#syscall-1 print from $a0
	move	$a0, $v1
	syscall
	
	#print newline
	li		$v0, 4
	la		$a0, nl
	syscall

exit:	
	li		$v0, 10						#syscall-10 exit
	syscall
	
