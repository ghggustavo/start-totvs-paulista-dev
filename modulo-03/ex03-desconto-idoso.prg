Function Main()

    LOCAL cNome
    LOCAL cDataNasc
    LOCAL dNasc
    LOCAL cPreco
    LOCAL nPreco
    LOCAL nIdade
    LOCAL nDesconto
    LOCAL nTotal

    hb_cdpSelect( "PT850" ) // Corrige a acentuação no terminal
    Set Date Format To "DD/MM/YYYY"

    ? "=== Cadastro do Cliente ==="
    ? "Informe o nome:"
    Accept To cNome

    cDataNasc := ""
    ? "Informe a data de nascimento no formato DD/MM/AAAA (exemplo: 01/01/2000):"
    Accept To cDataNasc
    dNasc := CToD( cDataNasc )

    ? "Informe o preço do produto:"
    Accept To cPreco
    nPreco := Val( StrTran( cPreco, ",", "." ) )

    // Calcula a idade em anos, protegendo com Int() pra não exibir casas decimais
    nIdade := Int( ( Date() - dNasc ) / 365 )

    // Aplica 12,5% de desconto para maiores de 60 anos
    If nIdade > 60
        nDesconto := nPreco * 0.125
    Else
        nDesconto := 0
    EndIf

    nTotal := nPreco - nDesconto

    ? ""
    ? "=== Resumo da Compra ==="
    ? "Cliente.....: " + Upper( cNome )
    ? "Idade.......: " + Str( nIdade, 3 ) + " anos"
    ? "Preço.......: R$ " + AllTrim( Str( nPreco, 10, 2 ) )
    ? "Desconto....: R$ " + AllTrim( Str( nDesconto, 10, 2 ) )
    ? "Total.......: R$ " + AllTrim( Str( nTotal, 10, 2 ) )

Return NIL