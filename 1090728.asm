.globl main
.data 
	Input:	.string"Input a number:\n"
	Output:	.string"The damage:\n"
.text
main:
	la  a0, Input		
	li  a7, 4
	ecall
	li  a7 5
	ecall
	jal  ra, F
End:
	mv  t2, a0
	la  a0, Output
	li  a7,4
	ecall
	mv  a0, t2
	li  a7,1
	ecall
	li  a7, 10
	ecall
F:
	addi  sp, sp, -4	#r�إ�stack
	sw  ra, 0(sp)		#���N�^�Ǫ���m�s�_��
	addi t0, zero, 20	#t0 = 20
	ble  a0, t0, L2		#�P�_�O�_�p�󵥩�20�h�hL2
	addi  sp, sp, -4	#�إ�stack
	sw  a0, 0(sp)		#�Na0�s�bstack��
	addi  t2, zero, 5 	#t2=5
	div  a0, a0, t2		#a0=a0/5
	jal  ra, F		#F(a0/5)
	mv  t2, a0		#�NF(a0/5)�s�bt2
	lw  a0, 0(sp)		#Ū���쥻��a0
	addi  t3, zero, 2	#t3=2
	mul  a0, a0, t3		#x=x*2
	add  a0, a0, t2		#a0=x*3+F(x/5)
	addi  sp, sp , 4	#�^�_stack
	j L7
L2:
	addi  t0 ,zero, 10	#t0=10
	ble  a0, t0, L3		#�P�_a0�O�_�p�󵥩�10�h�hL3
	addi  t0, zero, 20	#t0=20
	bgt  a0, t0, L3		#�P�_a0�O�_�j��20�h�hL3
	addi  sp, sp, -8	#�إ�stack
	sw  a0, 4(sp)		#�Na0�s�bstack��
	addi  a0, a0, -2	#a0=a0-2
	jal  ra, F		#F(x-2)
	sw  a0, 0(sp)		#�NF(x-2)�s��stack��
	lw  a0, 4(sp)		#Ū���쥻��a0
	addi  a0, a0, -3	#a0=a0-3
	jal  ra, F		#F(x-3)
	lw  t0, 0(sp)		#�NF(x-2)�s��t0
	add  a0, a0, t0		#F(x-3)+F(x-2)
	addi  sp, sp, 8		#�^�_stack
	j L7
L3:
	addi  t0, zero, 1	#t0=1
	ble  a0, t0, L4		#�P�_�O�_�p�󵥩�1�h�hL4
	addi  t0, zero, 10	#t0=10
	bgt  a0, t0, L4		#�P�_�O�_�j��10�h�hL4
	addi  sp, sp, -8	#�إ�stack
	sw  a0, 4(sp)		#�Na0�s�bstack��
	addi  a0, a0, -1	#a0=a0-1
	jal  ra, F		#F(x-1)
	sw  a0, 0(sp)		#�NF(x-1)�s��stack��
	lw  a0, 4(sp)		#Ū���쥻��a0
	addi  a0, a0, -2	#a0=a0-2
	jal  ra, F		#F(x-2)
	lw  t0, 0(sp)		#�NF(x-1)�s��t0
	add  a0, a0, t0		#F(x-3)+F(x-2)
	addi  sp, sp, 8		#�^�_stack
	j L7
L4:
	bne   a0, zero, L5	#�P�_�O�_������0�h�hL5
	addi  a0, zero, 1	#a0=1
	j L7
L5:
	addi  t0, zero, 1	#t0=1
	bne   a0, t0, L6	#�P�_�O�_������1�h�hL6
	addi  a0, zero, 5	#a0=5
	j L7
L6:
	addi  a0, zero, -1	#a0=-1
	j L7
L7:
	lw  ra, 0(sp)		#Ū���쥻���^�Ǧ�m
	addi  sp, sp, 4		#�^�_stack
	jalr  x0, ra, 0
