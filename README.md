# projeto-eccomerce
Nesse projeto, resolvo alguns problemas de negócio e faço algumas análises para melhorar a performance de uma empresa inserida no eccomerce

# Contexto e visão do projeto
A Ecommerce 360 é uma empresa de comércio online especializada na venda de produtos e acessórios esportivos para clientes de diferentes regiões do Brasil. Sua operação integra vendas, pagamentos, entregas, estoques e relacionamento com fornecedores, gerando dados que podem apoiar decisões comerciais e operacionais.
Com o crescimento da operação da empresa, foi necessário juntar essas informações em uma visão analítica, acompanhando o desempenho da empresa, identificar oportunidades de crescimento e antecipar **riscos** relacionados à **rentabilidade**, **experiência do cliente** e à **disponibilidade de produtos**.
Este projeto analisa os dados da Ecommerce360 entre janeiro de 2024 e agosto de 2026. A base reúne 240 pedidos, 600 itens vendidos, 50 clientes, 40 produtos, 8 categorias, 10 marcas, 3 centros de distribuição e 6 fornecedores.
# 🎯O objetivo do projeto
A empresa identificou uma redução na receita anual entre 2024 e 2025. O objetivo desse projeto é investigar o motivo dessa redução, gerando insights para a diretoria de forma objetiva e estruturada. Os fatores analisados serão:
* Evolução mensal da receita;
* Quantidade de pedidos entregues;
* Ticket médio mensal;
* Quantidade de unidades vendidas;
* Média de unidades por pedido;
* Desempenho de produtos, marcas e categorias;
* Utilização de cupons e descontos;
* Comportamento dos clientes e regiões;
* Cancelamentos, devoluções e reembolsos.

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

# Análise
**Principais insights identificados:**:
* A queda da receita não aconteceu de forma isolada. Em 2025 a receita ficou abaixo de 2024 em todos os meses;
* A quantidade de pedidos entregues nos dois anos foi quase a mesma, descartando a ideia de que a quantidade de pedidos foi o principal motivo para a receita cair;
* O tamanho médio da cesta dos clientes caiu 34.3% (média de 5.98 unidades por pedido em 2024 e 3.93 em 2025), mostrando que esse pode ser o motivo que estamos procurando para uma receita prejudicada em 2025;
* A recuperação das vendas das marcas Puma, Penalty, Adidas e Nike são prioridade, já que elas juntas representaram 64,2% da receita perdida no ano de 2025.

**Sobre a receita:**

Percebi uma diferença grande na receita quando comparei os anos de 2024 e 2025, sendo que:
* Receita 2024: R$65.131,03
* Receita 2025:R$35.526,58

Com as análises, fica claro que a queda na receita não aconteceu de forma brusca, mas que o ano de 2025 perde em todos os meses na receita gerada para o ano de 2024.

**Sobre a quantidade de pedidos**:

Os dois anos possuem uma quantidade parecida de pedidos entregues (84 em 2024 e 71 em 2025), praticamente descartando a hipótese de problemas na quantidade de compras em 2025.

**Sobre a quantidade de unidades vendidas de cada produto, em cada ano**:

Assim como o esperado, o ano de 2024 teve mais unidades vendidas de cada um dos produtos, quando comparado ao ano de 2025. Isso mostra então que a diminuição da receita se deve não somente à diminuição das vendas de um item só, mas sim de vários (quase todos).

**Sobre a quantidade de produtos por pedidos em cada ano:**

Com algumas análises, percebe-se que a quantidade de produtos por pedido em 2024 era de 5.98, e caiu para 3.93 em 2025. Isso comprova que o problema, ao invés de estar na quantidade de pedidos, pode estar na quantidade de produtos em cada um dos pedidos, já que os clientes continuam comprando, mas em quantidades reduzidas.

<p align="center">
  <img
    src="./imagens/media_produtos_por_cesta.png"
    alt="Comparação tamanho das cestas"
    width="300"
  >
</p>

<p align="center">
  <em>Comparação do tamanho das cestas em 2024 e 2025.</em>
</p>

**Sobre o valor médio por unidade vendida:**

É fundamental entender se o tamanho das cestas foi o único responsável pela queda na receita em 2025. Após verificar o valor médio por unidade vendida, percebe-se que o valor em 2024 foi de R$132,84 em média, e em 2025 foi de R$129,37, mostrando que esse não foi um fator prejudicial para o nosso problema de receita.

**Sobre o desempenho de produtos e marcas:**

Todos os produtos registraram uma queda, quando comparamos 2025 com 2024; o que era esperado, já que já foi comprovado que a receita total caiu. 

Dos 40 produtos, 37 perderam receita e somente 3 apresentaram crescimento nas vendas. Isso mostra que essa redução na receita aconteceu de forma generalizada, em praticamente todos os produtos.

As unidades vendidas caíram de 502 em 2024 para 279 em 2025 (redução de 44%). Nesse mesmo período, a receita dos itens passou de R$66.684,21 para R$36.094,87, queda de 45.9%.

A redução atingiu quase todos os produtos, mas 5 deles se destacaram, sendo responsáveis por 38,56% da queda da receita, quando somados. Esses produtos tiveram valores semelhantes por unidades nos dois anos, e isso mostra que a perda na receita foi provocada pela redução das quantidades.

As marcas também apresentam um comportamento semelhante, onde todas perderam receita no ano de 2025, mas que 4 marcas são responsáveis por uma grande parte da receita perdida (64,2%).

A Puma teve o maior impacto, com queda de R$5.925,43 na receita.

Os resultados mostraram mais uma vez que a queda foi generalizada, e não individualizada. Também nos dão um insight de que a empresa pode dar mais prioridade para recuperar marcas como Puma, Penalty, Adidas e Nike.

**Sobre utilização de cupons de descontos nos dois anos:**

Os dois anos mostraram uma quantidade parecida de uso de cupons de desconto (37 em 2024 e 31 em 2025), o que de cara já nos fala que esse fator não teve tanto impacto na receita.

O total concedido em descontos:
* 2024: R$1.677,68, com impacto de 2,51% na receita gerada no ano;
* 2025: R$1.325,49, com impacto de 3,6% na receita gerada no ano.

