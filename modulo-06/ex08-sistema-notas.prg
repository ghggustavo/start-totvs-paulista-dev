FUNCTION Main()
    LOCAL aAlunos := {}
    LOCAL nTotalAlunos := 0
    LOCAL cInput := ""
    LOCAL cNome := ""
    LOCAL n1 := 0, n2 := 0, n3 := 0, n4 := 0
    LOCAL nMedia := 0
    LOCAL i

    CLEAR SCREEN
    ? "=== Sistema de Notas ==="
    ? ""

    // Leitura da quantidade de alunos
    ACCEPT "Quantidade de alunos a cadastrar: " TO cInput
    nTotalAlunos := VAL(ALLTRIM(cInput))

    IF nTotalAlunos <= 0
        ? "Erro: Quantidade de alunos deve ser maior que zero!"
        ? ""
        RETURN NIL
    ENDIF

    // Leitura dos dados de cada aluno
    FOR i := 1 TO nTotalAlunos
        ? ""
        ? "--- Cadastrando Aluno " + ALLTRIM(STR(i)) + " ---"
        
        // Le e valida o nome do aluno
        cNome := LerNome("Nome: ")

        // Le e valida cada nota individualmente
        n1 := LerNota("Nota 1: ")
        n2 := LerNota("Nota 2: ")
        n3 := LerNota("Nota 3: ")
        n4 := LerNota("Nota 4: ")

        // Adiciona a linha {nome, n1, n2, n3, n4} no array multidimensional
        AADD(aAlunos, {cNome, n1, n2, n3, n4})
    NEXT

    ? ""
    ? "=== RESULTADOS DOS ALUNOS ==="

    // Percorre o array multidimensional para calcular a media e exibir a situacao
    FOR i := 1 TO LEN(aAlunos)
        // Calculo da media usando os elementos do subarray
        nMedia := (aAlunos[i][2] + aAlunos[i][3] + aAlunos[i][4] + aAlunos[i][5]) / 4

        ? ""
        ? "Aluno: " + aAlunos[i][1]
        ? "Notas: " + ALLTRIM(STR(aAlunos[i][2], 5, 2)) + " | " + ;
                     ALLTRIM(STR(aAlunos[i][3], 5, 2)) + " | " + ;
                     ALLTRIM(STR(aAlunos[i][4], 5, 2)) + " | " + ;
                     ALLTRIM(STR(aAlunos[i][5], 5, 2))
        ? "Media: " + ALLTRIM(STR(nMedia, 5, 2))

        IF nMedia >= 7
            ? "Situacao: APROVADO"
        ELSE
            ? "Situacao: REPROVADO"
        ENDIF
    NEXT

    ? ""
RETURN NIL


FUNCTION LerNome(cPrompt)
    LOCAL cNome := ""

    DO WHILE .T.
        ACCEPT cPrompt TO cNome
        cNome := UPPER(ALLTRIM(cNome))

        // Valida se o nome nao esta em branco
        IF !EMPTY(cNome)
            EXIT
        ENDIF

        ? "Erro: O nome do aluno nao pode ficar em branco!"
    ENDDO

RETURN cNome


FUNCTION LerNota(cPrompt)
    LOCAL cInput := ""
    LOCAL nNota := 0

    DO WHILE .T.
        ACCEPT cPrompt TO cInput
        cInput := ALLTRIM(cInput)

        // Valida se o campo esta em branco
        IF EMPTY(cInput)
            ? "Erro: A nota nao pode ficar em branco!"
            LOOP
        ENDIF

        nNota := VAL(STRTRAN(cInput, ",", "."))

        // Valida se a nota esta no intervalo de 0 a 10
        IF nNota >= 0 .AND. nNota <= 10
            EXIT // Sai do laco se a nota for valida
        ENDIF

        ? "Erro: Nota invalida! Digite um valor entre 0 e 10."
    ENDDO

RETURN nNota