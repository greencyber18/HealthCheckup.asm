.model small
.stack 100h
.data        
a db 10,13,'       ********************************************************** $'   
b db 10,13, '           Find out your health stability(covid)!!  $'
c db 10,13, '        For each question, enter y if you have the symptom $' 

d db 10,13, 'start?(y/n) $'

e db 10,13, ' Are you suffering from fever?(y/n) $'  

f db 10,13, ' Are you snoring (y/n) $'  


g db 10,13, ' Are you coughing (y/n) $' 

h db 10,13, ' Are you suffering from dysentery (y/n) $ '  


i db 10,13, ' You health status is excellent. Stay home,Stay Safe $ ' 


j db 10,13, ' Your health status isnot alarming, but contact with an certified physician and take proper medicines $ '


k db 10,13, ' your health status isnot so good. Covid test is mandatory $ '


l db 10,13, ' Your health condition is worst. Covid test needed  $ ' 

m db 10,13, ' Your symtoms matches with covid. Please imidiately get yourself admitted in hospital $ ' 
  

.code
main proc
    mov ax,@data
    mov ds,ax
    ; Message to the User
    mov ah,9
    lea dx,a
    int 21h   
    
    
    
  ; Message to the User
    mov ah,9
    lea dx,a
    int 21h 

   
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,9
    lea dx,c
    int 21h 
    
    
    mov ah,9
    lea dx,a
    int 21h 
   
   
    mov ah,9
    lea dx,d
    int 21h
    
start: 
   
    mov ah,1
    int 21h
    mov cl,al
    
    cmp cl,'y'
    je next1
    cmp cl,'Y'
    je next1
    
    
    cmp cl,'n'
    je exit
    cmp cl,'N'
    je exit
    
next1:
 
    mov ah,9
    lea dx,e
    int 21h 
    
    sub cl,cl
    
     
    mov ah,1
    int 21h
    mov cl,al  
    
    cmp cl,'y'
    je snxt1
    
    cmp cl,'n'
    je nsnxt1
    

    

snxt1:
    
   
    mov bl,50
    
    
    jmp next2  
    
nsnxt1:

    mov bl, 48
    
    jmp next2
    

next2:
 
    mov ah,9
    lea dx,f
    int 21h 
    

     
    mov ah,1
    int 21h
    mov cl,al  
    
    cmp cl,'y'
    je snxt2
 
 
    cmp cl,'n'
    je nsnxt2
   

snxt2:
    
    
    mov bh,50 
    
    add bl,bh
    sub bl,48
    
    
    jmp next3
    
    
nsnxt2:
    
    sub bh,bh
    mov bh, 48 
    
    
    
        
    add bl,bh
    sub bl,48
    jmp next3
       
    
    
            
next3:
 
    mov ah,9
    lea dx,g
    int 21h 
    
    sub cl,cl
    
     
    mov ah,1
    int 21h
    mov cl,al  
    
    cmp cl,'y'
    je snxt3
    
    
    cmp cl,'n'
    je nsnxt3
    

snxt3:
    
    sub bh,bh
    mov bh,50 
    
    add bl,bh
    sub bl,48
    
    
    jmp next4



nsnxt3:
    
    sub bh,bh
    mov bh, 48 
    
    
    
    add bl,bh
    sub bl,48
    jmp next4
       


    
    
next4:
 
    mov ah,9
    lea dx,h
    int 21h 
    
    sub cl,cl
    
     
    mov ah,1
    int 21h
    mov cl,al  
    
    cmp cl,'y'
    je snxt4
    
    
    cmp cl,'n'
    je nsnxt4
    
    
    
snxt4:
    
    sub bh,bh
    mov bh,50 
    
    add bl,bh
    sub bl,48
    
    
    jmp output
    
    
    
nsnxt4:
    
    sub bh,bh
    mov bh, 48 
    
    
    add bl,bh
    sub bl,48
    
    jmp output
       
        
output:

  

  
  cmp bl,48

  je status1


  cmp bl,50

  je status2


  cmp bl,52

  je status3


  cmp bl,54

  je status4 


  cmp bl,56

  je status5     




status1: 


    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h


    mov ah,9
    lea dx,i
    int 21h  
    
    jmp exit





status2:



    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    mov ah,9
    lea dx,j
    int 21h
    
      
    jmp exit


status3:

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h


    mov ah,9
    lea dx,k
    int 21h 
    
    jmp exit   
    
    
status4:   


    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    mov ah,9
    lea dx,l
    int 21h 
               
    jmp exit 
    
    
              
status5:   


    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    mov ah,9
    lea dx,m
    int 21h 


    jmp exit
 exit:
    mov ah,4ch
    int 21h
    main endp 
end main