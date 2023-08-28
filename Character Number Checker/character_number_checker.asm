MODEL small
.DATA
    prompt db 'Enter a character: $'
    yes db 10,13,'The entered character is a number.$'
    no db 10,13,'The entered character is not a number.$'
.CODE
MAIN PROC

    ; Allow access to variables defined in .DATA
    MOV AX, @DATA
    MOV DS, AX

    ; Display the prompt string ("Enter a character: ")
    MOV AH, 9
    MOV DX, OFFSET prompt
    INT 21h

    ; Read a character from the keyboard and save the read character in AL
    MOV AH, 1
    INT 21h

    ; Copy the read character to BL
    MOV BL, AL
    
    ; Compare the character in BL with the value 48 (ASCII code of the character "0")
    CMP BL, 48

    ; If the character in BL is less than 48 ("0"), jump to the NOTNUMBER label
    JB NOTNUMBER

    ; Compare the character in BL with the value 57 (ASCII code of the character "9")
    CMP BL, 57

    ; If the character in BL is greater than 57 ("9"), jump to the NOTNUMBER label
    JA NOTNUMBER

    ; If it reached here, display that the character is a number
    MOV AH, 9
    MOV DX, OFFSET yes
    INT 21h

    ; Jump to the STOP label
    JMP STOP

    ; Define the NOTNUMBER label
    NOTNUMBER:
        ; Display that the character is not a number
        MOV AH, 9
        MOV DX, OFFSET no
        INT 21h

    ; Define the STOP label
    STOP:
        ; End the program
        MOV AH, 4Ch
        INT 21h

MAIN ENDP
END MAIN
