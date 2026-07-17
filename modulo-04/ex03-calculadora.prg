FUNCTION Main()

    LOCAL nNum1      := 0
    LOCAL nNum2      := 0
    LOCAL cOperacao  := ""
    LOCAL nResultado := 0

    // Limpa a tela do terminal
    CLS

    ? "======================================="
    ? "             CALCULADORA               "
    ? "======================================="
    ?

    // Entrada de dados
    ACCEPT "Digite o primeiro número: " TO cInput1
    nNum1 := Val(cInput1)

    ? "Operações permitidas: +, -, *, /, P ou ^ (Potência), R (Raiz Quadrada)"
    ACCEPT "Escolha a operação: " TO cOperacao
    cOperacao := Upper(AllTrim(cOperacao)) // Garante que 'r' vire 'R' e remove espaços

    // A raiz quadrada só precisa de um número, então pulamos o segundo input se for o caso
    IF cOperacao != "R"
        ACCEPT "Digite o segundo número: " TO cInput2
        nNum2 := Val(cInput2)
    ENDIF

    ?

    DO CASE
        CASE cOperacao == "+"
            nResultado := nNum1 + nNum2
            ? PadR( "Resultado da soma: ", 30 ) + AllTrim( hb_ValToStr( nResultado ) )

        CASE cOperacao == "-"
            nResultado := nNum1 - nNum2
            ? PadR( "Resultado da subtracao: ", 30 ) + AllTrim( hb_ValToStr( nResultado ) )

        CASE cOperacao == "*"
            nResultado := nNum1 * nNum2
            ? PadR( "Resultado da multiplicacao: ", 30 ) + AllTrim( hb_ValToStr( nResultado ) )

        CASE cOperacao == "/"
            IF nNum2 == 0
                ? "Erro: Nao e possivel dividir por zero!"
            ELSE
                nResultado := nNum1 / nNum2
                ? PadR( "Resultado da divisao: ", 30 ) + AllTrim( hb_ValToStr( nResultado ) )
            ENDIF

        CASE cOperacao == "^" .OR. cOperacao == "P"
            nResultado := nNum1 ^ nNum2
            ? PadR( "Resultado da potencia: ", 30 ) + AllTrim( hb_ValToStr( nResultado ) )

        CASE cOperacao == "R"
            IF nNum1 < 0
                ? "Erro: Nao existe raiz quadrada de numero negativo!"
            ELSE
                nResultado := Sqrt( nNum1 )
                ? PadR( "Raiz quadrada: ", 30 ) + AllTrim( hb_ValToStr( nResultado ) )
            ENDIF

        OTHERWISE
            ? "Erro: Operacao invalida! Escolha +, -, *, /, P ou R."
    ENDCASE


    ?
    ? "======================================="
    WAIT "Pressione qualquer tecla para sair..."
RETURN NIL