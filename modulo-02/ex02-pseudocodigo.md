# Exercício 2 — Pseudocódigo

 a. Calcular a área de um retângulo

\`\`\`portugol
algoritmo "area_retangulo"
var
   base, altura, area: real
inicio
   escreva("Digite a base: ")
   leia(base)
   escreva("Digite a altura: ")
   leia(altura)
   area <- base * altura
   escreva("A área é: ", area)
fimalgoritmo
\`\`\`

 b. Verificar se um número é par ou ímpar

\`\`\`portugol
algoritmo "par_impar"
var
   numero, resto: inteiro
inicio
   escreva("Digite um número: ")
   leia(numero)
   resto <- numero % 2
   se (resto = 0) entao
      escreva("par")
   senao
      escreva("ímpar")
   fimse
fimalgoritmo
\`\`\`

 c. Encontrar o maior entre três números

\`\`\`portugol
algoritmo "maior_de_tres"
var
   a, b, c, maior: real
inicio
   escreva("Digite três números: ")
   leia(a, b, c)

   se (a > b) entao
      se (a > c) entao
         maior <- a
      senao
         maior <- c
      fimse
   senao
      se (b > c) entao
         maior <- b
      senao
         maior <- c
      fimse
   fimse

   escreva("O maior é: ", maior)
fimalgoritmo
\`\`\`