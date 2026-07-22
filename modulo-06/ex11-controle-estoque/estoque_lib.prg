// BIBLIOTECA DE OPERACOES DE ESTOQUE
FUNCTION CadastrarProduto(aEstoque)
    LOCAL cCodigo, cNome, nQtd, nPreco

    ? "--- Cadastrar Produto ---"
    cCodigo := LerTexto("Codigo do produto: ")

    // Valida se o codigo ja existe
    IF BuscarProduto(aEstoque, cCodigo) > 0
        ? "Erro: Codigo ja cadastrado no sistema!"
        RETURN NIL
    ENDIF

    cNome := LerTexto("Nome do produto: ")
    nQtd := LerNumeroMaiorOuIgualZero("Quantidade inicial: ")
    nPreco := LerNumeroPositivo("Preco unitario (R$): ")

    // Adiciona o subarray {codigo, nome, quantidade, preco}
    AADD(aEstoque, {cCodigo, cNome, nQtd, nPreco})
    ? ""
    ? "Sucesso: Produto cadastrado com sucesso!"

RETURN NIL


FUNCTION ListarProdutos(aEstoque)
    LOCAL i

    ? "--- Lista de Produtos ---"
    IF LEN(aEstoque) == 0
        ? "Nenhum produto cadastrado."
        RETURN NIL
    ENDIF

    FOR i := 1 TO LEN(aEstoque)
        ? "Codigo: " + aEstoque[i][1] + ;
          " | Nome: " + aEstoque[i][2] + ;
          " | Qtd: " + ALLTRIM(STR(aEstoque[i][3])) + ;
          " | Preco: R$ " + ALLTRIM(STR(aEstoque[i][4], 10, 2))
    NEXT

RETURN NIL


FUNCTION EntradaEstoque(aEstoque)
    LOCAL cCodigo, nPos, nQtd

    ? "--- Entrada de Estoque ---"
    IF LEN(aEstoque) == 0
        ? "Nenhum produto cadastrado."
        RETURN NIL
    ENDIF

    cCodigo := LerTexto("Codigo do produto: ")
    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos == 0
        ? "Erro: Produto nao encontrado!"
        RETURN NIL
    ENDIF

    ? "Produto: " + aEstoque[nPos][2] + " | Estq Atual: " + ALLTRIM(STR(aEstoque[nPos][3]))
    nQtd := LerNumeroPositivo("Quantidade a adicionar: ")

    aEstoque[nPos][3] += nQtd
    ? ""
    ? "Sucesso: Estoque atualizado! Novo total: " + ALLTRIM(STR(aEstoque[nPos][3]))

RETURN NIL


FUNCTION SaidaEstoque(aEstoque)
    LOCAL cCodigo, nPos, nQtd

    ? "--- Saida de Estoque ---"
    IF LEN(aEstoque) == 0
        ? "Nenhum produto cadastrado."
        RETURN NIL
    ENDIF

    cCodigo := LerTexto("Codigo do produto: ")
    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos == 0
        ? "Erro: Produto nao encontrado!"
        RETURN NIL
    ENDIF

    ? "Produto: " + aEstoque[nPos][2] + " | Estq Atual: " + ALLTRIM(STR(aEstoque[nPos][3]))
    nQtd := LerNumeroPositivo("Quantidade a retirar: ")

    // Valida se ha estoque suficiente
    IF nQtd > aEstoque[nPos][3]
        ? "Erro: Quantidade insuficiente em estoque!"
        RETURN NIL
    ENDIF

    aEstoque[nPos][3] -= nQtd
    ? ""
    ? "Sucesso: Saida realizada! Novo total: " + ALLTRIM(STR(aEstoque[nPos][3]))

RETURN NIL


FUNCTION BuscarProduto(aEstoque, cCodigo)
    LOCAL i
    cCodigo := UPPER(ALLTRIM(cCodigo))

    FOR i := 1 TO LEN(aEstoque)
        IF aEstoque[i][1] == cCodigo
            RETURN i // Retorna a posicao no array
        ENDIF
    NEXT

RETURN 0 // Retorna 0 se nao encontrar


FUNCTION MenuBuscarProduto(aEstoque)
    LOCAL cCodigo, nPos

    ? "--- Buscar Produto por Codigo ---"
    IF LEN(aEstoque) == 0
        ? "Nenhum produto cadastrado."
        RETURN NIL
    ENDIF

    cCodigo := LerTexto("Codigo a pesquisar: ")
    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos == 0
        ? "Produto nao encontrado."
    ELSE
        ? ""
        ? "Produto encontrado na posicao [" + ALLTRIM(STR(nPos)) + "]:"
        ? "Codigo: " + aEstoque[nPos][1]
        ? "Nome: " + aEstoque[nPos][2]
        ? "Quantidade: " + ALLTRIM(STR(aEstoque[nPos][3]))
        ? "Preco Unitario: R$ " + ALLTRIM(STR(aEstoque[nPos][4], 10, 2))
    ENDIF

RETURN NIL


FUNCTION RelatorioEstoque(aEstoque)
    LOCAL i, nSubtotal
    LOCAL nTotalGeral := 0

    ? "--- Relatorio de Valor em Estoque ---"
    IF LEN(aEstoque) == 0
        ? "Nenhum produto cadastrado."
        RETURN NIL
    ENDIF

    FOR i := 1 TO LEN(aEstoque)
        nSubtotal := aEstoque[i][3] * aEstoque[i][4]
        nTotalGeral += nSubtotal

        ? "Codigo: " + aEstoque[i][1] + ;
          " | Nome: " + aEstoque[i][2] + ;
          " | Qtd: " + ALLTRIM(STR(aEstoque[i][3])) + ;
          " | Preco Un: R$ " + ALLTRIM(STR(aEstoque[i][4], 10, 2)) + ;
          " | Total: R$ " + ALLTRIM(STR(nSubtotal, 10, 2))
    NEXT

    ? "--------------------------------------------------"
    ? "TOTAL GERAL EM ESTOQUE: R$ " + ALLTRIM(STR(nTotalGeral, 10, 2))

RETURN NIL

// FUNCOES AUXILIARES DE VALIDACAO DE ENTRADA

FUNCTION LerTexto(cPrompt)
    LOCAL cTexto := ""

    DO WHILE .T.
        ACCEPT cPrompt TO cTexto
        cTexto := UPPER(ALLTRIM(cTexto))

        IF !EMPTY(cTexto)
            EXIT
        ENDIF

        ? "Erro: O campo nao pode ficar em branco!"
    ENDDO

RETURN cTexto


FUNCTION LerNumeroPositivo(cPrompt)
    LOCAL cInput := ""
    LOCAL nValor := 0

    DO WHILE .T.
        ACCEPT cPrompt TO cInput
        cInput := ALLTRIM(cInput)

        IF EMPTY(cInput)
            ? "Erro: O valor nao pode ficar em branco!"
            LOOP
        ENDIF

        nValor := VAL(STRTRAN(cInput, ",", "."))

        IF nValor > 0
            EXIT
        ENDIF

        ? "Erro: Digite um valor maior que zero."
    ENDDO

RETURN nValor


FUNCTION LerNumeroMaiorOuIgualZero(cPrompt)
    LOCAL cInput := ""
    LOCAL nValor := 0

    DO WHILE .T.
        ACCEPT cPrompt TO cInput
        cInput := ALLTRIM(cInput)

        IF EMPTY(cInput)
            ? "Erro: O valor nao pode ficar em branco!"
            LOOP
        ENDIF

        nValor := VAL(STRTRAN(cInput, ",", "."))

        IF nValor >= 0
            EXIT
        ENDIF

        ? "Erro: Digite um valor maior ou igual a zero."
    ENDDO

RETURN nValor