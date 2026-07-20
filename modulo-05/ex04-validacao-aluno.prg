FUNCTION Main()

    LOCAL cNome
    LOCAL cDisc
    LOCAL cNota1
    LOCAL cNota2
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nMedia
    LOCAL nI
    LOCAL cChar
    LOCAL lValido

    hb_cdpSelect("PT850")

    // Validação do nome (não vazio e não 100% numérico)
    WHILE .T.
        ACCEPT "Digite o nome do aluno: " TO cNome
        cNome := Upper(cNome)
        lValido := .F.
        FOR nI := 1 TO Len(Trim(cNome))
            cChar := SubStr(cNome, nI, 1)
            IF !IsDigit(cChar) .AND. cChar != " "
                lValido := .T.
            ENDIF
        NEXT nI
        IF lValido
            EXIT
        ENDIF
        QOut("Nome inválido. Não pode ser vazio nem conter apenas números.")
    ENDDO

    // Validação da disciplina
    WHILE .T.
        ACCEPT "Digite a disciplina (3 letras maiúsculas, ex: MAT): " TO cDisc
        IF Len(cDisc) == 3 .AND. cDisc == Upper(cDisc)
            EXIT
        ENDIF
        QOut("Disciplina inválida. Deve ter exatamente 3 letras maiúsculas.")
    ENDDO

    // Validação da nota 1 (só dígitos e no máximo uma vírgula/ponto)
    WHILE .T.
        ACCEPT "Digite a primeira nota (0 a 10): " TO cNota1
        lValido := .T.
        FOR nI := 1 TO Len(cNota1)
            cChar := SubStr(cNota1, nI, 1)
            IF !IsDigit(cChar) .AND. cChar != "," .AND. cChar != "."
                lValido := .F.
            ENDIF
        NEXT nI
        IF lValido
            nNota1 := Val(StrTran(cNota1, ",", "."))
            IF nNota1 >= 0 .AND. nNota1 <= 10
                EXIT
            ENDIF
        ENDIF
        QOut("Nota inválida. Digite um número entre 0 e 10.")
    ENDDO

    // Validação da nota 2
    WHILE .T.
        ACCEPT "Digite a segunda nota (0 a 10): " TO cNota2
        lValido := .T.
        FOR nI := 1 TO Len(cNota2)
            cChar := SubStr(cNota2, nI, 1)
            IF !IsDigit(cChar) .AND. cChar != "," .AND. cChar != "."
                lValido := .F.
            ENDIF
        NEXT nI
        IF lValido
            nNota2 := Val(StrTran(cNota2, ",", "."))
            IF nNota2 >= 0 .AND. nNota2 <= 10
                EXIT
            ENDIF
        ENDIF
        QOut("Nota inválida. Digite um número entre 0 e 10.")
    ENDDO

    nMedia := (nNota1 + nNota2) / 2

    QOut("")
    QOut("=== Dados do aluno ===")
    QOut("Nome: " + Trim(cNome))
    QOut("Disciplina: " + cDisc)
    QOut("Nota 1: " + AllTrim(Str(nNota1, 10, 2)))
    QOut("Nota 2: " + AllTrim(Str(nNota2, 10, 2)))
    QOut("Média: " + AllTrim(Str(nMedia, 10, 2)))

RETURN NIL