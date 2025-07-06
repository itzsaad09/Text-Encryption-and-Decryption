.MODEL SMALL
.STACK 100H
.DATA
    
    LINE DB 10,13, '-------------------------------------------------------------------------------- $'
    PTITLE DB 10,13, '          Text Encryption and Decryption Using Caesar Cipher Technique $'
    BY DB 10,13, '                        Hafiz Muhammad Saad & Faiqa Riaz $'
    MSG1 DB 10,13,'Enter a string to encrypt/decrypt: $'
    MSG2 DB 10,13,'Enter key (0-9): $'
    MSG3 DB 10,13,'Encrypted string is: $'
    MSG4 DB 10,13,'Decrypted string is: $'
    MSG5 DB 10,13,'Choose operation:',10,13,'1. Encrypt',10,13,'2. Decrypt',10,13,'3. Exit$'
    MSG6 DB 10,13,'Enter choice: $'    
    MSG7 DB 10,13,'Invalid Choice$'
    STR1 DB 80 DUP(?)    ; Input string buffer
    RES  DB 80 DUP(?)    ; Result string buffer
    KEY  DB ?            ; Encryption/Decryption key
    STRLEN DB ?          ; String length
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    
    LEA DX, LINE
    MOV AH, 9
    INT 21H
    
    LEA DX, PTITLE 
    MOV AH, 9
    INT 21H
    
    LEA DX, BY
    MOV AH, 9
    INT 21H
    
    LEA DX, LINE
    MOV AH, 9
    INT 21H
    
START:
    ; Display menu                                                                                 
    LEA DX, MSG5
    MOV AH, 9
    INT 21H
    
    ; Get choice
    LEA DX, MSG6
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CMP AL, '1'
    JE ENCRYPT_ROUTINE
    CMP AL, '2'
    JE DECRYPT_ROUTINE
    CMP AL, '3'
    JE EXIT     
    LEA DX, MSG7
    MOV AH, 9
    INT 21H
    JMP START           ; Invalid choice, show menu again

ENCRYPT_ROUTINE:
    CALL INPUT_STRING
    CALL ENCRYPT
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    CALL DISPLAY_RESULT
    JMP START

DECRYPT_ROUTINE:
    CALL INPUT_STRING
    CALL DECRYPT
    LEA DX, MSG4
    MOV AH, 9
    INT 21H
    CALL DISPLAY_RESULT
    JMP START

EXIT:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

INPUT_STRING PROC
    ; Display input message
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    ; Input string
    MOV SI, 0
    MOV STRLEN, 0
    
INPUT_LOOP:
    MOV AH, 1
    INT 21H
    
    CMP AL, 13          ; Check for Enter key
    JE END_INPUT
    
    MOV STR1[SI], AL
    INC SI
    INC STRLEN
    JMP INPUT_LOOP
    
END_INPUT:
    ; Get encryption/decryption key
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, '0'         ; Convert ASCII to number
    MOV KEY, AL
    
    RET
INPUT_STRING ENDP

ENCRYPT PROC
    MOV CX, 0
    MOV CL, STRLEN      ; Load string length
    MOV SI, 0           ; Source index
    MOV DI, 0           ; Destination index
    
ENCRYPT_LOOP:
    MOV AL, STR1[SI]    ; Get character
    
    ; Check if character is a letter
    CMP AL, 'A'
    JB COPY_CHAR        ; Below 'A', copy as is
    CMP AL, 'Z'
    JBE ENCRYPT_UPPER   ; Between 'A' and 'Z'
    CMP AL, 'a'
    JB COPY_CHAR        ; Between 'Z' and 'a'
    CMP AL, 'z'
    JA COPY_CHAR        ; Above 'z'
    
    ; Encrypt lowercase
    SUB AL, 'a'         ; Convert to 0-25 range
    ADD AL, KEY         ; Add key
    MOV AH, 0          
    MOV BL, 26
    DIV BL             ; Divide by 26 to handle wrap-around
    ADD AH, 'a'        ; Convert back to ASCII
    MOV AL, AH
    JMP STORE_CHAR
    
ENCRYPT_UPPER:
    SUB AL, 'A'         ; Convert to 0-25 range
    ADD AL, KEY         ; Add key
    MOV AH, 0
    MOV BL, 26
    DIV BL             ; Divide by 26 to handle wrap-around
    ADD AH, 'A'        ; Convert back to ASCII
    MOV AL, AH
    JMP STORE_CHAR
    
COPY_CHAR:
    ; Non-letter character, copy as is
STORE_CHAR:
    MOV RES[DI], AL
    INC SI
    INC DI
    LOOP ENCRYPT_LOOP
    
    MOV RES[DI], '$'    ; Add string terminator
    RET
ENCRYPT ENDP

DECRYPT PROC
    MOV CX, 0
    MOV CL, STRLEN      ; Load string length
    MOV SI, 0           ; Source index
    MOV DI, 0           ; Destination index
    
DECRYPT_LOOP:
    MOV AL, STR1[SI]    ; Get character
    
    ; Check if character is a letter
    CMP AL, 'A'
    JB COPY_CHAR_D      ; Below 'A', copy as is
    CMP AL, 'Z'
    JBE DECRYPT_UPPER   ; Between 'A' and 'Z'
    CMP AL, 'a'
    JB COPY_CHAR_D      ; Between 'Z' and 'a'
    CMP AL, 'z'
    JA COPY_CHAR_D      ; Above 'z'
    
    ; Decrypt lowercase
    SUB AL, 'a'         ; Convert to 0-25 range
    SUB AL, KEY         ; Subtract key
    ADD AL, 26          ; Add 26 to handle negative numbers
    MOV AH, 0
    MOV BL, 26
    DIV BL             ; Divide by 26 to handle wrap-around
    ADD AH, 'a'        ; Convert back to ASCII
    MOV AL, AH
    JMP STORE_CHAR_D
    
DECRYPT_UPPER:
    SUB AL, 'A'         ; Convert to 0-25 range
    SUB AL, KEY         ; Subtract key
    ADD AL, 26          ; Add 26 to handle negative numbers
    MOV AH, 0
    MOV BL, 26
    DIV BL             ; Divide by 26 to handle wrap-around
    ADD AH, 'A'        ; Convert back to ASCII
    MOV AL, AH                                                                   
    JMP STORE_CHAR_D
    
COPY_CHAR_D:
    ; Non-letter character, copy as is
STORE_CHAR_D:
    MOV RES[DI], AL
    INC SI
    INC DI
    LOOP DECRYPT_LOOP
    
    MOV RES[DI], '$'    ; Add string terminator
    RET
DECRYPT ENDP

DISPLAY_RESULT PROC
    LEA DX, RES
    MOV AH, 9
    INT 21H
    RET
DISPLAY_RESULT ENDP

END MAIN