assume cs:code
code segment
	mov ax,0
	mov ds,ax
	mov bx,0200h
	mov cx,64
	s:mov [bx],ax
	add ax,1
	inc bx
	loop s
	mov ax,4c00h
	int 21h
code ends
end