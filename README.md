# projeto-eccomerce
Nesse projeto, resolvo alguns problemas de negócio e faço algumas análises para melhorar a performance de uma empresa inserida no eccomerce

# Contexto e visão do projeto
A Ecommerce 360 é uma empresa de comércio online especializada na venda de produtos e acessórios esportivos para clientes de diferentes regiões do Brasil. Sua operação integra vendas, pagamentos, entregas, estoques e relacionamento com fornecedores, gerando dados que podem apoiar decisões comerciais e operacionais.
Com o crescimento da operação da empresa, foi necessário juntar essas informações em uma visão analítica, acompanhando o desempenho da empresa, identificar oportunidades de crescimento e antecipar **riscos** relacionados à **rentabilidade**, **experiência do cliente** e à **disponibilidade de produtos**.
Este projeto analisa os dados da Ecommerce360 entre janeiro de 2024 e agosto de 2026. A base reúne 240 pedidos, 600 itens vendidos, 50 clientes, 40 produtos, 8 categorias, 10 marcas, 3 centros de distribuição e 6 fornecedores.
# O objetivo do projeto
O objetivo aqui é transformar esses dados em informações úteis para apoiar decisões relacionadas a:
* evolução das vendas, do ticket médio e da margem bruta;
* desempenho de produtos, categorias e marcas;
* comportamento, recorrência e distribuição geográfica dos clientes;
* utilização de cupons e desempenho das formas de pagamento;
* satisfação dos clientes, devoluções e cancelamentos;
* cobertura de estoque, necessidade de reposição e dependência de fornecedores.

O banco de dados, assim como todos os registros dentro dele, foram desenvolvidos por mim.

Você pode acessar todos os scripts [aqui](./scripts/sql/).

Você pode acessar os dashboards desenvolvidos [aqui](./dashboards/).

# Estrutura do banco de dados
O banco de dados é composto por 18 tabelas, relacionadas entre si, abrangendo:
* clientes
* pedidos
* produtos
* pagamentos
* entregas
* estoque
* fornecedores

Você pode ver o diagrama ERD completo [aqui](./imagens/diagrama_erd.svg).

A estrutura foi desenvolvida para integrar áreas diferentes dentro da operação, usando chaves primárias e estrangeiras para preservar a consistência. O banco possui 20 relacionamentos, permitindo acompanhar toda a jornada de um pedido de venda, desde o cadastro do cliente até a entrega ou eventual cancelamento ou devolução.

O principal relacionamento aqui é entre as tabelas customers, orders, order_items e products, permitindo um cliente realizar vários pedidos, e cada pedido podendo conter diversos itens, que estarão associados a um produto.
<p align="center">
  <img
    src="./imagens/relacionamentos_tabelas_principais.svg"
    alt="Relacionamento central das vendas"
    width="800"
  >
</p>

# 📈 Resumo executivo
**Hipóteses descartadas**:
* Queda na receita de forma brusca;
* Problemas em relação à quantidade de pedidos de clientes

**Sobre a receita:**

Com as análises, percebemos que a queda na receita não aconteceu de forma brusca, mas que o ano de 2025 perde em todos os meses na receita gerada para o ano de 2024.

**Sobre a quantidade de pedidos**:

Os dois anos possuem uma quantidade parecida de pedidos (121 em 2024 e 114 em 2025), descartando a hipótese de problemas na quantidade de compras em 2025.

**Sobre a quantidade de unidades vendidas de cada produto, em cada ano**:

Assim como o esperado, o ano de 2024 teve mais unidades vendidas de cada um dos produtos, quando comparado ao ano de 2025. Isso mostra então que a diminuição da receita se deve não somente à diminuição das vendas de um item só, mas sim de vários (quase todos).

**Sobre o ticket médio mensal em cada ano:**

O ticket médio mensal de 2024 mostrou ser bem maior quando comparado ao ano de 2025, deixando o valor de cada compra menor. Isso deixa claro que o problema da receita diminuir pode estar atrelado ao tamanho das cestas dos clientes durante o tempo. Podemos comprovar isso com a quantidade média de produtos por cesta nos dois anos.

