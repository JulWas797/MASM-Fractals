.data

	const_4 real8 4.0
	const_2 real8 2.0

.code

itrcnt proc, x: real8, y: real8, maxi: dword

	xor eax, eax

	xorpd mm0, mm0
	xorpd mm1, mm1
	xorpd mm2, mm2
	xorpd mm3, mm3

	iteration:
		
		movsd mm4, mm2
		subsd mm4, mm3
		addsd mm4, [x]

		movsd mm5, [const_2]
		mulsd mm5, mm0
		mulsd mm5, mm1
		addsd mm5, [y]

		movsd mm0, mm4
		movsd mm1, mm5

		mulsd mm4, mm4
		mulsd mm5, mm5
		addsd mm4, mm5

		comisd mm4, [const_4]

		jae checkcnt

		ret
	
	checkcnt:

		inc eax
		cmp eax, [maxi]

		jb iteration

		ret

itrcnt endp

end