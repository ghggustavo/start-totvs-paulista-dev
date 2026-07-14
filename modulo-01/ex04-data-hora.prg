FUNCTION Main()

   LOCAL cNome, cCidade, cCurso

   cNome   := "Gustavo Henrique Gomes"
   cCidade := "Campinas"
   cCurso  := "Harbour/ADVPL"
   
   hb_cdpSelect("PT850")
   
   QOut( "============================" )
   QOut( "   FICHA DE APRESENTAÇÃO" )
   QOut( "============================" )
   QOut( "Nome  : " + cNome )
   QOut( "Cidade: " + cCidade )
   QOut( "Curso : " + cCurso )
   QOut( "Data  : " + DToC( Date() ) )
   QOut( "Hora  : " + Time() )
   QOut( "============================" )

RETURN NIL