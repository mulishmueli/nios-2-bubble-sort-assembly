        .text
        .global _start
_start:     
        movia r4,myarray
        movi  r5,11
        call  bubble
        br    END

bubble:
        mov r17,r5          
        subi r16,r17,1          
        addi r15,r0,1       

compare:    
        cmpgti r18,r16,0
        and r18,r18,r15
        beq r18,r0,stop     
        mov r15,r0          
        mov r19,r0          
        slli r16,r16,2      

dj1:            
        cmpge r20,r19,r16           
        bne r20,r0,dj2          
        add r22,r4,r19      
        ldw r17,0(r22)      
        ldw r21,4(r22)          
        cmpge r23,r21,r17       
        bne r23,r0,dj3          
        stw r21,0(r22)      
        stw r17,4(r22)                          
        addi r15,r0,1       

dj3:        
        addi r19,r19,4  
        br dj1          
        
dj2:    
        srai r16,r16,2          
        subi r16,r16,1  
        br compare          

stop:
        ret
        
END:    br  END
    
myarray:    
        .word  10,0,1,2,3,4,5,6,7,8,9    

        .end                

