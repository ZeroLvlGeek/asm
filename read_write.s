.data
	var:
		size = 20
	buf:
		.space size
		

.text
.globl _start
_start:
	movl 	$3, 	%eax	# reads from
	movl 	$0, 	%ebx	# keyboard and
	movl	$buf,	%ecx	# writes in msg what's read
	movl	$size,%edx	# 20 bytes	
	int 	$0x80
	
	movl 	$4, 	%eax	# writes data
	movl 	$1, 	%ebx	# in desktop
	movl	$buf,	%ecx	# from msg
	movl	$size,%edx	# with len 20B
	int 	$0x80
	
	movl	$1,	%eax	# exit process
	movl	$0,	%ebx	# and returns 0
	int	$0x80
	
