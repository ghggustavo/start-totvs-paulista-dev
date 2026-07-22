FUNCTION Main()
    LOCAL aNumeros := {}
    LOCAL i

    CLEAR SCREEN
    ? "=== Bubble Sort Manual ==="
    ? ""

    // Leitura dos 10 numeros
    FOR i := 1 TO 10
        AADD(aNumeros, LerNumero("Digite o " + ALLTRIM(STR(i)) + "o numero: "))
    NEXT

    ? ""
    ? "--- Array Original ---"
    ExibirArray(aNumeros)

    // Chama a funcao de ordenacao manual
    aNumeros := BubbleSort(aNumeros)

    ? ""
    ? "*** Array Ordenado (Bubble Sort) *** : "
    ExibirArray(aNumeros)
    ? ""

RETURN NIL


FUNCTION BubbleSort(aVetor)
    LOCAL nLen := LEN(aVetor)
    LOCAL i, j, nTemp

    // Dois loops encaixados para percorrer e comparar elementos vizinhos
    FOR i := 1 TO nLen - 1
        FOR j := 1 TO nLen - i
            // Se o elemento atual for maior que o proximo, troca de posicao
            IF aVetor[j] > aVetor[j + 1]
                nTemp := aVetor[j]
                aVetor[j] := aVetor[j + 1]
                aVetor[j + 1] := nTemp
            ENDIF
        NEXT
    NEXT

RETURN aVetor


FUNCTION LerNumero(cPrompt)
    LOCAL cInput := ""

    DO WHILE .T.
        ACCEPT cPrompt TO cInput
        cInput := ALLTRIM(cInput)

        IF !EMPTY(cInput)
            EXIT
        ENDIF

        ? "Erro: O valor nao pode ficar em branco!"
    ENDDO

RETURN VAL(STRTRAN(cInput, ",", "."))


FUNCTION ExibirArray(aVetor)
    LOCAL i

    FOR i := 1 TO LEN(aVetor)
        ?? ALLTRIM(STR(aVetor[i])) + IF(i < LEN(aVetor), ", ", "")
    NEXT
    ? ""

RETURN NIL