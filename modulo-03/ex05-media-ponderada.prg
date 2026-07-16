Function Main()

    LOCAL cNota1
    LOCAL cNota2
    LOCAL cNota3
    LOCAL cNota4
    LOCAL nMediaPonderada
    LOCAL cSituacao

    hb_cdpSelect( "PT850" ) // Corrige a acentuação no terminal

    ? "=== Cálculo da Média Ponderada ==="
    ? ""

    ? "Informe a nota do 1º bimestre (peso 1):"
    Accept To cNota1

    ? "Informe a nota do 2º bimestre (peso 2):"
    Accept To cNota2

    ? "Informe a nota do 3º bimestre (peso 3):"
    Accept To cNota3

    ? "Informe a nota do 4º bimestre (peso 4):"
    Accept To cNota4

    nMediaPonderada := ( Val( StrTran( cNota1, ",", "." ) ) * 1 + ;
                         Val( StrTran( cNota2, ",", "." ) ) * 2 + ;
                         Val( StrTran( cNota3, ",", "." ) ) * 3 + ;
                         Val( StrTran( cNota4, ",", "." ) ) * 4 ) / ( 1 + 2 + 3 + 4 )

    ? ""
    ? "Média ponderada: " + AllTrim( Str( nMediaPonderada, 10, 2 ) )

    // Verifica a situação do aluno (média 6)
    If nMediaPonderada >= 6.0
        cSituacao := "Aprovado"
    Else
        cSituacao := "Reprovado"
    EndIf

    ? "Situação........: " + cSituacao

Return NIL