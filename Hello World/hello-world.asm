TITLE Hello World
.MODEL SMALL
.DATA
    msg db "Hello World $"
.CODE
MAIN PROC
    ; Allows access to variables defined in .DATA
    MOV AX, @DATA
    MOV DS, AX

    ; Displays the msg string on the screen
    MOV DX, OFFSET msg
    MOV AH, 09
    INT 21H

    ; Terminate program function and Close the program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN