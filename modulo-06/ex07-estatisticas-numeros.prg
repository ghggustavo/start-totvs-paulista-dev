FUNCTION Main()
    LOCAL aNumeros := {}
    LOCAL cInput := ""
    LOCAL nNumero := 0
    LOCAL nSoma := 0
    LOCAL nMedia := 0
    LOCAL i

    CLEAR SCREEN
    ? "=== Estatisticas de 10 Numeros ==="
    ? ""

    // Leitura dos 10 numeros
    FOR i := 1 TO 10
        ACCEPT "Digite o " + ALLTRIM(STR(i)) + "o numero: " TO cInput
        nNumero := VAL(ALLTRIM(cInput))
        
        AADD(aNumeros, nNumero)
        nSoma += nNumero
    NEXT

    // Ordena o array em ordem crescente
    ASORT(aNumeros)

    // Calculo da media
    nMedia := nSoma / LEN(aNumeros)

    ? ""
    ? "--- Resultados ---"
    
    // Exibe os numeros ordenados em uma unica linha
    ?? "Numeros em ordem crescente: "
    FOR i := 1 TO LEN(aNumeros)
        ?? ALLTRIM(STR(aNumeros[i])) + IF(i < LEN(aNumeros), ", ", "")
    NEXT
    ? ""

    ? "Soma: " + ALLTRIM(STR(nSoma))
    ? "Media: " + ALLTRIM(STR(nMedia))
    ? "Menor numero: " + ALLTRIM(STR(aNumeros[1]))
    ? "Maior numero: " + ALLTRIM(STR(aNumeros[LEN(aNumeros)]))
    ? ""

RETURN NIL