Function Main()

    LOCAL cLonga
    LOCAL cCurta

    hb_cdpSelect( "UTF8" ) 

    cLonga := "Harbour"
    cCurta := "Harb"

    ? "=== Comparando strings: 'Harbour' e 'Harb' ==="
    ? ""
    ? "O '=' compara apenas até o tamanho da string menor."
    ? "Já o '==' exige que as duas strings sejam idênticas, com o mesmo tamanho."
    ? ""

    Set Exact Off

    ? "cLonga = cCurta  ->", cLonga = cCurta
    ? "   'Harb' é o começo de 'Harbour', então o '=' considera igual (.T.)"
    ? ""
    ? "cLonga == cCurta ->", cLonga == cCurta
    ? "   Os tamanhos são diferentes, então o '==' considera diferente (.F.)"

Return NIL