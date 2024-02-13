.data
	mas:
		.byte 0b00100000
	menos:
		.byte 0b00011111
	var:
		size = 20
	buf:					#creates 3 buffers for changing the inputs
		.space size
	buf2:
		.zero size

.text
.globl _start
_start:
	call read
	
	movl	$size,%ecx	#sets loop's counter to 20
	movl 	$0, 	%esi	#inicialize index to 0
	call to_minus
	
	movl	$buf2,%edi
	call print
	
	movl	$size,%ecx
	movl 	$0, 	%esi
	call to_mayus
	
	call print
	
	movl	$size,%ecx
	movl	$0,	%esi
	call conm
	
	call print
	
	movl	$1,	%eax	# exit process
	movl	$0,	%ebx	# and returns 0
	int	$0x80

read:
	movl 	$3, 	%eax	# reads from
	movl 	$0, 	%ebx	# keyboard and
	movl	$buf,	%ecx	# writes in msg what's read
	movl	$size,%edx	# 20 bytes	
	int 	$0x80
	
	ret
	
print:
	movl 	$4, 	%eax	# writes data
	movl 	$1, 	%ebx	# in desktop
	movl	%edi,	%ecx	# from msg
	movl	$size,%edx	# with len 20B
	int 	$0x80
	
	ret
	
to_minus:
	movb	buf(%esi),	%al
	orb	mas,	%al
	movb	%al,	buf2(%esi)
	incl	%esi
	loop	to_minus
	
	ret

to_mayus:
	movb	buf(%esi),	%al
	orb	mas,	%al
	sub	mas,	%al
	movb	%al,	buf2(%esi)
	incl	%esi
	loop	to_mayus
	
	ret

conm:
	movb 	buf(%esi),	%al
	xorb 	mas,	%al
	movb 	%al, 	buf2(%esi)
	incl 	%esi
	loop 	conm
	
	ret
