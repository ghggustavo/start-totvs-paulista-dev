FUNCTION Main()
    LOCAL aCarrinho := {}
    LOCAL cNome := ""
    LOCAL nPreco := 0
    LOCAL nTotal := 0
    LOCAL cResposta := ""
    LOCAL lContinuar := .T.
    LOCAL i := 0

    CLEAR SCREEN
    ? "=== Mini-Carrinho de Compras ==="
    ? ""

    DO WHILE lContinuar
        ? "--- Adicionando Produto ---"
        cNome := LerNome("Nome do produto: ")
        nPreco := LerPreco("Preco do produto (R$): ")

        // Adiciona a linha {nome, preco} no carrinho
        AADD(aCarrinho, {cNome, nPreco})

        ? ""
        ACCEPT "Deseja adicionar outro produto? (S/N): " TO cResposta
        cResposta := UPPER(ALLTRIM(cResposta))

        IF cResposta != "S"
            lContinuar := .F.
        ENDIF
        ? ""
    ENDDO

    ? "=== RESUMO DA COMPRA ==="
    FOR i := 1 TO LEN(aCarrinho)
        ? ALLTRIM(STR(i)) + ". " + aCarrinho[i][1] + " - R$ " + ALLTRIM(STR(aCarrinho[i][2], 10, 2))
        nTotal += aCarrinho[i][2]
    NEXT

    ? "------------------------"
    ? "TOTAL DA COMPRA: R$ " + ALLTRIM(STR(nTotal, 10, 2))
    ? ""

RETURN NIL


FUNCTION LerNome(cPrompt)
    LOCAL cNome := ""

    DO WHILE .T.
        ACCEPT cPrompt TO cNome
        cNome := UPPER(ALLTRIM(cNome))

        IF !EMPTY(cNome)
            EXIT
        ENDIF

        ? "Erro: O nome do produto nao pode ficar em branco!"
    ENDDO

RETURN cNome


FUNCTION LerPreco(cPrompt)
    LOCAL cInput := ""
    LOCAL nPreco := 0

    DO WHILE .T.
        ACCEPT cPrompt TO cInput
        cInput := ALLTRIM(cInput)

        IF EMPTY(cInput)
            ? "Erro: O preco nao pode ficar em branco!"
            LOOP
        ENDIF

        // Substitui a virgula por ponto para converter corretamente
        nPreco := VAL(STRTRAN(cInput, ",", "."))

        IF nPreco > 0
            EXIT
        ENDIF

        ? "Erro: Preco invalido! Digite um valor maior que zero."
    ENDDO

RETURN nPreco