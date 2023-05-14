;PROJECT PHASE 1
;MOMINA MINAHIL 20I-0740
;HADIYA FAROOQ 20I-0579
;SECTION

.model small
.stack 100h
.data

;delcaring variables
file db "myfile.txt",0
xclick1 dw 0
yclick1 dw 0

xclick2 dw 0
yclick2 dw 0

swap struct 

    noofcandies dw 0
    firstcoordinatex dw 0
    lastcoordinatex dw 0
    firstcoordinatey dw 0
    lastcoordinatey dw 0

swap ends

swapobject swap 49 dup ({0,0,0,0,0})
countn dw 0
count dw 0
string1 db "ENTER NAME: ","$"
string2 db "NAME:","$"
n dw 20 dup(0)         ;to store name
temp dw 0
tempname dw 0
index dw 0
turns dw 0

arrayx dw 218,278,338,398,458,518,578
arrayy dw 15,77,139,201,263,325,387

;coordinates for shapes
x1 dw 0
y1 dw 0
x2 dw 0
y2 dw 0

.code

main proc

mov ax,@data
mov ds,ax

;------------------------------------------------------calling of procedures

call background
call titlename
call setcoordinate
call randomno
call gridpage
call mouse
call level2
call level3
call exit

main endp

;---------------------------------------------------- starting of background proceudre

    background proc

    Mov ah,00h ;set video mode
    Mov al,13 ;choose mode 13
    Int 10h

;----------------------------------------------------setting background color

    MOV AH, 06h
    MOV AL, 0
    MOV CX, 0
    MOV DH, 80
    MOV DL, 80
    MOV BH, 03h
    INT 10h

    ret

    background endp

;-----------------------------------------------------end of background proceudre


;-----------------------------------------------------starting of titlename proceudre 
        titlename proc 

        mov bx,0
        mov cx,30
        mov dx,30

        ;---------------------upper horizontal line of letter C
        cx1:

        .while cx<=50
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,30
        add dx,1
        cmp dx,34
        jne cx1

        mov bx,0
        mov cx,30
        mov dx,30

        ;-------------------vertical line of letter C

        cy:

        .while dx<=60
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,34
        jne cy

        mov bx,0
        mov cx,30
        mov dx,60

        ;-------------------lower horizontal line of letter C

        cx2:

        .while cx<=50
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,30
        add dx,1
        cmp dx,64
        jne cx2

        mov bx,0
        mov cx,60
        mov dx,30

        ;------------------left vertical line of letter A
        ay1:

        .while dx<=63
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,64
        jne ay1

        mov bx,0
        mov cx,60
        mov dx,30

        ;-----------------horizontal upper line of letter A

        ax1:

        .while cx<=80
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,60
        add dx,1
        cmp dx,34
        jne ax1


        mov bx,0
        mov cx,60
        mov dx,45

        ;-----------------horizontal middle line of letter A

        ax2:

        .while cx<=80
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,60
        add dx,1
        cmp dx,49
        jne ax2

        mov bx,0
        mov cx,80
        mov dx,30

        ;-----------------right vertical line of letter A

        ay2:

        .while dx<=63
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,84
        jne ay2

        mov bx,0
        mov cx,90
        mov dx,30

        ;-----------------left vertical line of letter N

        ny1:

        .while dx<=63
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,94
        jne ny1

        ;--------------slanting line of letter N
        
        mov bx,0
        mov cx,94
        mov dx,30

        .while cx<=123
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        mov bx,0
        mov cx,93
        mov dx,31

        .while cx<=123
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx

        .endw

        mov bx,0
        mov cx,92
        mov dx,32

        .while cx<=123
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx

        .endw

        mov bx,0
        mov cx,91
        mov dx,33

        .while cx<=121
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx

        .endw

        mov bx,0
        mov cx,120
        mov dx,30

        ;-----------------right vertical line of letter N
        
        ny2:

        .while dx<=63
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,124
        jne ny2

        mov bx,0
        mov cx,130
        mov dx,30

        ;----------------left vertical line of letter D
        
        dy1:

        .while dx<=63
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,134

        jne dy1

        mov bx,0
        mov cx,150
        mov dx,40

        ;----------------right vertical line of letter D
        
        dy2:

        .while dx<=53
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,40
        add cx,1
        cmp cx,155

        jne dy2

        mov bx,0
        mov cx,130
        mov dx,30

        ;----------------upper horizontal line of letter D

        dx1:

        .while cx<=145
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,130
        add dx,1
        cmp dx,34
        jne dx1

        mov bx,0
        mov cx,130
        mov dx,60

        ;----------------lower horizontal line of letter D

        dx2:

        .while cx<=145
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,130
        add dx,1
        cmp dx,64
        jne dx2

        ;----------------upper slanting lines of letter D

        ds1:

        mov bx,0
        mov cx,147
        mov dx,30

        .while cx<=153
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        mov bx,0
        mov cx,146
        mov dx,31

        .while cx<=153
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        mov bx,0
        mov cx,145
        mov dx,32

        .while cx<=153
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        mov bx,0
        mov cx,144
        mov dx,33

        .while cx<=153
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        ;----------------lower slanting lines of letter D

        ds2:

        mov bx,0
        mov cx,151
        mov dx,52

        .while cx>=144
        mov ah,0Ch
        mov al,0Ch
        int 10h
        dec cx
        inc dx
        .endw

        mov bx,0
        mov cx,152
        mov dx,53

        .while cx>=144
        mov ah,0Ch
        mov al,0Ch
        int 10h
        dec cx
        inc dx
        .endw

        mov bx,0
        mov cx,153
        mov dx,54

        .while cx>=144
        mov ah,0Ch
        mov al,0Ch
        int 10h
        dec cx
        inc dx
        .endw

        mov bx,0
        mov cx,154
        mov dx,55

        .while cx>=147
        mov ah,0Ch
        mov al,0Ch
        int 10h
        dec cx
        inc dx
        .endw

        mov bx,0
        mov cx,162
        mov dx,30

        ;------------------left vertical line of letter Y

        yy1:

        .while dx<=45
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,166
        jne yy1

        mov bx,0
        mov cx,162
        mov dx,46

        ;------------------middle horizontal line of letter Y
        
        yx1:

        .while cx<=182
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,162
        add dx,1
        cmp dx,50
        jne yx1

        mov bx,0
        mov cx,162
        mov dx,60

        ;-----------------right vertical line of letter Y
        yx2:

        .while cx<=182
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,162
        add dx,1
        cmp dx,64
        jne yx2

        mov bx,0
        mov cx,180
        mov dx,30

        ;-------------------lower vertical line of letter Y
        yy2:

        .while dx<=63
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,30
        add cx,1
        cmp cx,184
        jne yy2

        mov bx,0
        mov cx,90
        mov dx,70

        ;------------------upper horizontal line of letter C
        
        c2x1:

        .while cx<=110
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,90
        add dx,1
        cmp dx,74
        jne c2x1

        mov bx,0
        mov cx,90
        mov dx,98

        ;------------------lower horizontal line of letter C
        
        c2x2:

        .while cx<=110
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,90
        add dx,1
        cmp dx,102
        jne c2x2

        mov bx,0
        mov cx,90
        mov dx,70 
        
        ;-----------------left vertical line of letter C

        c2y:

        .while dx<=100
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,94
        jne c2y

        mov bx,0
        mov cx,118
        mov dx,70

        ;---------------left vertical line of letter R
        
        ry1:

        .while dx<=101
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,122
        jne ry1

        mov bx,0
        mov cx,118
        mov dx,70

        ;---------------upper horizontal line of letter R
        
        rx1:

        .while cx<=138
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,118
        add dx,1
        cmp dx,74
        jne rx1

        mov bx,0
        mov cx,138
        mov dx,70

        ;---------------right vertical line of letter R
        
        ry2:

        .while dx<=84
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,142
        jne ry2

        mov bx,0
        mov cx,118
        mov dx,84

        ;---------------lower horizontal line of letter R
        
        rx2:

        .while cx<=141
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,118
        add dx,1
        cmp dx,88
        jne rx2

        mov bx,0
        mov cx,148
        mov dx,70


        
        ;----------------left vertical line for letter U
        
        uy1:

        .while dx<=101
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,152
        jne uy1

        mov bx,0
        mov cx,165
        mov dx,70

        ;-----------------------right vertical line for letter U
        
        uy2:

        .while dx<=101
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,169
        jne uy2

        mov bx,0
        mov cx,148
        mov dx,99

        ;-----------------------lower horizontal line for letter U
        
        ux:

        .while cx<=168
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,148
        add dx,1
        cmp dx,103
        jne ux

        mov bx,0
        mov cx,174
        mov dx,70

        ;-------------------left vertical line for letter S
        
        sy1:

        .while dx<=84
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,178
        jne sy1

        mov bx,0
        mov cx,194
        mov dx,84

        ;-----------------right vertical line for letter S
        
        sy2:

        .while dx<=98
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,84
        add cx,1
        cmp cx,198
        jne sy2

        mov bx,0
        mov cx,174
        mov dx,70

        ;----------------upper horizontal line for letter S
        
        sx1:

        .while cx<=197
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,174
        add dx,1
        cmp dx,74
        jne sx1

        mov bx,0
        mov cx,174
        mov dx,84

        ;-----------------middle horizontal line for letter S
        
        sx2:

        .while cx<=194
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,174
        add dx,1
        cmp dx,88
        jne sx2

        mov bx,0
        mov cx,174
        mov dx,98

        ;----------------lower horizontal line for letter S
        
        sx3:

        .while cx<=197
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,174
        add dx,1
        cmp dx,102
        jne sx3

        mov bx,0
        mov cx,206
        mov dx,70

        ;----------------left vertical line for letter H
        
        hy1:

        .while dx<=101
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,210
        jne hy1

        mov bx,0
        mov cx,208
        mov dx,84

        ;------------------middle horizontal line for letter H
        
        hx:

        .while cx<=228
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        .endw

        mov bx,0
        mov cx,208
        add dx,1
        cmp dx,88
        jne hx

        mov bx,0
        mov cx,228
        mov dx,70

        ;----------------right vertical line for letter H
        
        hy2:

        .while dx<=101
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc dx
        .endw

        mov bx,0
        mov dx,70
        add cx,1
        cmp cx,232
        jne hy2

        mov bx,0
        mov cx,165
        mov dx,70

        ;-------------slanting line for letter R

        mov bx,0
        mov cx,118
        mov dx,84

        .while cx<=138
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        mov bx,0
        mov cx,119
        mov dx,83

        .while cx<=139
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        mov bx,0
        mov cx,120
        mov dx,82

        .while cx<=140
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        mov bx,0
        mov cx,121
        mov dx,81

        .while cx<=141
        mov ah,0Ch
        mov al,0Ch
        int 10h
        inc cx
        inc dx
        .endw

        ;-----------------------printing enter name string in the centre

        MOV AH,02H
        MOV BX,0
        MOV DH,19
        MOV DL,12
        INT 10H

        mov dx,offset string1
        mov ah,09h
        int 21h

        MOV AH,02H
        MOV BX,0
        MOV DH,21
        MOV DL,12
        INT 10H

        ;----------------------taking name as input

        mov si,offset n
        inputname:
        mov ah,01h
        int 21h
        cmp al,13
        je next
        mov ah,0
        mov n[si],ax
        inc si
        jmp inputname

        ;-----------------------moving to the next page
        
        next:

	;-----------------------open file
	mov dx,offset file
	mov al,0
	mov ah,3dh
	int 21h
	;-----------------------append file
	mov cx,0
	mov ah, 42h
	mov al, 02h
	int 21h
	;-----------------------write in file
	mov dx,offset file
	mov al,2
	mov ah,3dh
	int 21h
	mov cx,lengthof string2
	dec cx
	mov bx,ax
	mov dx,offset string2
	mov ah,40h
	int 21h
	;-----------------------close file
	mov ah,3eh
	int 21h
        MOV BX,1
        Mov ah,00h
        Mov al,12H
        Int 10h

        ;-----------------------setting background color

        MOV AH, 06h
        MOV AL, 0
        MOV CX, 0
        MOV DH, 80
        MOV DL, 80
        MOV BH, 03h
        INT 10h

    ret

    titlename endp

;----------------------------------------ending of titlename procedure

;----------------------------------------starting of gridpage proc

            gridpage proc
            
            
            MOV AH, 06h
            MOV AL, 0
            MOV CX, 0
            MOV DH, 80
            MOV DL, 80
            MOV BH, 03h
            INT 10h

            MOV AH,02H
            MOV BX,0
            MOV DH,2
            MOV DL,2
            INT 10H

            mov dx,offset string2
            mov ah,09h
            int 21h

            ;...............printing name 

            MOV AH,02H
            MOV BX,0
            MOV DH,3
            MOV DL,2
            INT 10H

            mov si,offset n
            mov cx,lengthof n
            sub cx,5
            nameloop:
            mov dx,n[si]
            mov ah,02h
            int 21h
            inc si
            loop nameloop

            mov bx,0
            mov cx,630
            mov dx,0

            ;-------------------drawing grid
            
            outline1:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,634
            jne outline1

            mov bx,0
            mov cx,200
            mov dx,0

            outline2:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,204
            jne outline2

            mov bx,0
            mov cx,262
            mov dx,0

            outline3:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,266
            jne outline3

            mov bx,0
            mov cx,322
            mov dx,0

            outline4:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,326
            jne outline4

            mov bx,0
            mov cx,382
            mov dx,0

            outline5:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,386
            jne outline5

            mov bx,0
            mov cx,442
            mov dx,0

            outline6:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,446
            jne outline6

            mov bx,0
            mov cx,502
            mov dx,0

            outline7:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,506
            jne outline7

            mov bx,0
            mov cx,564
            mov dx,0

            outline8:

            .while dx<=435
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc dx
            .endw

            mov bx,0
            mov dx,0
            add cx,1
            cmp cx,568
            jne outline8

            mov bx,0
            mov cx,200
            mov dx,0

            outline9:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,4
            jne outline9

            mov bx,0
            mov cx,200
            mov dx,62

            outline10:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,66
            jne outline10

            mov bx,0
            mov cx,200
            mov dx,124

            outline11:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,128
            jne outline11

            mov bx,0
            mov cx,200
            mov dx,186

            outline12:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,190
            jne outline12

            mov bx,0
            mov cx,200
            mov dx,248

            outline13:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,252
            jne outline13

            mov bx,0
            mov cx,200
            mov dx,310

            outline14:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,314
            jne outline14

            mov bx,0
            mov cx,200
            mov dx,372

            outline15:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,376
            jne outline15

            mov bx,0
            mov cx,200
            mov dx,434

            outline16:

            .while cx<=632
            mov ah,0Ch
            mov al,0Ch
            int 10h
            inc cx
            .endw

            mov bx,0
            mov cx,200
            add dx,1
            cmp dx,438
            jne outline16


            ;...............calling of candy procs to place them into grid


            mov si,0
            mov di,0
            mov index, 0

            jmp loopcandyx

            loopcandyy:
        
            mov si,0
            inc di
            inc di
            cmp di,14
            jne loopcandyx
            jmp return

            loopcandyx:

            push si
            mov si, index
            add index, 10
            mov dx, swapobject.noofcandies[si]
            pop si

            .if (dx==0)
    
            mov cx,arrayx[si]
            mov dx,arrayy[di]
            call squarered
            
            .endif

            .if (dx==1)
    
            mov cx,arrayx[si]
            mov dx,arrayy[di]
            
            call squaredeepred

            .endif

            .if (dx==2)
    
            mov cx,arrayx[si]
            mov dx,arrayy[di]
            
            call squareyellow

            .endif

            .if (dx==3)
    
            mov cx,arrayx[si]
            mov dx,arrayy[di]

            call squareblue

            .endif
            
            .if (dx==4)
    
            mov cx,arrayx[si]
            mov dx,arrayy[di]
        
            call colorbomb

            .endif

            inc si
            inc si

            cmp si,14

            jne loopcandyx

            jmp loopcandyy 

            
            return:

            

            ret
            
            gridpage endp

;--------------------------------------------end of gridpage procedure

;--------------------------------------------candy procs


;-----------------------------------------------starting of sqaure deep red candy proc

                    squaredeepred proc

                                mov x1,cx
                                mov x2,cx

                                mov y2,dx
                                add y2,30
                                add x1,30

                                ;...................horizontal line
                            
                                lines1:
                                .while cx<=x1
                                mov ah,0Ch
                                mov al,04h
                                int 10h
                                inc cx
                                .endw

                                mov bx,0
                                mov cx,x2
                                mov y1,dx
                                add y1,1
                                mov dx,y1
                                cmp dx,y2
                                jne lines1

                    ret

                    squaredeepred endp

;---------------------------------------ending of squaredeepred candy proc

;-----------------------------------------------starting of sqaure blue candy proc

                    squareblue proc

                    mov x1,cx
                                mov x2,cx

                                mov y2,dx
                                add y2,30
                                add x1,30

                                ;...................horizontal line
                                lines2:
                                .while cx<=x1
                                mov ah,0Ch
                                mov al,01h
                                int 10h
                                inc cx
                                .endw

                                mov bx,0
                                mov cx,x2
                                mov y1,dx
                                add y1,1
                                mov dx,y1
                                cmp dx,y2
                                jne lines2

                    ret

                    squareblue endp

;---------------------------------------ending of square blue candy proc


;-----------------------------------------------starting of sqaure yellow candy proc

                    squareyellow proc

                    mov x1,cx
                                mov x2,cx

                                mov y2,dx
                                add y2,30
                                add x1,30

                                ;...................horizontal line
                            
                                lines3:
                                .while cx<=x1
                                mov ah,0Ch
                                mov al,06h
                                int 10h
                                inc cx
                                .endw

                                mov bx,0
                                mov cx,x2
                                mov y1,dx
                                add y1,1
                                mov dx,y1
                                cmp dx,y2
                                jne lines3

                    ret

                    squareyellow endp

;---------------------------------------ending of square yellow candy proc

;-----------------------------------------------starting of sqaure red candy proc

                    squarered proc

                    mov x1,cx
                                mov x2,cx

                                mov y2,dx
                                add y2,30
                                add x1,30

                                ;...................horizontal line
                            
                                lines4:
                                .while cx<=x1
                                mov ah,0Ch
                                mov al,0Dh
                                int 10h
                                inc cx
                                .endw

                                mov bx,0
                                mov cx,x2
                                mov y1,dx
                                add y1,1
                                mov dx,y1
                                cmp dx,y2
                                jne lines4

                    ret

                    squarered endp

;---------------------------------------ending of square red candy proc

;----------------------------------------starting of color bomb procedure

                                colorbomb proc
                                mov x1,cx
                                mov x2,cx

                                mov y2,dx
                                add y2,30
                                add x1,30

                                ;...................horizontal line
                                morelines:
                                .while cx<=x1
                                mov ah,0Ch
                                mov al,08h
                                int 10h
                                inc cx
                                .endw

                                mov bx,0
                                mov cx,x2
                                mov y1,dx
                                add y1,1
                                mov dx,y1
                                cmp dx,y2
                                jne morelines


                                ret
                                colorbomb endp

;-------------------------------------ending of colorbomb proceudre



level2 proc
; ---------------delay 
mov cx,1200
delay:
mov dx,1200
l:
dec dx
cmp dx,0
jne l
loop delay

; moving to the next page
MOV BX,2
Mov ah,00h
Mov al,12H
Int 10h

;setting background color
MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 80
MOV DL, 80
MOV BH, 03h
INT 10h

call gridpage2

ret
level2 endp

gridpage2 proc

MOV AH,02H
MOV BX,0
MOV DH,2
MOV DL,2
INT 10H

mov bx,0
mov cx,630
mov dx,126

line1_boundary:

.while dx<=186
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,126
add cx,1
cmp cx,634
jne line1_boundary

mov bx,0
mov cx,630
mov dx,250

line2_boundary:

.while dx<=310
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,250
add cx,1
cmp cx,634
jne line2_boundary

mov bx,0
mov cx,200
mov dx,126

line3_boundary:

.while dx<=186
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,126
add cx,1
cmp cx,204
jne line3_boundary

mov bx,0
mov cx,200
mov dx,250

line4_boundary:

.while dx<=310
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,250
add cx,1
cmp cx,204
jne line4_boundary

mov bx,0
mov cx,262
mov dx,0

line3:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,266
jne line3

mov bx,0
mov cx,322
mov dx,0

line4:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,326
jne line4

mov bx,0
mov cx,382
mov dx,0

line5:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,386
jne line5

mov bx,0
mov cx,442
mov dx,0

line6:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,446
jne line6

mov bx,0
mov cx,502
mov dx,0

line7:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,506
jne line7

mov bx,0
mov cx,564
mov dx,0

line8:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,568
jne line8

mov bx,0
mov cx,264
mov dx,0

line5_boundary:

.while cx<=384
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,264
add dx,1
cmp dx,4
jne line5_boundary

mov bx,0
mov cx,444
mov dx,0

line6_boundary:

.while cx<=564
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,444
add dx,1
cmp dx,4
jne line6_boundary

mov bx,0
mov cx,264
mov dx,62

line10:

.while cx<=566
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,264
add dx,1
cmp dx,66
jne line10

mov bx,0
mov cx,200
mov dx,124

line11:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,128
jne line11

mov bx,0
mov cx,200
mov dx,186

line12:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,190
jne line12

mov bx,0
mov cx,200
mov dx,248

line13:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,252
jne line13

mov bx,0
mov cx,200
mov dx,310

line14:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,314
jne line14

mov bx,0
mov cx,266
mov dx,372

line15:

.while cx<=566
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,266
add dx,1
cmp dx,376
jne line15

mov bx,0
mov cx,264
mov dx,434

line7_boundary:

.while cx<=384
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,264
add dx,1
cmp dx,438
jne line7_boundary

mov bx,0
mov cx,444
mov dx,434

line8_boundary:

.while cx<=564
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,444
add dx,1
cmp dx,438
jne line8_boundary

ret
gridpage2 endp

level3 proc
; ---------------delay 
mov cx,1200
delay:
mov dx,1200
l:
dec dx
cmp dx,0
jne l
loop delay

; moving to the next page
MOV BX,3
Mov ah,00h
Mov al,12H
Int 10h

;setting background color
MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 80
MOV DL, 80
MOV BH, 03h
INT 10h

call gridpage3

ret
level3 endp

gridpage3 proc
mov bx,0
mov cx,630
mov dx,0

out1:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,634
jne out1

mov bx,0
mov cx,200
mov dx,0

out2:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,204
jne out2

mov bx,0
mov cx,262
mov dx,0

out3:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,266
jne out3

mov bx,0
mov cx,322
mov dx,0

out4:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,326
jne out4

mov bx,0
mov cx,502
mov dx,0

out7:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,506
jne out7

mov bx,0
mov cx,564
mov dx,0

out8:

.while dx<=435
mov ah,0Ch
mov al,0Ch
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,568
jne out8

mov bx,0
mov cx,200
mov dx,0

out9:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,4
jne out9

mov bx,0
mov cx,200
mov dx,62

out10:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,66
jne out10

mov bx,0
mov cx,200
mov dx,124

out11:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,128
jne out11

mov bx,0
mov cx,200
mov dx,190

out12:

.while cx<=632
mov ah,0Ch
mov al,07h
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,254
jne out12


mov bx,0
mov cx,200
mov dx,310

out14:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,314
jne out14

mov bx,0
mov cx,200
mov dx,372

out15:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,376
jne out15

mov bx,0
mov cx,200
mov dx,434

out16:

.while cx<=632
mov ah,0Ch
mov al,0Ch
int 10h
inc cx
.endw

mov bx,0
mov cx,200
add dx,1
cmp dx,438
jne out16

mov bx,0
mov cx,382
mov dx,0

out5:

.while dx<=435
mov ah,0Ch
mov al,07h
int 10h
inc dx
.endw

mov bx,0
mov dx,0
add cx,1
cmp cx,442
jne out5

ret 
gridpage3 endp

setcoordinate proc

mov swapobject.firstcoordinatex [2],200
mov swapobject.lastcoordinatex [4],262
mov swapobject.firstcoordinatey [6],0
mov swapobject.lastcoordinatey [8],62

mov swapobject.firstcoordinatex [12],262
mov swapobject.lastcoordinatex [14],322
mov swapobject.firstcoordinatey [16],0
mov swapobject.lastcoordinatey [18],62

mov swapobject.firstcoordinatex [22],322
mov swapobject.lastcoordinatex [24],382
mov swapobject.firstcoordinatey [26],0
mov swapobject.lastcoordinatey [28],62

mov swapobject.firstcoordinatex [32],382
mov swapobject.lastcoordinatex [34],442
mov swapobject.firstcoordinatey [36],0
mov swapobject.lastcoordinatey [38],62

mov swapobject.firstcoordinatex [42],442
mov swapobject.lastcoordinatex [44],502
mov swapobject.firstcoordinatey [46],0
mov swapobject.lastcoordinatey [48],62

mov swapobject.firstcoordinatex [52],502
mov swapobject.lastcoordinatex [54],564
mov swapobject.firstcoordinatey [56],0
mov swapobject.lastcoordinatey [58],62

mov swapobject.firstcoordinatex [62],564
mov swapobject.lastcoordinatex [64],634
mov swapobject.firstcoordinatey [66],0
mov swapobject.lastcoordinatey [68],62



mov swapobject.firstcoordinatex [72],200
mov swapobject.lastcoordinatex [74],262
mov swapobject.firstcoordinatey [76],62
mov swapobject.lastcoordinatey [78],124

mov swapobject.firstcoordinatex [82],262
mov swapobject.lastcoordinatex [84],322
mov swapobject.firstcoordinatey [86],62
mov swapobject.lastcoordinatey [88],124

mov swapobject.firstcoordinatex [92],322
mov swapobject.lastcoordinatex [94],382
mov swapobject.firstcoordinatey [96],62
mov swapobject.lastcoordinatey [98],124

mov swapobject.firstcoordinatex [102],382
mov swapobject.lastcoordinatex [104],442
mov swapobject.firstcoordinatey [106],62
mov swapobject.lastcoordinatey [108],124

mov swapobject.firstcoordinatex [112],442
mov swapobject.lastcoordinatex [114],502
mov swapobject.firstcoordinatey [116],62
mov swapobject.lastcoordinatey [118],124

mov swapobject.firstcoordinatex [122],502
mov swapobject.lastcoordinatex [124],564
mov swapobject.firstcoordinatey [126],62
mov swapobject.lastcoordinatey [128],124

mov swapobject.firstcoordinatex [132],564
mov swapobject.lastcoordinatex [134],634
mov swapobject.firstcoordinatey [136],62
mov swapobject.lastcoordinatey [138],124



mov swapobject.firstcoordinatex [142],200
mov swapobject.lastcoordinatex [144],262
mov swapobject.firstcoordinatey [146],124
mov swapobject.lastcoordinatey [148],186

mov swapobject.firstcoordinatex [152],262
mov swapobject.lastcoordinatex [154],322
mov swapobject.firstcoordinatey [156],124
mov swapobject.lastcoordinatey [158],186

mov swapobject.firstcoordinatex [162],322
mov swapobject.lastcoordinatex [164],382
mov swapobject.firstcoordinatey [166],124
mov swapobject.lastcoordinatey [168],186

mov swapobject.firstcoordinatex [172],382
mov swapobject.lastcoordinatex [174],442
mov swapobject.firstcoordinatey [176],124
mov swapobject.lastcoordinatey [178],186

mov swapobject.firstcoordinatex [182],442
mov swapobject.lastcoordinatex [184],502
mov swapobject.firstcoordinatey [186],124
mov swapobject.lastcoordinatey [188],186

mov swapobject.firstcoordinatex [192],502
mov swapobject.lastcoordinatex [194],564
mov swapobject.firstcoordinatey [196],124
mov swapobject.lastcoordinatey [198],186

mov swapobject.firstcoordinatex [202],564
mov swapobject.lastcoordinatex [204],634
mov swapobject.firstcoordinatey [206],124
mov swapobject.lastcoordinatey [208],186



mov swapobject.firstcoordinatex [212],200
mov swapobject.lastcoordinatex [214],262
mov swapobject.firstcoordinatey [216],186
mov swapobject.lastcoordinatey [218],248

mov swapobject.firstcoordinatex [222],262
mov swapobject.lastcoordinatex [224],322
mov swapobject.firstcoordinatey [226],186
mov swapobject.lastcoordinatey [228],248

mov swapobject.firstcoordinatex [232],322
mov swapobject.lastcoordinatex [234],382
mov swapobject.firstcoordinatey [236],186
mov swapobject.lastcoordinatey [238],248

mov swapobject.firstcoordinatex [242],382
mov swapobject.lastcoordinatex [244],442
mov swapobject.firstcoordinatey [246],186
mov swapobject.lastcoordinatey [248],248

mov swapobject.firstcoordinatex [252],442
mov swapobject.lastcoordinatex [254],502
mov swapobject.firstcoordinatey [256],186
mov swapobject.lastcoordinatey [258],248

mov swapobject.firstcoordinatex [262],502
mov swapobject.lastcoordinatex [264],564
mov swapobject.firstcoordinatey [266],186
mov swapobject.lastcoordinatey [268],248

mov swapobject.firstcoordinatex [272],564
mov swapobject.lastcoordinatex [274],634
mov swapobject.firstcoordinatey [276],186
mov swapobject.lastcoordinatey [278],248




mov swapobject.firstcoordinatex [282],200
mov swapobject.lastcoordinatex [284],262
mov swapobject.firstcoordinatey [286],248
mov swapobject.lastcoordinatey [288],310

mov swapobject.firstcoordinatex [292],262
mov swapobject.lastcoordinatex [294],322
mov swapobject.firstcoordinatey [296],248
mov swapobject.lastcoordinatey [298],310

mov swapobject.firstcoordinatex [302],322
mov swapobject.lastcoordinatex [304],382
mov swapobject.firstcoordinatey [306],248
mov swapobject.lastcoordinatey [308],310

mov swapobject.firstcoordinatex [312],382
mov swapobject.lastcoordinatex [314],442
mov swapobject.firstcoordinatey [316],248
mov swapobject.lastcoordinatey [318],310

mov swapobject.firstcoordinatex [322],442
mov swapobject.lastcoordinatex [324],502
mov swapobject.firstcoordinatey [326],248
mov swapobject.lastcoordinatey [328],310

mov swapobject.firstcoordinatex [332],502
mov swapobject.lastcoordinatex [334],564
mov swapobject.firstcoordinatey [336],248
mov swapobject.lastcoordinatey [338],310

mov swapobject.firstcoordinatex [342],564
mov swapobject.lastcoordinatex [344],634
mov swapobject.firstcoordinatey [346],248
mov swapobject.lastcoordinatey [348],310



mov swapobject.firstcoordinatex [352],200
mov swapobject.lastcoordinatex [354],262
mov swapobject.firstcoordinatey [356],310
mov swapobject.lastcoordinatey [358],372

mov swapobject.firstcoordinatex [362],262
mov swapobject.lastcoordinatex [364],322
mov swapobject.firstcoordinatey [366],310
mov swapobject.lastcoordinatey [368],372

mov swapobject.firstcoordinatex [372],322
mov swapobject.lastcoordinatex [374],382
mov swapobject.firstcoordinatey [376],310
mov swapobject.lastcoordinatey [378],372

mov swapobject.firstcoordinatex [382],382
mov swapobject.lastcoordinatex [384],442
mov swapobject.firstcoordinatey [386],310
mov swapobject.lastcoordinatey [388],372

mov swapobject.firstcoordinatex [392],442
mov swapobject.lastcoordinatex [394],502
mov swapobject.firstcoordinatey [396],310
mov swapobject.lastcoordinatey [398],372

mov swapobject.firstcoordinatex [402],502
mov swapobject.lastcoordinatex [404],564
mov swapobject.firstcoordinatey [406],310
mov swapobject.lastcoordinatey [408],372

mov swapobject.firstcoordinatex [412],564
mov swapobject.lastcoordinatex [414],634
mov swapobject.firstcoordinatey [416],310
mov swapobject.lastcoordinatey [418],372




mov swapobject.firstcoordinatex [422],200
mov swapobject.lastcoordinatex [424],262
mov swapobject.firstcoordinatey [426],372
mov swapobject.lastcoordinatey [428],434

mov swapobject.firstcoordinatex [432],262
mov swapobject.lastcoordinatex [434],322
mov swapobject.firstcoordinatey [436],372
mov swapobject.lastcoordinatey [438],434

mov swapobject.firstcoordinatex [442],322
mov swapobject.lastcoordinatex [444],382
mov swapobject.firstcoordinatey [446],372
mov swapobject.lastcoordinatey [448],434

mov swapobject.firstcoordinatex [452],382
mov swapobject.lastcoordinatex [454],442
mov swapobject.firstcoordinatey [456],372
mov swapobject.lastcoordinatey [458],434

mov swapobject.firstcoordinatex [462],442
mov swapobject.lastcoordinatex [464],502
mov swapobject.firstcoordinatey [466],372
mov swapobject.lastcoordinatey [468],434

mov swapobject.firstcoordinatex [472],502
mov swapobject.lastcoordinatex [474],564
mov swapobject.firstcoordinatey [476],372
mov swapobject.lastcoordinatey [478],434

mov swapobject.firstcoordinatex [482],564
mov swapobject.lastcoordinatex [484],634
mov swapobject.firstcoordinatey [486],372
mov swapobject.lastcoordinatey [488],434


ret

setcoordinate endp

randomno proc

mov si,0

            random:
                mov cx, 1

            delay:
                cmp cx, 63739
                je enddelay

                inc cx
                jmp delay

            enddelay:

            mov AH, 00h  ; interrupts to get system time        
            int 1AH      ; CX:DX now hold number of clock ticks since midnight      

            mov  ax, dx
            xor  dx, dx
            mov  cx, 5    
            div  cx

            mov swapobject.noofcandies[si],dx

            add si, 10

            cmp si, 490
            jne random

ret

randomno endp

mouse proc

.while (turns < 10)

    mov ax,0
    int 33h

    mov ax,1
    int 33h

    ; mov ah, 01h
    ; int 21h


    mov ax,7
    mov cx,200
    mov dx,634
    int 33h

    mov ax,8
    mov cx,0
    mov dx,434
    int 33h

    ; mov ax, 0
    ; .while (ax == 0)

    ; mov ax, 5
    ; int 33h

    ; .endw


    l7:

        mov ax, 0

        .WHILE(ax == 0)
            mov ax, 5
            int 33h
        .ENDW

        cmp bx, 1
        jne l7


    mov ax,3
    int 33h

    mov si,0

    .while(si != 490)

    .if((cx < swapobject.lastcoordinatex[si+4] && cx > swapobject.firstcoordinatex[si+2]) && (dx < swapobject.lastcoordinatey[si+8] && dx > swapobject.firstcoordinatey[si+6] ))

    mov di,si

    .endif

    add si,10

    .endw

    l8:

        mov ax, 0

        .WHILE(ax == 0)
            mov ax, 5
            int 33h
        .ENDW

        cmp bx, 1
        jne l8
    mov ax,3
    int 33h

    mov si,0

    .while(si != 490)

    .if((cx < swapobject.lastcoordinatex[si+4] && cx > swapobject.firstcoordinatex[si+2]) && (dx < swapobject.lastcoordinatey[si+8] && dx > swapobject.firstcoordinatey[si+6] ))

    mov bx,si

    .endif

    add si,10

    .endw

    mov ax,swapobject.noofcandies[di]
    mov cx,swapobject.noofcandies[bx]

    mov swapobject.noofcandies[di],cx
    mov swapobject.noofcandies[bx],ax

    mov ah,00h
    mov al,12H
    int 10H

    call gridpage

    inc turns
.endw

ret

mouse endp

;---------------------------------------exit proc


exit proc
mov ah,4ch
int 21h
ret 
exit endp

end
