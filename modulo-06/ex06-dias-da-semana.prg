FUNCTION Main()
    // Array com os 7 dias da semana (indices de 1 a 7)
    LOCAL aDias := {"Domingo", "Segunda-feira", "Terca-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sabado"}
    LOCAL cInput := ""
    LOCAL nDia := 0

    CLEAR SCREEN
    ? "=== Dias da Semana por Indice ==="
    ? ""

    // Le a entrada do usuario
    ACCEPT "Digite um numero de 1 a 7: " TO cInput
    nDia := VAL(ALLTRIM(cInput))

    // Valida se o numero esta no intervalo de 1 a 7
    IF nDia >= 1 .AND. nDia <= 7
        ? "Dia correspondente: " + aDias[nDia]
    ELSE
        ? "Erro: Numero invalido! Digite apenas valores entre 1 e 7."
    ENDIF

    ? ""
RETURN NIL