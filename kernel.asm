org 0x7e00
jmp 0x0000:inicio

data:
    brincadeira db "        Brincadeirinhaaaaaaaa :p", 0
    brincadeira2 db "         A RESPOSTA CORRETA EH", 0 
    brincadeira3 db "   = Infraestrutura de Software <3 =", 0
    start db "                 START", 0
    creditos db "    = Layse Araujo e Vitor Aguiar =                                                                                   ", 0
    menu db "               INSTRUCOES             ", 0
    menu1 db "1. Digite apenas uma letra corresponden-   te a alternativa correta.           ", 0
    menu2 db "2. Tecle enter para saber se acertou.  ", 0
    menu3 db "3. Se voce acertou a tela ficara verde,    caso contrario vermelha.            ", 0
    menu4 db "4. Se voce errar tera que responder tudo   novamente.", 0
    menu5 db "5. Tecle enter para ir para a proxima      pergunta.", 0
    menu6 db "6. Tecle espaco para finalizar o jogo.", 0
    nome db "                Quizada?", 0 ;nome do nosso joguinho
    errou db "Voce errou :("
    errou2 db "Tente novamente!"
    parabens db "Voce concluiu o nosso quiz, obrigado! ^^", 0
    pergunta1 db "Qual pais produz mais pescado?           a)Japao b)Brasil c)Argentina           R:", 0 ;R: a)Japão
    pergunta2 db "Calcule: 2+2=?                           a)2019 b)1000000 c)4                   R:", 0 ;R: c)4
    pergunta3 db "Qual jogador ganhou a bola de ouro em   2017? a)Messi b)CR7 c)Neymar            R:", 0 ;R: b)CR7
    pergunta4 db "Em que pais podemos saborear um sorvete sabor enguia? a)Russia b)Japao c)China  R:", 0 ;R: b)Japão
    pergunta5 db "Qual pais nao participou do Protocolo   Kyoto? a)Brasil b)Tanzania c)EUA        R:", 0 ;R: c)EUA
    pergunta6 db "Onde esta localizado o golfo de Vizcaya? a)Europa b)Asia c)Oceania              R:", 0 ;R: a)Europa
    pergunta7 db "Qual o elemento da natureza que nos     respiramos? a)Ar b)Fogo c)Agua          R:", 0 ;R: a)Ar
    pergunta8 db "Qual o tipo de respiracao do ser humano? a)Pulmonar b)Pelo Cabelo c)Cultanea    R:", 0 ;R: a)Pulmonar
    pergunta9 db "Qual a maior palavra da lingua portuguesa? a)Inconstitucionalicimamente             b)Software                              c)Pneumoultramicroscopicossilicovul-canoconiotico                           R:", 0 ;R: c)Pneumoultramicroscopicossilicovulcanoconiótico
    pergunta10 db "Qual a melhor cadeira do CIn?            a)Infra de Software b)Infra de Hardware c)Nenhuma :)                           R:", 0 ;R: c)Nenhuma :)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

inicio:
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    mov ah, 0
    mov bh, 13h 
    int 10h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_nome:
    call limpa_tela

    mov ah, 0xb
    mov bh, 0
    mov bl, 13

    int 10h

    mov bl, 11 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha

    mov si, nome
    mov cl, 0
    call print_string_nome

    mov ah, 0
    int 0x16 ; = int 16h

    cmp al, 13
    jne move_nome
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_menu:
    call limpa_tela

    mov ah, 0xb
    mov bh, 0
    mov bl, 2

    int 10h

    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    call pula_linha
    call pula_linha
    call pula_linha

    mov si, menu
    mov cl, 0
    call print_string

    call pula_linha

    call pula_linha

    mov si, menu1
    mov cl, 0
    call print_string

    call pula_linha

    mov si, menu2
    mov cl, 0
    call print_string

    call pula_linha

    mov si, menu3
    mov cl, 0
    call print_string

    call pula_linha

    mov si, menu4
    mov cl, 0
    call print_string

    call pula_linha
    call pula_linha

    mov si, menu5
    mov cl, 0
    call print_string

    call pula_linha
    call pula_linha

    mov si, menu6
    mov cl, 0
    call print_string

    call pula_linha

    call pula_linha
    
    mov si, start
    mov cl, 0
    call print_string


    mov ah, 0
    int 0x16 ; = int 16h

    cmp al, 32
    je fim

    cmp al, 13
    jne move_menu

    call limpa_tela

    jmp fim_tela_instrucao
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

printa_tente_novamente:

fim_tela_instrucao:
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov ah, 0xb
    mov bh, 0
    mov bl, 0

    int 10h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta1:
    int 10h
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10
    
    mov si, pergunta1
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 97
    je acertou_pergunta1

    jmp errou_pergunta1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta1:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta1
    
    ;call limpa_tela

    call print_tela_verde
    
    jmp move_pergunta2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta1:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta1
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta2:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta2
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 99
    je acertou_pergunta2

    jmp errou_pergunta2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta2:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta2
    
    ;call limpa_tela

    call print_tela_verde

    jmp move_pergunta3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta2:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta2
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta3:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta3
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 98
    je acertou_pergunta3

    jmp errou_pergunta3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta3:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta3
    
    ;call limpa_tela

    call print_tela_verde

    jmp move_pergunta4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta3:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta3
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta4:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta4
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 98
    je acertou_pergunta4

    jmp errou_pergunta4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta4:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta4
    
    ;call limpa_tela

    call print_tela_verde
    
    jmp move_pergunta5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta4:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta4
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta5:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta5
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 99
    je acertou_pergunta5

    jmp errou_pergunta5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta5:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta5
    
    ;call limpa_tela

    call print_tela_verde

    jmp move_pergunta6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta5:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta5
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta6:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta6
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 97  
    je acertou_pergunta6

    jmp errou_pergunta6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta6:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta6
    
    ;call limpa_tela

    call print_tela_verde

    jmp move_pergunta7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta6:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta6
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta7:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta7
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 97
    je acertou_pergunta7

    jmp errou_pergunta7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta7:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta7
    
    ;call limpa_tela

    call print_tela_verde

    jmp move_pergunta8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta7:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta7
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta8:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta8
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 97
    je acertou_pergunta8

    jmp errou_pergunta8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta8:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta8
    
    ;call limpa_tela

    call print_tela_verde

    jmp move_pergunta9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta8:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta8
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta9:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta9
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10
    
    cmp al, 32
    je fim

    cmp al, 99
    je acertou_pergunta9

    jmp errou_pergunta9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta9:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne acertou_pergunta9
    
    ;call limpa_tela

    call print_tela_verde

    jmp move_pergunta10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta9:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta9
    
    ;call limpa_tela

    call print_tela_vermelha
    
    jmp move_pergunta10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

move_pergunta10:
    call pula_linha
    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    mov si, pergunta10
    mov cl, 0
    call print_string

    mov ah, 0
    int 0x16 ; = int 16h
    
    mov ah, 0xe
    mov al, al
    mov BH, 0
    int 0x10

    cmp al, 32
    je fim

    cmp al, 99
    je acertou_pergunta10

    jmp errou_pergunta10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

acertou_pergunta10:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13 
    jne acertou_pergunta10
    
    ;call limpa_tela

    call print_tela_verde

    call print_brincadeira

    jmp fim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

errou_pergunta10:
    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne errou_pergunta10
    
    ;call limpa_tela

    call print_tela_vermelha

    jmp fim
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

fim:
    call limpa_tela

    mov ah, 0xb
    mov bh, 0
    mov bl, 9

    int 10h

    mov bl, 15 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    
    int 10h

    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha

    mov si, parabens
    mov cl, 0
    call print_string_nome

    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha

    mov si, creditos
    mov cl, 0
    call print_string_nome

    jmp final
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print_string:
    lodsb
    mov ah, 0eh
    int 10h
    
    cmp al, 0
    jne print_string
    
    ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print_tela_verde:
    mov ah, 0xb
    mov bh, 0
    mov bl, 10

    int 10h

    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne print_tela_verde

    mov ah, 0xb
    mov bh, 0
    mov bl, 0

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

print_brincadeira:
    call limpa_tela

    mov ah, 0xb
    mov bh, 0
    mov bl, 13

    int 10h

    mov bl, 11 ;Escolher a cor
	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    
    mov si, brincadeira
    mov cl, 0
    call print_string_nome

    call pula_linha
    call pula_linha

    mov si, brincadeira2
    mov cl, 0
    call print_string_nome

    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    call pula_linha
    
    mov si, brincadeira3
    mov cl, 0
    call print_string_nome

    mov ah, 0
    int 0x16 ; = int 16h

    cmp al, 13
    jne print_brincadeira

    jmp fim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print_tela_vermelha:
    mov ah, 0xb
    mov bh, 0
    mov bl, 4 
    
    int 10h

    mov ah, 0
    int 0x16 ; = int 16h
    
    cmp al, 13
    jne print_tela_vermelha

    mov ah, 0xb
    mov bh, 0
    mov bl, 0

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

    mov si, errou
    mov cl, 0

    jmp move_pergunta1
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

print_string_nome:
    lodsb
    mov ah, 0eh
    int 10h
    mov dx, 100
    
    call delay
    
    cmp al, 0
    jne print_string_nome
    
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

final:
    times 3170-($-$$) db 0 ;3072 bytes
    jmp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   