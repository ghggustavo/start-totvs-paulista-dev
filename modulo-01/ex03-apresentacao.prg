// apresentacao.prg
//Outra alternativa seria usar isso na hora de compilar
// hbmk2 .\apresentacao.prg -cp=UTF8
//.\apresentacao.exe

FUNCTION Main()

   LOCAL cNome, cCidade, cCurso

   cNome   := "Gustavo Henrique Gomes"
   cCidade := "Campinas"
   cCurso  := "Harbour/ADVPL"
   
   hb_cdpSelect("PT850")
   
   QOut( "============================" )
   QOut( "   FICHA DE APRESENTA€ÇO" )
   QOut( "============================" )
   QOut( "Nome  : " + cNome )
   QOut( "Cidade: " + cCidade )
   QOut( "Curso : " + cCurso )
   QOut( "============================" )

RETURN NIL