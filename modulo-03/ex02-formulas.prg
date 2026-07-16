#define PI 3.14159

Function Main()

    LOCAL cRaio
    LOCAL nAreaCirculo
    LOCAL cCatetoA
    LOCAL cCatetoB
    LOCAL nHipotenusa
    LOCAL cPeso
    LOCAL cAltura
    LOCAL nAlturaNum
    LOCAL nImc

    hb_cdpSelect( "PT850" )

    // A) Calcula Área do círculo
    ? "=== Área do círculo ==="
    ? "Informe o raio do círculo:"
    Accept To cRaio
    nAreaCirculo := PI * ( Val( StrTran( cRaio, ",", "." ) ) ^ 2 )
    ? "Área do círculo: " + Str( nAreaCirculo, 10, 2 )

    // B) Calcula Hipotenusa do triângulo retângulo
    ? ""
    ? "=== Hipotenusa do triângulo ==="
    ? "Informe o cateto A:"
    Accept To cCatetoA
    ? "Informe o cateto B:"
    Accept To cCatetoB
    nHipotenusa := Sqrt( ( Val( StrTran( cCatetoA, ",", "." ) ) ^ 2 ) + ( Val( StrTran( cCatetoB, ",", "." ) ) ^ 2 ) )
    ? "Hipotenusa: " + Str( nHipotenusa, 10, 2 )

    // C) Calcula Índice de Massa Corporal (IMC)
    ? ""
    ? "=== Índice de Massa Corporal (IMC) ==="
    ? "Informe o peso (kg):"
    Accept To cPeso
    ? "Informe a altura (m):"
    Accept To cAltura

    nAlturaNum := Val( StrTran( cAltura, ",", "." ) )
    If nAlturaNum > 3
        nAlturaNum := nAlturaNum / 100
    EndIf

    nImc := Val( StrTran( cPeso, ",", "." ) ) / ( nAlturaNum ^ 2 )
    ? "IMC: " + Str( nImc, 10, 2 )

Return NIL