FUNCTION Main()

    LOCAL cSalario
    LOCAL nSalarioAtual
    LOCAL nPercentual
    LOCAL nNovoSalario

    // Ajusta a codificação para exibir acentos corretamente no console
    hb_cdpSelect( "PT850" )

    // Leitura do salário atual (aceita vírgula como separador decimal, ex: 1300,50)
    ACCEPT "Digite o salário atual: " TO cSalario

    // Converte a vírgula caso usuário use 
    cSalario := StrTran( cSalario, ",", "." )

    // Conversão de texto para número
    nSalarioAtual := Val( cSalario )

    // Define o percentual de reajuste conforme a faixa salarial
    IF nSalarioAtual < 1000
        nPercentual := 15
    ELSEIF nSalarioAtual >= 1000 .AND. nSalarioAtual <= 2000
        nPercentual := 12
    ELSEIF nSalarioAtual > 2000 .AND. nSalarioAtual <= 4000
        nPercentual := 8
    ELSE
        nPercentual := 5
    ENDIF

    // Calcula o novo salário aplicando o percentual de reajuste
    nNovoSalario := nSalarioAtual + ( nSalarioAtual * nPercentual / 100 )

    ?
    ? PadR( "Salário atual: ", 19 )    + "R$ " + AllTrim( Str( nSalarioAtual, 10, 2 ) )
    ? PadR( "Reajuste aplicado: ", 19 ) + AllTrim( hb_ValToStr( nPercentual ) ) + "%"
    ? PadR( "Novo salário: ", 19 )     + "R$ " + AllTrim( Str( nNovoSalario, 10, 2 ) )

RETURN NIL