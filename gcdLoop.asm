.data
str1: .asciiz "Enter an integer:"
str2: .asciiz "\nEnter another integer:"
str3: .asciiz "\nThe greatest common divisor is:"


.text

main:
	li $v0,4			#Display str1
	la $a0, str1
	syscall
	li $v0,5			#read data-integer from user=number1=$a3

	syscall
	addi $a3, $v0, 0
	li $v0,4			#Display str2
	la $a0,str2
	syscall

	li $v0,5			#read second integer=number2=$a1
	syscall

	addi $a1,$v0,0



 	li $v0,4			#Display str3
 	la $a0,str3
 	syscall



	jal gcdLoop			#call gcdLoop



	addi $a0,$v0,0
	li $v0,1


	syscall

	addi $t1,$v0,0  #return result


#exit the program
	li $v0, 10
	syscall



gcdLoop:

	#int number1,number2
	#int result=0
	addi $t1,$zero,0    #result==t1=0
	bge $a1,$a3, swap   #if number2> number 1, set number1

	swap:
		addi $t6,$a3,0  #number1 stored in t6
		addi $a3,$a1,0   #number1==NUMBER2
		addi $a1,$t6,0   #number2==number1



	do:

        	divu $t3,$a3,$a1    #number1/number2
       		mfhi $t2        # remainder for the div.
       		add $a3,$a1,$0   #number1=number2
       		addi $a1,$t2,0 #number2=remainder
       		addi $t1,$a3,0 #result=number1;


       		j while
       		jr  $ra



	while:
		bne $t2,$zero,do
		add $v0,$zero,$a3
		jr  $ra

