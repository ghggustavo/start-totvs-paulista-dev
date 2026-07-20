FUNCTION Main()

    LOCAL nSecreto
    LOCAL nI
    LOCAL cPalpite
    LOCAL nPalpite
    LOCAL lAcertou

    hb_cdpSelect("PT850")

    nSecreto := HB_RandomInt(1, 100)
    lAcertou := .F.

    QOut("=== Adivinhe o número ===")
    QOut("Pensei em um número entre 1 e 100. Você tem 7 tentativas!")
    QOut("")

    FOR nI := 1 TO 7

        ACCEPT "Tentativa " + AllTrim(Str(nI)) + "/7 - Digite seu palpite: " TO cPalpite
        nPalpite := Val(cPalpite)

        IF nPalpite == nSecreto
            lAcertou := .T.
            EXIT
        ELSEIF nPalpite < nSecreto
            QOut("O número secreto é MAIOR que " + AllTrim(Str(nPalpite)))
        ELSE
            QOut("O número secreto é MENOR que " + AllTrim(Str(nPalpite)))
        ENDIF

    NEXT nI

    QOut("")
    IF lAcertou
        QOut("Parabéns! Você acertou o número " + AllTrim(Str(nSecreto)) + " em " + AllTrim(Str(nI)) + " tentativa(s)!")
    ELSE
        QOut("Suas tentativas acabaram! O número secreto era " + AllTrim(Str(nSecreto)))
    ENDIF

RETURN NIL