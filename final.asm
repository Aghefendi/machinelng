;2019555502
;Mehmet Agah cicek
;Aghefendi

include 'emu8086.inc' 


lea bx, mynumber ;loads the effective address of the label mynumber into the BX register. 


 mov bp,0 
 mov cx,10
        
memory_assign:  

 mov al, [bx]      ;Moves the value at the memory location pointed to by BX into the AL register.
    
    
mov [2000h+bp] ,al ;Moves the value in AL to the memory location at 2000h + BP.
                   
       
 inc bp
inc bx
          
   
mov ah, 0eh 
         
int 10h   

    
loop memory_assign


mov cx, 10            ;Sets the BX register to 200h, ES (extra segment) to the value in BX,
                      ; and SI (source index) and DI (destination index) to 2000h.

mov bx,200h
mov es,bx
mov si, 2000h    
mov di, 2000h     

memory_save:


    movsb
    
    
loop memory_save 

   mov bx,6

       mov al, byte ptr [2000h+bx]
              
      cmp al,'6'         ;Compares the byte at memory location 2000h + BX to the character '6'
                         ;Morning or Evening.   
 je show:           
 print ' Morning!'
  mov ah,4ch
 int 21h        
                     
 
 show:
   print ' Evening!'
  mov ah,4ch
  int 21h  
    
 RET
   
mynumber db  '2019555502'  

 


