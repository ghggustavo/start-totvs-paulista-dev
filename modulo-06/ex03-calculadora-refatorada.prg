FUNCTION Main()

   LOCAL nNumero1
   LOCAL nNumero2
   LOCAL cOperador
   LOCAL nResultado

   hb_cdpSelect("PT850")

   nNumero1  := LerNumero("Digite o primeiro número: ")
   cOperador := LerOperador()
   nNumero2  := LerNumero("Digite o segundo número: ")

   nResultado := Calcular(nNumero1, nNumero2, cOperador)

   MostrarResultado(nResultado)

RETURN NIL

// Responsabilidade: ler e converter um número digitado pelo usuário
FUNCTION LerNumero(cMensagem)

   LOCAL cValor
   LOCAL nValor

   cValor := Space(20)

   QOut(cMensagem)
   ACCEPT TO cValor

   nValor := Val(StrTran(cValor, ",", "."))

RETURN nValor

// Responsabilidade: ler o operador desejado
FUNCTION LerOperador()

   LOCAL cOperador

   cOperador := Space(1)

   QOut("Digite a operação (+, -, *, /): ")
   ACCEPT TO cOperador

RETURN cOperador

// Responsabilidade: executar o cálculo, devolvendo .F. se inválido
FUNCTION Calcular(nNum1, nNum2, cOperador)

   LOCAL nResultado

   DO CASE
      CASE cOperador == "+"
         nResultado := nNum1 + nNum2

      CASE cOperador == "-"
         nResultado := nNum1 - nNum2

      CASE cOperador == "*"
         nResultado := nNum1 * nNum2

      CASE cOperador == "/"
         IF nNum2 == 0
            nResultado := .F.
         ELSE
            nResultado := nNum1 / nNum2
         ENDIF

      OTHERWISE
         nResultado := .F.
   ENDCASE

RETURN nResultado

// Responsabilidade: exibir o resultado (ou o erro) na tela
FUNCTION MostrarResultado(nResultado)

   IF HB_ISLOGICAL(nResultado)
      QOut("Erro: operação inválida ou divisão por zero.")
   ELSE
      QOut("Resultado: " + AllTrim(Str(nResultado, 10, 2)))
   ENDIF

RETURN NIL