Function Main()

    LOCAL cNomeFuncionario  := "João"   // c = character (texto)
    LOCAL nSalarioBruto     := 3500.50            // n = numeric (número)
    LOCAL lAtivo            := .T.                 // l = logical (verdadeiro/falso)
    LOCAL dDataAdmissao     := hb_SToD( "20240115" ) // d = date (data)
    LOCAL cCodDepartamento  := "TI01"              // c = character (código alfanumérico)

    hb_cdpSelect( "PT850" )

    ? "Nome.........:", cNomeFuncionario
    ? "Salário Bruto:", nSalarioBruto
    ? "Ativo?.......:", lAtivo
    ? "Admissão.....:", dDataAdmissao
    ? "Departamento.:", cCodDepartamento

Return NIL