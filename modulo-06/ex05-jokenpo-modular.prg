    Function Main()
    
    LOCAL lJogando := .T.
    LOCAL cJogadaUsuario, cJogadaCPU, cVencedor, cResposta

    CLEAR SCREEN
    ? "=== Bem-vindo ao Jokenpo! ==="

    DO WHILE lJogando
        ? ""
        // Pede a jogada do usuario
        ACCEPT "Escolha pedra, papel ou tesoura: " TO cJogadaUsuario

        // Valida a jogada
        IF !ValidarJogada(cJogadaUsuario)
            ? "Erro: Jogada invalida! Digite apenas pedra, papel ou tesoura."
            LOOP // O 'LOOP' ignora o resto abaixo e reinicia o 'DO WHILE'
        ENDIF

        // Padroniza a variavel do usuario antes de comparar
        cJogadaUsuario := LOWER(ALLTRIM(cJogadaUsuario))

        // CPU faz a jogada dela
        cJogadaCPU := SortearJogadaCPU()
        ? "O computador escolheu: " + UPPER(cJogadaCPU)

        // Define quem ganhou
        cVencedor := DefinirVencedor(cJogadaUsuario, cJogadaCPU)

        // Exibe o resultado
        IF cVencedor == "Empate"
            ? "-> Resultado: Deu Empate!"
        ELSEIF cVencedor == "Jogador"
            ? "-> Resultado: Voce Venceu!"
        ELSE
            ? "-> Resultado: O Computador Venceu!"
        ENDIF

        // Pergunta se quer jogar novamente
        ? ""
        ACCEPT "Quer jogar de novo? (S/N): " TO cResposta
        cResposta := UPPER(ALLTRIM(cResposta))

        IF cResposta != "S"
            lJogando := .F.
            ? "Obrigado por jogar! Ate a proxima."
            ? ""
        ENDIF
    ENDDO

RETURN NIL


FUNCTION SortearJogadaCPU()
    LOCAL aOpcoes := {"pedra", "papel", "tesoura"}
    LOCAL nIndice

    // A funcao HB_RandomInt(min, max) sorteia um numero inteiro entre 1 e 3
    nIndice := HB_RandomInt(1, 3)

// Retorna a posicao do vetor correspondente ao numero sorteado
RETURN aOpcoes[nIndice]


FUNCTION ValidarJogada(cJogada)
    LOCAL cJogadaLimpa

    cJogadaLimpa := LOWER(ALLTRIM(cJogada))
    
    IF cJogadaLimpa == "pedra" .OR. cJogadaLimpa == "papel" .OR. cJogadaLimpa == "tesoura"
        RETURN .T.
    ENDIF

RETURN .F.

FUNCTION DefinirVencedor(cJogada1, cJogada2)
    // cJogada1 = Usuario | cJogada2 = CPU

    IF cJogada1 == cJogada2
        RETURN "Empate"
    ENDIF
    
    IF (cJogada1 == "pedra" .AND. cJogada2 == "tesoura") .OR. ;
       (cJogada1 == "papel" .AND. cJogada2 == "pedra")   .OR. ;
       (cJogada1 == "tesoura" .AND. cJogada2 == "papel")
        RETURN "Jogador"
    ENDIF
    
    // Se nao caiu no empate e o jogador nao ganhou, a CPU ganhou
RETURN "CPU"