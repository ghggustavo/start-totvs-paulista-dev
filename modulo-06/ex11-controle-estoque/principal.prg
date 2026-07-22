FUNCTION Main()
    LOCAL aEstoque := {}
    LOCAL nOpcao := -1

    DO WHILE nOpcao != 0
        CLEAR SCREEN
        nOpcao := ExibirMenu()

        CLEAR SCREEN
        DO CASE
            CASE nOpcao == 1
                CadastrarProduto(aEstoque)
            CASE nOpcao == 2
                ListarProdutos(aEstoque)
            CASE nOpcao == 3
                EntradaEstoque(aEstoque)
            CASE nOpcao == 4
                SaidaEstoque(aEstoque)
            CASE nOpcao == 5
                MenuBuscarProduto(aEstoque)
            CASE nOpcao == 6
                RelatorioEstoque(aEstoque)
            CASE nOpcao == 0
                ? "Saindo do sistema... Ate logo!"
            OTHERWISE
                ? "Opcao invalida! Tente novamente."
        ENDCASE

        IF nOpcao != 0
            ? ""
            WAIT "Pressione qualquer tecla para continuar..."
        ENDIF
    ENDDO

RETURN NIL


FUNCTION ExibirMenu()
    LOCAL cInput := ""

    ? "=== CONTROLE DE ESTOQUE SIMPLIFICADO ==="
    ? "1 - Cadastrar produto"
    ? "2 - Listar produtos"
    ? "3 - Entrada de estoque"
    ? "4 - Saida de estoque"
    ? "5 - Buscar produto por codigo"
    ? "6 - Relatorio de valor em estoque"
    ? "0 - Sair"
    ? "----------------------------------------"
    
    ACCEPT "Escolha uma opcao: " TO cInput

RETURN VAL(ALLTRIM(cInput))