SET PROCEDURE TO matematica.prg

FUNCTION Main()

   hb_cdpSelect("PT850")

   TestarFatorial()
   TestarPrimo()
   TestarMDC()
   TestarMMC()

RETURN NIL

FUNCTION TestarFatorial()

   QOut("Fatorial de 5: " + AllTrim(Str(FatorialN(5))))

RETURN NIL

FUNCTION TestarPrimo()

   QOut("7 é primo? " + IIf(EhPrimo(7), "Sim", "Não"))
   QOut("8 é primo? " + IIf(EhPrimo(8), "Sim", "Não"))

RETURN NIL

FUNCTION TestarMDC()

   QOut("MDC(24, 36): " + AllTrim(Str(MDC(24, 36))))

RETURN NIL

FUNCTION TestarMMC()

   QOut("MMC(4, 6): " + AllTrim(Str(MMC(4, 6))))

RETURN NIL