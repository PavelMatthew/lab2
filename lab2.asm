.686
.model FLAT, C

.stack 100h

.DATA

	arr dd 16E6h,0D45Bh,0C9C9h
	arr_size  equ ($ - arr) / 4
	M dd 0h
	R dd ?

.CODE	


lab PROC
	
	
	xor eax, eax 
	xor ebx,ebx
	xor ax,ax
	xor bx,bx

	mov ebx, -4h
	mov ecx, arr_size

	top:
		add ebx, 4h
		add arr[ebx], 3000h
		LOOP top
	
	;теперь наш массив состоит из X',Y',Z'

	mov ebx, 0h

	mov eax, arr[ebx]

	mov M, eax
	
	add ebx, 4h
	mov eax, arr[ebx]
	sub M,eax

	add ebx, 4h
	mov eax, arr[ebx]
	add M,eax
	mov eax, M ; 15444 в десятичной будет

	;проверка условия если 2,6,9,10 биты раны 0
	mov eax, M
	and eax, 1604
	mov ebx, eax

	mov eax, 0
	cmp ebx, eax
	je pp1
	jne pp2
	


	ret

pp1:
		
	mov eax, M
	or eax, 1280 ; получается 15700 в десятичной M 8,10 = 1
	mov R, eax


	mov ebx, 4341
	cmp R, ebx
	jne adr1
	je adr2


	ret
pp2:
		
	mov eax, M
	imul eax, 2 ; умножаем М на 2
	mov R, eax

	mov ebx, 4341
	cmp R, ebx
	jne adr1
	je adr2
	ret

adr1:
	
	mov ebx, 8h
	mov eax, arr[ebx] ; F9C9
	not eax
	mov ebx,eax
	mov eax, R
	or eax, ebx ; ответ -33090
	ret

adr2:
	mov eax, R
	mov ebx, 66
	add eax,ebx

	ret

lab ENDP



END
