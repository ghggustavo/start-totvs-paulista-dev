FUNCTION Main()

   LOCAL nContador
   LOCAL cHoraAtual
   LOCAL cHoraFormatada

   hb_cdpSelect("PT850")

   nContador := 0

   DO WHILE nContador < 30

      cHoraAtual := ObterHora()
      cHoraFormatada := FormatarHora(cHoraAtual)
      ExibirHora(cHoraFormatada)

      hb_idleSleep(1)
      nContador++

   ENDDO

   QOut("Relógio encerrado.")

RETURN NIL

// Responsabilidade: capturar a hora atual do sistema
FUNCTION ObterHora()

   LOCAL cHora

   cHora := Time()

RETURN cHora

// Responsabilidade: formatar a hora no padrão HH:MM:SS
FUNCTION FormatarHora(cHora)

   LOCAL cHoraFormatada

   cHoraFormatada := SubStr(cHora, 1, 2) + ":" + ;
                     SubStr(cHora, 4, 2) + ":" + ;
                     SubStr(cHora, 7, 2)

RETURN cHoraFormatada

// Responsabilidade: exibir a hora na tela
FUNCTION ExibirHora(cHora)

   CLS
   QOut("Hora atual: " + cHora)

RETURN NIL