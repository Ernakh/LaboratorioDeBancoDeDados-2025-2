
- Controle de Estoque
Crie tabelas Produtos (com Estoque) e Vendas.
Faça um trigger em Vendas que diminua a quantidade em Produtos.

- Impedir Atualização de Preço Negativo
Em Produtos, crie um trigger AFTER UPDATE que verifique se o preço atualizado é menor que zero.
Se for, cancele a operação e exiba um erro personalizado.

-Transferência bancária
Crie um trigger em TransferenciasBancarias que verifique se a conta de origem tem saldo suficiente 
antes de permitir a transferência.

-Trigger Dinossauros
Faça uma trigger para garantir que o cadastro de um novo dinossauro esteja correto.
Cada dinossauro possui um ano de inicio e de fim (existencia), e esta vincilado a uma era.
Verifique se o tempo de existencia do dinossauro é coerente com a era informada.

-Estoque mínimo
Um sistema possui uma tabela para armazenar os registros dos PRODUTOS que comercializa, 
e tambem uma tabela de REQUISICOES que pode ser de entrada ou de saída, além da MOVIMENTACAO, 
que pode ser de entrada ou de saida - uma requisição que foi confirmada.
Faça uma trigger que gere uma nova REQUISICAO de entrada caso as requisições de saída atinjam 
mais de 70% da quantidade do item em questão em estoque.

