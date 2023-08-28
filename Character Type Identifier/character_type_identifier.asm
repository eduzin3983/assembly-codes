MODEL small
.DATA

    prompt db 'Enter a character: $'
    is_number db 10,13,'The entered character is a number.$'
    is_letter db 10,13,'The entered character is a letter.$'
    is_unknown db 10,13,'The entered character is an unknown character.$'

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
    ; If the character in BL is less than 48 ("0"), jump to the CHARACTER_UNKNOWN label
    CMP BL, 48
    JB CHARACTER_UNKNOWN

    ; Compare the character in BL with the value 57 (ASCII code of the character "9")
    ; If the character in BL is less than or equal to 57 ("9"), jump to the NUMBER label
    CMP BL, 57
    JBE NUMBER

    ; Compare the character in BL with the value 65 (ASCII code of the character "A")
    ; If the character in BL is less than 65 ("A"), jump to the CHARACTER_UNKNOWN label
    CMP BL, 65
    JB CHARACTER_UNKNOWN

    ; Compare the character in BL with the value 90 (ASCII code of the character "Z")
    ; If the character in BL is less than or equal to 90 ("Z"), jump to the LETTER label
    CMP BL, 90
    JBE LETTER

    ; Compare the character in BL with the value 97 (ASCII code of the character "a")
    ; If the character in BL is less than 97 ("a"), jump to the CHARACTER_UNKNOWN label
    CMP BL, 97
    JB CHARACTER_UNKNOWN

    ; Compare the character in BL with the value 122 (ASCII code of the character "z")
    ; If the character in BL is less than or equal to 122 ("z"), jump to the LETTER label
    CMP BL, 122
    JBE LETTER

    ; Compare the character in BL with the value 122 (ASCII code of the character "z")
    ; If the character in BL is greater than 122 ("z"), jump to the CHARACTER_UNKNOWN label
    CMP BL, 122
    JA CHARACTER_UNKNOWN

    ; Define the LABEL LETTER
    LETTER:
        ; Display the is_letter string ("The entered character is a letter.")
        MOV AH, 9
        MOV DX, OFFSET is_letter
        INT 21h
        
        ; End the program
        JMP STOP


    ; Define the LABEL CHARACTER_UNKNOWN
    CHARACTER_UNKNOWN:
        ; Display the is_unknown string ("The entered character is an unknown character.")
        MOV AH, 9
        LEA DX, is_unknown
        INT 21H

        ; End the program
        JMP STOP

    ; Define the LABEL NUMBER
    NUMBER:
        ; Display the is_number string ("The entered character is a number.")
        MOV AH, 9
        MOV DX, OFFSET is_number
        INT 21h

        ; End the program
        JMP STOP


    ; Define the LABEL STOP
    STOP:
        ; End the program
        MOV AH, 4Ch
        INT 21h

MAIN ENDP
END MAIN
