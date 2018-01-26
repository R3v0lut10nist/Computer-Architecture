#gcd.asm - Calculate the GCD of 2 numbers using Euclid's GCD Algorithm

.data
output_1:	.asciiz "Enter the 1st number: "	#store the string in memory and null-terminate it
output_2:	.asciiz "Enter the 2nd number: "
answer:		.asciiz "The GCD is: "
nl:			.asciiz	"\n"

.text
main:
	#print output-1
	li		$v0, 4						#sycall-4 prints string (addr stored in $a0)
	la		$a0, output_1				#la - load address of the label output_1
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
	
loop:
	beq		$t0, $t1, end				#if t0==t1 jump to end
	bgt		$t1, $t0, second_greater	#jump to second_greater if $t1>t0 otherwise continue at next instruction
	sub		$t0, $t0, $t1
	b		loop
	
second_greater:
	sub	$t1, $t1, $t0	#$t1=$t1-$t0
	b	loop
end:
	#return the value of gcd obtained
	
	#print answer
	move 	$v1, $t0
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
	
