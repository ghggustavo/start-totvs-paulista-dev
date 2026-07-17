FUNCTION Main()

    LOCAL cValor1
    LOCAL cValor2
    LOCAL nValor1
    LOCAL nValor2

    // Ajusta a codificação para exibir acentos corretamente no console
    hb_cdpSelect( "PT850" )

    // Leitura dos valores como texto
    ACCEPT "Digite o primeiro valor numérico.: " TO cValor1
    ACCEPT "Digite o segundo valor numérico..: " TO cValor2

    // Conversão de texto para número
    nValor1 := Val( cValor1 )
    nValor2 := Val( cValor2 )

    ?
    ? "Valor 1: " + hb_ValToStr( nValor1 )
    ? "Valor 2: " + hb_ValToStr( nValor2 )
    ?

    // Primeiro trata o caso de igualdade
    IF nValor1 == nValor2

        ? "Os dois valores são iguais!"

    ELSE

        // Se não são iguais, decide quem é o maior
        IF nValor1 > nValor2
            ? "O maior valor é.: " + hb_ValToStr( nValor1 )
            ? "O menor valor é.: " + hb_ValToStr( nValor2 )
        ELSE
            ? "O maior valor é.: " + hb_ValToStr( nValor2 )
            ? "O menor valor é.: " + hb_ValToStr( nValor1 )
        ENDIF

    ENDIF

RETURN NIL