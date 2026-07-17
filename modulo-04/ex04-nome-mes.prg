FUNCTION Main()

    LOCAL cMes
    LOCAL nMes

     hb_cdpSelect( "PT850" )

    //REcebe o mês digitado
    ACCEPT "Digite o numero do mes (1 a 12): " TO cMes

    nMes := Val( cMes )

    //Dessa maneira fica melhor a manutenção ao longo do tempo
    DO CASE


        CASE nMes == 1

            ? "Janeiro"



        CASE nMes == 2

            ? "Fevereiro"



        CASE nMes == 3

            ? "Marco"



        CASE nMes == 4

            ? "Abril"



        CASE nMes == 5

            ? "Maio"



        CASE nMes == 6

            ? "Junho"



        CASE nMes == 7

            ? "Julho"



        CASE nMes == 8

            ? "Agosto"



        CASE nMes == 9

            ? "Setembro"



        CASE nMes == 10

            ? "Outubro"



        CASE nMes == 11

            ? "Novembro"



        CASE nMes == 12

            ? "Dezembro"



        OTHERWISE

            ? "Mes invalido"



    ENDCASE



RETURN NIL 

