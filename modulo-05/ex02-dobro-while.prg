FUNCTION Main()

    LOCAL cValor
    LOCAL nValor

    hb_cdpSelect("PT850")

    WHILE .T.

        ACCEPT "Digite um valor inteiro (zero ou negativo para parar): " TO cValor
        nValor := Val(cValor)

        IF nValor <= 0
            EXIT
        ENDIF

        QOut("O dobro de " + AllTrim(Str(nValor)) + " é " + AllTrim(Str(nValor * 2)))

    ENDDO

    QOut("Fim do programa.")

RETURN NIL