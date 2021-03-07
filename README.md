# garrafas

Desafio criado com linguagem em Dart, usando Android Studio.
Ao iniciar o aplicativo, aparecerá dois campos onde deve ser digitado de acordo com o exemplo abaixo:

Dado a quantidade de litros de um galão que é igual a 5L, e tenho 2 garrafas uma com 1L, outra com 4.5L.
  
  No campo ‘Litros’, escreve-se a quantidade de garrafas que tenho para encher o galão, separando por vírgulas. Ex.: 4.5, 1

  No campo ‘Galão’, escreve-se a quantidade que o galão suporta, ex.: 5

Na segunda tela será exibido o resultado e a sobra caso a quantidade de litros que tenho, for maior do que o galão suporta.
  Ex.:    Resposta: [4.5, 1]; Sobra: 1.5L
  
  Lógica usada para resolver o algoritmo:
  Após recuperar o valor digitado pelo usuário no campo 'Litros', transformei ele em lista usando a função split e quebrando por vírgulas. Depois ordenei a lista do maior para o menor.
  Percorri a lista ordenada pegando cada valor da iteração e verificando se poderia encher o galão, esvaziando a 'garrafa' totalmente, caso não conseguisse eu armazenava o valor em uma variável para usar no final, caso precisasse ter sobra.
