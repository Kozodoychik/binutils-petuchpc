	.text
	.globl	_start
	.type	_start, @function
_start:
	movq	_DYNAMIC@GOTPCREL(%rip), %rax
	movq	_DYNAMIC@GOTPCREL(%rip), %r26
	.size	_start, .-_start
