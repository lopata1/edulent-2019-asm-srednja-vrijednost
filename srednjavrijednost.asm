PROGRAM "Srednja vrijednost"
DATA
	n db 6
	v1 db 1
	v2 db 2
	v3 db 3
	v4 db 4
	v5 db 5
	v6 db 6
	tmp db 0     
ENDDATA
CODE
	mov ap, @v1   
	mov a, 0
	mov [-sp], a           
	mov a, n
	mov [-sp], a
	
loop0:  mov a, [sp+]   
	mov [-sp], a
	add a, 0
	jz loop0end
	; zbir = *(arr + n) + zbir
	mov a, @v1
	mov ap, 0x7E
	add a, [ap]
	sub a, 1
	
	mov [-sp], a
	mov ap, [sp+]
	
	mov a, [ap]
	mov ap, 0x7F
	add a, [ap]
	
	mov ap, [sp+]
	sub ap, 1
	mov tmp, ap
	mov ap, [sp+]
	mov ap, tmp
	mov [-sp], a
	mov [-sp], ap
	
	
	jmp loop0
loop0end:mov a, [sp+]
	mov ap, [sp+]
	
	mov a, n 
	mov [-sp], a
	mov [-sp], ap
	call div
	out
	call unallocs	
	end
	
; broj, djelilac
PROCEDURE div
	mov a, 0
	mov [-sp], a
	
	mov ap, 0x7E
	mov a, [ap]
	mov [-sp], a
	
loop1: 	mov ap, 0x7B
	mov a, [ap]
	mov ap, 0x7F
	sub a, [ap]
	jc lendps3
	
	mov ap, [sp+]
	mov [-sp], a
	
	mov ap, [sp+]
	mov a, [sp+]
	add a, 1
	mov [-sp], a
	mov [-sp], ap
	
	jmp loop1
	
lendps3:mov ap, [sp+] 
	mov a, [sp+]
	ret
ENDPROCEDURE
PROCEDURE unallocs
loop2:	mov a, [sp+]  
	mov ap, 0x7F
	mov [-sp], a
	sub a, [ap]
	jz lenduac

	mov a, [sp+]
	mov ap, [sp+]
	mov [-sp], a
	jmp loop2
lenduac:ret
ENDPROCEDURE
ENDPROGRAM