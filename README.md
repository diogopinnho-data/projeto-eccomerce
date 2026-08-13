# Projeto Ecommerce360 - Análise de queda de receita
Análise desenvolvida para identificar fatores associados à queda da receita da empresa Ecommerce360 entre 2024 e 2025.

Meu objetivo aqui é entregar insights e recomendações que ajudarão a empresa na definição de novas estratégias.

# ‼️OBS

Antes de iniciar a leitura, quero deixar claro que utilizei IA como ferramenta de apoio na construção e revisão de consultas SQL nesse projeto. 

Acredito que o uso de IA pode contribuir de forma positiva para a agilidade e para o desenvolvimento do trabalho de um analista de dados, desde que seja utilizada como uma ferramenta, e não como o senso crítico. 

Não utilizei a ferramenta para substituir meu raciocínio ou a interpretação de análises. 

Todos os prompts utilizados podem ser conferidos aqui.

# Sumário
* Visão geral do projeto
* Visão geral da estrutura de dados
* Resumo executivo
* Aprofundamento das análises
* Minhas recomendações
* Limitações
* Ferramentas utilizadas

# Visão geral do projeto
A Ecommerce360 é uma empresa de comércio online especializada na venda de produtos e acessórios esportivos para clientes de diferentes regiões do Brasil.

Sua operação integra vendas, pagamentos, entregas, estoques e relacionamento com fornecedores. Esses processos geram dados que podem ser utilizados para acompanhar o desempenho comercial, identificar oportunidades de crescimento e antecipar riscos relacionados à receita, à experiência do cliente e à disponibilidade de produtos.

**Objetivo comercial:**
O objetivo desse projeto é explicar a queda da receita da empresa no ano de 2025, e entregar insights para apoiar a tomada de decisão da diretoria.

Os seguintes pontos foram avaliados:

* Evolução mensal da receita;
* Quantidade de pedidos entregues;
* Quantidade de unidades vendidas;
* Tamanho médio da cesta;
* Valor médio por unidade;
* Desempenho de produtos e marcas;
* Utilização de cupons e descontos;
* Cancelamentos de pedidos;
* Devoluções e reembolsos.

O banco de dados, assim como a carga de dados nele, foram desenvolvidos por mim apenas para esse projeto específico.

**A documentação técnica e os códigos utilizados nas análises estão [aqui](./scripts_sql/).**

# Estrutura dos dados

A base traz dados entre janeiro de 2024 e agosto de 2026. A análise levará em conta apenas os anos de 2024 e 2025, pois 2026 não contém dados suficientes para isso.

**Escopo:**

O banco é composto por 18 tabelas relacionadas, trazendo dados sobre:
* clientes e endereços;
* pedidos e itens vendidos;
* produtos, categorias e marcas;
* pagamentos;
* entregas;
* estoques e centros de distribuição;
* fornecedores;
* cupons e descontos;
* cancelamentos;
* devoluções e avaliações.

** Diagrama completo do banco de dados:**
<p align="center">
  <img
    src="./imagens/diagrama_erd.svg"
    alt="Diagrama de Entidade-Relacionamento da Ecommerce 360"
    width="900"
  >
</p>

<p align="center">
  <em>Diagrama completo da estrutura do banco de dados.</em>
</p>

O relacionamento central da operação ocorre entre as tabelas customers, orders, order_items e products.

Um cliente pode realizar vários pedidos. Cada pedido pode conter diversos itens, e cada item está associado a um produto do catálogo.

<p align="center">
  <img
    src="./imagens/relacionamentos_tabelas_principais.svg"
    alt="Relacionamento entre clientes, pedidos, itens e produtos"
    width="800"
  >
</p>

<p align="center">
  <em>Relacionamento central utilizado nas análises comerciais.</em>
</p>

# Resumo executivo:

A receita dos **pedidos entregues** caiu **45,5%**, passando de R$65.131,03 em 2024, para R$35.526,58 em 2025. A queda foi analisada de forma detalhada nesse projeto, deixando em evidência:
* redução de 15,5% na quantidade de pedidos entregues;
* diminuição de 34,3% no tamanho médio das cestas (principal motivo para a queda na receita, conforme análises).
* taxa de cancelamento subiu de 0,83% em 2024 para 8,77% em 2025.

<!--
print do dashboard quando estiver pronto
<p align="center">
  <img
    src="./dashboards/NOME_DO_DASHBOARD.png"
    alt="Dashboard executivo da Ecommerce 360"
    width="900"
  >
</p>

<p align="center">
  <em>Visão executiva dos principais indicadores de 2024 e 2025.</em>
</p>
-->

# Insights detalhados
**Evolução da receita:**

Considerei receita apenas pedidos entregues (status "delivered").

Ano de 2024: Receita de R$65.131,03.

Ano de 2025: Receita de R$35.526,54 --> queda de 45,5% em relação à 2024.
