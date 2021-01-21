org 0x500
jmp 0x0000:new

kernel db "Loading structures for the kernel...", 0
setting db "Setting up protected mode...", 0
loading db "Loading kernel in memory...", 0
run db "Running kernel...", 0

new:
call limpa_tela

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ax, 0x7e0 ;0x7e0<<1 = 0x7e00 (início do kernel.asm)
    mov es, ax
    xor bx, bx ;posição es<<1+bx

    

    mov si, kernel
    mov cl, 0
    
    call print_string
    call pula_linha

    mov si, setting
    mov cl, 0
    
    call print_string
    call pula_linha

    mov si, loading
    mov cl, 0
    
    call print_string
    call pula_linha

    jmp reset
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

limpa_tela:
    xor bh, bh
    mov ah, 2
    int 10h

    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    xor bh, bh
    mov ah, 2
    int 10h

    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

delay: 
	mov bp, dx
	
    back:
	    dec bp
	    nop
	
        jnz back
	    dec dx
	
        cmp dx,0    
	    jnz back
    
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print_string:
    lodsb
    mov ah, 0eh
    int 10h
    mov dx, 100
    
    call delay
    
    cmp al, 0
    jne print_string
    
    ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

pula_linha:
    mov al, 10
    mov ah, 0eh
    int 10h
    
    mov al, 13
    mov ah, 0eh
    int 10h
    
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

reset:
    mov ah, 00h ;reseta o controlador de disco
    mov dl, 0 ;floppy disk
    int 13h
    
    jc reset ;se o acesso falhar, tenta novamente
    
    jmp load
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

load:
    mov ah, 02h ;lê um setor do disco
    mov al, 20 ;quantidade de setores ocupados pelo kernel
    mov ch, 0 ;track 0
    mov cl, 3 ;sector 3
    mov dh, 0 ;head 0
    mov dl, 0 ;drive 0
    int 13h
    
    jc load ;se o acesso falhar, tenta novamente

    mov si, run
    mov cl, 0
    
    call print_string
    
    jmp 0x7e00 ;pula para o setor de endereço 0x7e00 (start do boot2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

end:
    times 510-($-$$) db 0 ;512 bytes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;