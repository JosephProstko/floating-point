###################################################################
#  This program disassembles a float and returns their
#  appropriate sign, exponent, and fraction values using procedures
#  as well as other mathematical information.
#  Program: Printing more abour a Floating Point Number
#  Author: Joseph Prostko
#  Version: November 2019
###################################################################
	  .data		
expvalue1:   .space	4		 	# Word expvalue1 = new Word()
fracvalue1:  .space	4		 	# Word fracvalue1 = new Word()
tempfloat:   .space	4		 	# Float tempfloat = new Float()

space:	  .asciiz	" "			# String space = " "
htitle:	  .asciiz	"\nHexidecimal: "	# String htitle = "Hexidecimal: "
ftitle:	  .asciiz	"\n\nFloat Variable"	# String ftitle = "Float Variable: "
dectitle: .asciiz	"\nDecimal: "		# String dectitle = "Decimal: "
fname:	  .asciiz	"\nFloat:  "	 	# String fname = "Float: "
abtitle:  .asciiz	"\nAbsolute Value: "	# String abtitle = "Absolute Value: "
sqtitle:  .asciiz	"\nSquare Root: "	# String sqtitle = "Square Root: "
trntitle: .asciiz	"\nTruncate: "		# String trntitle = "Truncate: "
rndtitle: .asciiz	"\nRound: "		# String rndtitle = "Round: "
ceititle:  .asciiz	"\nCeiling: "		# String ceititle = "Ceiling: "
flotitle:  .asciiz	"\nFloor: "		# String flotitle = "Floor: "
exp:	  .asciiz	"Exponent: "	 	# String exp = "Exponent: "
value:	  .asciiz	"\nActual Value: " 	# String value = "	Value: "
possign:  .asciiz	"Sign:+ "	 	# String possign = "Sign:+ "
negsign:  .asciiz	"Sign:- "	 	# String negsign = "Sign:- "

binaryfrac:  .asciiz	" Fraction: B1." 	# String binaryfrac = " Fraction: B1"
floatnum: .float	1,-2,3.3,5.6		# Float floatnum = -0.06
	  .text
	  .globl	main
main:

	la	$s3,floatnum		# temp = floatnum 
	lw	$a0,($s3)		# parameter = temp
floop:

	jal	FloatPr			# FloatPr(temp)
	addi	$s3,$s3,4		# temp += 4 bytes
	lw	$a0,($s3)		# parameter = temp
	
	
	bnez	$a0,floop		# if (parmater != 0) goto floop

	li	$v0,10			# System.exit()
	syscall
###################################################################
#  This procedure prints the corresponding hexidecimal value of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	FloatPr
###################################################################
HexPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	lw      $s0,4($sp)		# number = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	li	$v0,34			# System.out.print = Hexidecimal
	la 	$a0,($s0)		# System.out.print(number)
	syscall
	
	li	$v0,4			# System.out.print = String
	la	$a0,space		# System.out.print = " "
	syscall
	
	lw      $ra, 0($sp)		# return address = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure prints the corresponding decimal value of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	FloatPr
###################################################################
DecPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	lw      $s0,4($sp)		# number = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	li	$v0,1			# System.out.print = Integer
	la 	$a0,-4($sp)		# System.out.print(number)
	syscall
	
	lw      $ra, 0($sp)		# return address = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure prints the corresponding absolute value of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	FloatPr
###################################################################
AbsPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	l.s     $f0,4($sp)		# floatNumber = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	abs.s	$f1,$f0			# floatNumberOne = AbsoluteValue(floatNumber)
	s.s	$f1,-4($sp)		# stack[4] = floatNumberOne
	
	li	$v0,2			# System.out.print = Float
	l.s	$f12,-4($sp)		# System.out.print(floatNumberOne)
	syscall
	
	lw      $ra, 0($sp)		# return address = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure prints the corresponding square root of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	FloatPr
###################################################################
SqrPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	l.s     $f0,4($sp)		# floatNumber = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	sqrt.s	$f1,$f0			# floatNumberOne = SquareRoot(floatNumber)
	s.s	$f1,-4($sp)		# stack[4] = floatNumberOne
	
	li	$v0,2			# System.out.print = Float
	l.s	$f12,-4($sp)		# System.out.print(floatNumberOne)
	syscall
	
	lw      $ra, 0($sp)		# return address = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure prints the corresponding truncate of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	FloatPr
###################################################################
TrnPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	l.s     $f0,4($sp)		# floatNumber = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	trunc.w.s	$f1,$f0		# floatNumberOne = Truncate(floatNumber)
	cvt.s.w		$f1,$f1		# floatNumberOne = (Float)floatNumberOne
	s.s		$f1,-4($sp)	# stack[4] = floatNumberOne
	
	li	$v0,2			# System.out.print = Float
	l.s	$f12,-4($sp)		# floatParameter = stack[4]
	syscall
	
	lw      $ra, 0($sp)		# return address = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure prints the corresponding square root of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	FloatPr
###################################################################
RndPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	l.s     $f0,4($sp)		# floatNumber = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	round.w.s	$f1,$f0		# floatNumberOne = Round{floatNumber}
	cvt.s.w		$f1,$f1		# floatNumberOne = (Float)floatNumberOne
	s.s		$f1,-4($sp)	# stack[4] = floatNumberOne
	
	li	$v0,2			# System.out.print = Float
	l.s	$f12,-4($sp)		# floatParameter = stack[4]
	syscall
	
	lw      $ra, 0($sp)		# return address = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure prints the corresponding square root of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	FloatPr
###################################################################
CeiPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	l.s     $f0,4($sp)		# floatNumber = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	ceil.w.s	$f1,$f0		# floatNumberOne = Ceiling(floatNumber)
	cvt.s.w		$f1,$f1		# floatNumberOne = (Float)floatNumberOne
	s.s		$f1,-4($sp)	# stack[4] = floatNumberOne
	
	li	$v0,2			# System.out.print = Float
	l.s	$f12,-4($sp)		# floatParameter = stack[4]
	syscall
	
	lw      $ra, 0($sp)		# return adddress = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure prints the corresponding square root of a 
#  float number.
#  Calling Sequence:
#       sw	$a0,-4($sp)	
#	jal	main
###################################################################
FloPr:
	addi	$sp, $sp, -8		# stack.push(8 bytes)
	l.s     $f0,4($sp)		# floatNumber = stack[4]
	sw      $ra,0($sp)		# stack[0] = return address
	
	floor.w.s	$f1,$f0		# floatNumberOne = Floor(floatNumber)
	cvt.s.w		$f1,$f1		# floatNumberOne = (Float)floatNumberOne
	s.s		$f1,-4($sp)	# stack[4] = floatNumberOne
	
	li	$v0,2			# System.out.print = Float
	l.s	$f12,-4($sp)		# floatParameter = stack[4]
	syscall
	
	lw      $ra, 0($sp)		# return address = stack[0]
	addi    $sp, $sp, 8		# stack.pop(8 bytes)
	jr 	$ra			# goto return address
###################################################################
#  This procedure dissasmbles a floating point number and prints
#  it's corresponding sign, exponent, fraction and value.
#  Calling Sequence:
#	lw	$a0,floatnum		# FloatPr(floatnum);
#	jal	main
###################################################################
FloatPr:
	addi	$sp,$sp,-4
	sw	$ra,0($sp)		# save return address
	
	la	$t0,($a0)		# temp = parmater
	sw	$t0,tempfloat		# tempfloat = temp
	
	srl	$s1,$a0,23		# exponentValue = temp << 23
	andi	$s1,$s1,0xff		# exponentValue = exponentValue & 0xff
	subi	$s1,$s1,127		# exponentValue -= 127
	sw	$s1,expvalue1		# expvalue1 = exponentValue
	
	andi	$s2,$a0,0x7fffff	# fractionValue = floatnum & 0x7fffff
	sll	$s2,$s2,9		# fractionValue.leftAlign()
	sw	$s2,fracvalue1		# fracvalue1 = fractionValue

	li	$v0,4			# System.out.print = String
	la	$a0,ftitle		# System.out.println("Float Variable:")
	syscall
	
	li	$v0,4			# System.out.print = String
	la	$a0,dectitle		# System.out.println("Deimal: ")
	syscall
	
	la	$a0,($t0)		# parameter = temp
	sw	$a0,-4($sp)		# stack[4] = parameter
	jal	DecPr			# goto DecPr(temp)
	
	li	$v0,4			# System.out.print = String
	la	$a0,htitle		# System.out.print("Hexidecimal: ")
	syscall
	
	la	$a0,($t0)		# parameter = temp
	sw	$a0,-4($sp)		# stack[4] = parameter
	jal	HexPr			# goto HexPr(temp)

	li	$v0,4			# System.out.print = String
	la	$a0,fname		# System.out.print("Float: ")
	syscall

	srl	$s0,$t0,31		# signValue = temp << 31

	bnez	$s0,NegativeFloat	# if (signValue != 0) goto NegativeFloat
	li	$v0,4			# System.out.print = String
	la	$a0,possign		# System.out.print("Sign:+ ")
	syscall
	b	printExp1		# goto printExp1
	
NegativeFloat:
	li	$v0,4			# System.out.print = String
	la	$a0,negsign		# System.out.print("Sign:- ")
	syscall
	
printExp1:
	li	$v0,4			# System.out.print = String
	la	$a0,exp			# System.out.print("Exponent: ")
	syscall
	
	li	$v0,1			# System.out.print = Integer
	lw	$a0,expvalue1		# System.out.print(exponentValue)
	syscall

printFrac1:
	li	$v0,4			# System.out.print = String
	la	$a0,binaryfrac		# System.out.print(" Fraction: B1")
	syscall
	
	li	$v0,35			# System.out.print = Binary
	lw	$a0,fracvalue1		# System.out.print(fractionValue)
	syscall

printValue1:
	li	$v0,4			# System.out.print = String
	la	$a0,value		# System.out.println("Actual Value: ")
	syscall
	
	li	$v0,2			# System.out.print = Float
	l.s	$f12,tempfloat		# System.out.print(floatnum)
	syscall
	
	li	$v0,4			# System.out.print = String
	la	$a0,abtitle		# System.out.print("Absolute Value: ")
	syscall
	
	l.s	$f0,tempfloat		# floatParameter = tempFloat
	s.s	$f0,-4($sp)		# stack[4] = floatParameter
	jal	AbsPr			# goto AbsPr(tempFloat)
	
	li	$v0,4			# System.out.print = String
	la	$a0,sqtitle		# System.out.print("Square Root: ")
	syscall
	
	l.s	$f0,tempfloat		# floatParameter = tempFloat
	s.s	$f0,-4($sp)		# stack[4] = floatParameter
	jal	SqrPr			# goto SqrPr(tempFloat)
	
	li	$v0,4			# System.out.print= String
	la	$a0,trntitle		# System.out.print("Truncate: ")
	syscall
	
	l.s	$f0,tempfloat		# floatParameter = tempFloat
	s.s	$f0,-4($sp)		# stack[4] = floatParameter
	jal	TrnPr			# goto TrnPr(tempFloat)
	
	li	$v0,4			# System.out.print = String
	la	$a0,rndtitle		# System.out.print ("Round: ")
	syscall
	
	l.s	$f0,tempfloat		# floatParameter = tempFloat
	s.s	$f0,-4($sp)		# stack[4] = floatParameter
	jal	RndPr			# goto RndPr(tempFloat)
	
	li	$v0,4			# System.out.print = String
	la	$a0,ceititle		# System.out.print("Ceiling: ")
	syscall
	
	l.s	$f0,tempfloat		# floatParameter = tempFloat
	s.s	$f0,-4($sp)		# stack[4] = floatParameter
	jal	CeiPr			# goto CeiPr(tempFloat)
	
	li	$v0,4			# System.out.print = String
	la	$a0,flotitle		# System.out.print("Floor: ")
	syscall
	
	l.s	$f0,tempfloat		# floatParameter = tempFloat
	s.s	$f0,-4($sp)		# stack[4] = floatParameter
	jal	FloPr			# goto FloPr(tempFloat)
	
	lw	$ra,0($sp)		# return address = stack[0]
	addi	$sp,$sp,4		# stack.pop(4 bytes)
	jr	$ra			# return to main
