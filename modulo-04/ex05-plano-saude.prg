FUNCTION Main()

    LOCAL cIdade
    LOCAL cDependentes
    LOCAL nIdade
    LOCAL nDependentes
    LOCAL nValorBase
    LOCAL nValorTotal

    hb_cdpSelect( "PT850" )

    ?
    ? "=========================================="
    ? "        BEM-VINDO AO PLANO DE SAUDE        "
    ? "=========================================="
    ?

    // Leitura da idade do cliente
    ACCEPT "Digite a idade..............: " TO cIdade

    nIdade := Val( StrTran( cIdade, ",", "." ) )

    // Valida se o cliente é maior de idade antes de continuar
    IF nIdade < 18
        ?
        ? "Nao e possivel contratar o plano: e necessario ser maior de idade (18 anos ou mais)."
        RETURN NIL
    ENDIF

    // Leitura do número de dependentes
    ACCEPT "Digite o numero de dependentes: " TO cDependentes

    nDependentes := Int( Val( StrTran( cDependentes, ",", "." ) ) )

    // Define o valor base do plano conforme a faixa etária
    DO CASE
        CASE nIdade <= 25
            nValorBase := 180

        CASE nIdade >= 26 .AND. nIdade <= 40
            nValorBase := 260

        CASE nIdade >= 41 .AND. nIdade <= 60
            nValorBase := 380

        OTHERWISE
            nValorBase := 520

    ENDCASE

    // Soma o adicional por dependente ao valor base
    nValorTotal := nValorBase + ( nDependentes * 90 )

    ?
    ? "Idade informada.......: " + hb_ValToStr( nIdade )
    ? "Dependentes informados: " + hb_ValToStr( nDependentes )
    ? "Valor base do plano...: R$ " + AllTrim( Str( nValorBase, 10, 2 ) )
    ? "Valor mensal total....: R$ " + AllTrim( Str( nValorTotal, 10, 2 ) )

RETURN NIL