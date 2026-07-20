FUNCTION Main()

    LOCAL nI

    // a) Números de 1 a 100
    QOut("=== De 1 a 100 ===")
    FOR nI := 1 TO 100
        QOut(nI)
    NEXT nI

    // b) Números de -50 a 50
    QOut("=== De -50 a 50 ===")                                                     //Para testar usei: hbmk ex01-sequencias-for.prg -gtcgi
    FOR nI := -50 TO 50
        QOut(nI)                                                                    //E compilei .\ex01-sequencias-for.exe > saida.txt para conferir os valores
    NEXT nI

    // c) Números de 80 a 5, decrescente
    QOut("=== De 80 a 5 (decrescente) ===")
    FOR nI := 80 TO 5 STEP -1
        QOut(nI)
    NEXT nI

RETURN NIL