TITLE Addition
.MODEL SMALL
.DATA
    MSG1 DB "Enter the first number: $"
    MSG2 DB 10,13,"Enter the second number: $"
    MSG3 DB 10,13,"The sum of the two numbers is: $"
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

    ; Copies the read character to BL
    MOV BL,AL

    ; Turns character into number (subtracting 30H from BL)
    SUB BL,30H

    ; Displays the MSG2 string on the screen
    MOV AH,9
    LEA DX,MSG2
    INT 21h

    ; Reads a character from the keyboard and saves the read character in AL
    MOV AH,1
    INT 21h

    ; Turns character into number (subtracting 30H from AL)
    SUB AL,30H

    ; Makes the addition of AL plus BL
    ADD BL,AL

    ; Transforms the number into a character (adding 30h to BL)
    ADD BL,30H

    ; Displays the MSG3 string on the screen
    MOV AH,9
    LEA DX,MSG3
    INT 21h

    ; Displays the sum (saved in BL)
    MOV AH,2
    MOV DL,BL
    INT 21h

    ; Terminate program function and Close the program
    MOV AH,4Ch
    INT 21h
MAIN ENDP
END MAIN
