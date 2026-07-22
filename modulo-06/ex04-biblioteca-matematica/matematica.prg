// Biblioteca de funções matemáticas reutilizáveis
FUNCTION FatorialN(nN)

   LOCAL nResultado
   LOCAL nContador

   nResultado := 1
   nContador  := 1

   DO WHILE nContador <= nN
      nResultado := nResultado * nContador
      nContador++
   ENDDO

RETURN nResultado

FUNCTION EhPrimo(nN)

   LOCAL lPrimo
   LOCAL nContador

   IF nN < 2
      RETURN .F.
   ENDIF

   lPrimo    := .T.
   nContador := 2

   DO WHILE nContador < nN .AND. lPrimo

      IF nN % nContador == 0
         lPrimo := .F.
      ENDIF

      nContador++
   ENDDO

RETURN lPrimo

FUNCTION MDC(nA, nB)

   LOCAL nResto

   DO WHILE nB != 0
      nResto := nA % nB
      nA     := nB
      nB     := nResto
   ENDDO

RETURN nA

FUNCTION MMC(nA, nB)

   LOCAL nResultado

   nResultado := (nA * nB) / MDC(nA, nB)

RETURN nResultado