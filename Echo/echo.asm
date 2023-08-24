TITLE Echo
MODEL small
.DATA
    MSG1 DB 'Type a character: $'
    MSG2 DB 10,13,'Typed character: $'
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

    ; Displays read character (saved in BL)
    MOV AH,2
    MOV DL,BL
    INT 21h

    ; Terminate program function and Close the program
    MOV AH,4ch
    INT 21H

MAIN ENDP
END MAIN
