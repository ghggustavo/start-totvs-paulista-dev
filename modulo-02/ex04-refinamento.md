 Exercício 4 — Refinamento sucessivo

Problema: um sistema de caixa de supermercado deve registrar os itens de uma compra, calcular o subtotal, aplicar desconto se o cliente tiver cartão fidelidade (5%) e mostrar o total a pagar.

 Nível 1 (visão geral)
1. Registrar itens da compra
2. Calcular total
3. Verificar e aplicar desconto (caso tenha cartão fidelidade)
4. Mostrar valor total a pagar

 Nível 2 (detalhado)

1. Registrar itens**
Repita: leia código/preço do item, adicione à lista, pergunte se há mais itens

2. Calcular total**
Total = soma de todos os preços dos itens registrados

3. Verificar e aplicar desconto**
Leia se cliente tem cartão fidelidade (Sim/Não)
- Se Sim: total = subtotal * 0.95
- Se Não: total = subtotal

4. Mostrar valor total**
Escreva total