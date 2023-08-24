TITLE Convert lowercase letters to uppercase
.MODEL SMALL
.DATA
    MSG1 DB "Enter a lowercase letter: $"
    MSG2 DB 10,13,"Converted to uppercase: $"
.CODE
MAIN PROC
    ; Allows access to variables defined in .DATA
    MOV AX,@DATA
    MOV DS,AX

    ; Displays the MSG1 string on the screen
    MOV AH,9
    LEA DX,MSG1
    INT 21h

    ; Reads a character from the keyboard and saves the read character in AL
    MOV AH,1
    INT 21h

    ; Copy the read character to BL
    MOV BL,AL

    ; Displays the MSG2 string on the screen
    MOV AH,9
    LEA DX,MSG2
    INT 21h

    ; Convert lowercase letter to uppercase (subtracts 32 from BL)
    SUB BL,32

    ; Displays the converted lyrics (saved in BL)
    MOV AH,2
    MOV DL,BL
    INT 21h
    
    ; Terminate program function and Close the program
    MOV AH,4Ch
    INT 21h
MAIN ENDP
END MAIN
