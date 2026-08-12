insert into customers(first_name, last_name, email, cpf, phone, birth_date)
values
('Diogo', 'Pinho', 'diogopinho@email.com', '12345678910', '62912345678', '2002/06/04'),
('Rafaella', 'Chadud', 'rafachadud@email.com', '27382715378', '62909365443', '2005-06-13'),
('Ademir', 'Fonseca da Silva Filho', 'adfilho@email.com', '57463526783', '62945362846', '2006/04/12');

SELECT * FROM customers;


insert into address(
	customer_id, address_type, street, street_number, neighborhood, city, state, postal_code, is_default)
values
(1, 'shipping', 'Av. Goiás', '20', 'Centro', 'Anápolis', 'GO', '75000000', True),
(2, 'shipping', 'N10', '12', 'Anápolis City', 'Anápolis', 'GO', '75001000', True),
(3, 'shipping', 'Peixoto Gomide', '20', 'Jardins', 'São Paulo', 'SP', '45000000', True);

select * from address;

insert into category(category_name, slug, description, is_active)
values
('Futebol', 'futebol', 'Produtos e acessórios para futebol, incluindo bolas, chuteiras, luvas, uniformes e equipamentos de treino.', True),
('Corrida e caminhada', 'corrida-e-caminhada', 'Calçados, roupas e acessórios desenvolvidos para corrida, caminhada e atividades ao ar livre.', True);

select * from category;

insert into brands(brand_name, origin_country, is_active)
values
('Nike', 'Estados Unidos', True),
('Adidas', 'Alemanha', True);

select * from brands;

insert into suppliers(legal_name, trade_name, cnpj, email, phone, city, state, is_active)
values 
('Vértice Distribuidora de Artigos Esportivos Ltda', 'Vértice Sports', '10456789000132', 'contato@verticesports.com.br', '11987654321', 'São Paulo', 'SP', True),
('Atlas Equipamentos e Acessórios Esportivos Ltda', 'Atlas Esportes', '28765432000109', 'vendas@atlasesportes.com.br', '31976543210', 'Belo Horizonte', 'MG', True);

select * from suppliers;

insert into products(sku, product_name, description, category_id, brand_id, cost_price, sell_price, weight_kg, is_active)
values
('FUTBOL001', 'Bola de futebol de campo', 'Bola de campo tamanho 5 com revestimento resistente à água', 2, 1, 69.90, 129.90, 0.45, true),
('CHUTFU001', 'Chuteira Society Grip', 'Chuteira para gramado sintético com solado de alta aderência', 2, 2, 139.90, 249.90, 0.70, true),
('CANFUT001', 'Caneleira Flex Guard', 'Caneleira leve com proteção rígida e ajuste elástico', 2, 1, 29.90, 59.90, 0.20, true),
('TENRUN001', 'Tênis de Corrida Sprint', 'Tênis leve com amortecimento para treinos diários', 3, 2, 189.90, 349.90, 0.60, true),
('CINRUN001', 'Cinto de Hidratação Runner', 'Cinto ajustável com suporte para garrafa e compartimento para celular', 3, 1, 39.90, 79.90, 0.25, true);

select current_database(), current_schema();
show search_path;
select table_schema, table_name
from information_schema.tables
where table_name in ('category', 'products');

select category_id, category_name
from category
order by category_id;



insert into product_suppliers(product_id, supplier_id, supplier_sku, supplier_cost, lead_time_days, is_primary_supplier)
values
(31, 1, 'VERT-BOLA-01', 65.50, 5, true),
(31, 2, 'ATLA-BOLA-01', 63.90, 8, false),
(32, 2, 'ATLA-CHUT-01', 132.50, 7, true),
(31, 1, 'VERT-CANE-01', 26.90, 4, true),
(34, 2, 'ATLA-TENIS-01', 179.90, 10, true),
(34, 1, 'VERT-TENI-01', 184.50, 6, false),
(35, 1, 'VERT-CINT-01', 35.90, 5, true);

select * from products;
select * from suppliers;
select * from product_suppliers;

update product_suppliers
set product_id = 33
where supplier_cost = 26.90;

insert into warehouses(code, name, city, state, is_active)
values
('CD-SP-01', 'Centro de Distribuição SP', 'São Paulo', 'SP', true),
('CD-GO-01', 'Centro de Distribuição GO', 'Anápolis', 'GO', true),
('CD-MG-01', 'Centro de Distribuição MG', 'Contagem', 'MG', true);

select * from warehouses;

insert into inventory(product_id, warehouse_id, quantity, reserved_quantity, reorder_point)
values
(31, 1, 120, 8, 25),
(31, 2, 65, 5, 15),
(31, 3, 40, 2, 12),
(32, 1, 80, 6, 18),
(32, 2, 45, 3, 12),
(32, 3, 30, 2, 10),
(33, 1, 150, 12, 30),
(33, 2, 90, 8, 20),
(33, 3, 60, 4, 15),
(34, 1, 70, 5, 15),
(34, 2, 50, 4, 12),
(34, 3, 35, 2, 10),
(35, 1, 110, 9, 25),
(35, 2, 75, 6, 18),
(35, 3, 55, 3, 14);

select * from inventory;

insert into coupons(code, discount_type, discount_value, min_order_amount, max_discount_amount, valid_from, valid_until, usage_limit, is_active)
values
('BEMVINDO10', 'percentage', 10.00, 80.00, 50.00, '2024-01-01 00:00:00-03', '2027-12-31 23:59:59-03', 500, true),
('ESPORTE15', 'percentage', 15.00, 150.00, 80.00, '2024-01-01 00:00:00-03', '2027-12-31 23:59:59-03', 300, true),
('CORRIDA20', 'fixed', 20.00, 120.00, 20.00, '2024-01-01 00:00:00-03', '2027-12-31 23:59:59-03', 250, true),
('FRETE25', 'fixed', 25.00, 200.00, 25.00, '2024-01-01 00:00:00-03', '2027-12-31 23:59:59-03', 200, true),
('BLACK30', 'percentage', 30.00, 250.00, 120.00, '2025-11-01 00:00:00-03', '2025-11-30 23:59:59-03', 150, false),
('VOLTA10', 'percentage', 10.00, 100.00, 40.00, '2026-01-01 00:00:00-03', '2026-12-31 23:59:59-03', 200, true);

select * from coupons;

select * from address;

alter table address
drop constraint address_address_type_check;

alter table address
add constraint address_address_type_check
check (address_type in ('billing', 'shipping', 'both'));

update address
set address_type = 'both';

select * from address;

insert into category(category_name, slug, description, is_active)
values
('Musculação', 'musculacao', 'Pesos, acessórios e equipamentos para treinos de força e condicionamento.', true),
('Natação', 'natacao', 'Roupas e acessórios para treinos, lazer e competições em piscinas.', true),
('Ciclismo', 'ciclismo', 'Acessórios e equipamentos para ciclismo urbano, estrada e trilha.', true),
('Basquete', 'basquete', 'Bolas, calçados, roupas e acessórios para a prática de basquete.', true),
('Vôlei', 'volei', 'Bolas, proteções e acessórios para vôlei de quadra e de praia.', true),
('Acessórios esportivos', 'acessorios-esportivos', 'Itens de apoio para diferentes modalidades e rotinas de treinamento.', true);

select * from category;

insert into brands(brand_name, origin_country, is_active)
values
('Puma', 'Alemanha', true),
('Asics', 'Japão', true),
('Under Armour', 'Estados Unidos', true),
('Mizuno', 'Japão', true),
('Olympikus', 'Brasil', true),
('Penalty', 'Brasil', true),
('Speedo', 'Austrália', true),
('Wilson', 'Estados Unidos', true);

select * from brands;

insert into suppliers(legal_name, trade_name, cnpj, email, phone, city, state, is_active)
values
('Sprint Comércio Atacadista de Artigos Esportivos Ltda', 'Sprint Atacado', '36543210000176', 'vendas@sprintatacado.com.br', '41987651234', 'Curitiba', 'PR', true),
('Nado Livre Distribuidora Aquática Ltda', 'Nado Livre', '47890123000145', 'comercial@nadolivre.com.br', '71986542310', 'Salvador', 'BA', true),
('Ciclo Forte Equipamentos Esportivos Ltda', 'Ciclo Forte', '52987654000108', 'pedidos@cicloforte.com.br', '51985471236', 'Porto Alegre', 'RS', true),
('Quadra Brasil Distribuição Esportiva Ltda', 'Quadra Brasil', '61345678000192', 'contato@quadrabrasil.com.br', '11983214567', 'Campinas', 'SP', true);

select * from suppliers;

insert into orders(customer_id, billing_address_id, shipping_address_id, coupon_id, status, subtotal, discount, shipping_amount, total_amount, order_date)
values
(1, 2, 2, 1, 'delivered', 244.70, 24.47, 19.90, 240.13, '2026-05-10 10:30:00-03'),
(2, 3, 3, null, 'processing', 429.80, 0.00, 0.00, 429.80, '2026-06-15 14:20:00-03'),
(3, 4, 4, 3, 'shipped', 349.70, 20.00, 24.90, 354.60, '2026-07-20 09:15:00-03'),
(7, 8, 8, null, 'cancelled', 329.60, 0.00, 19.90, 349.50, '2026-08-01 16:40:00-03')
returning order_id, customer_id, status, total_amount;

insert into order_items(order_id, product_id, quantity, unit_price, unit_cost, discount_on_item, item_total)
values
(1, 31, 1, 129.90, 69.90, 0.00, 129.90),
(1, 33, 2, 59.90, 29.90, 5.00, 114.80),
(2, 34, 1, 349.90, 189.90, 0.00, 349.90),
(2, 35, 1, 79.90, 39.90, 0.00, 79.90),
(3, 32, 1, 249.90, 139.90, 0.00, 249.90),
(3, 39, 2, 49.90, 24.90, 0.00, 99.80),
(4, 41, 2, 99.90, 54.90, 0.00, 199.80),
(4, 42, 3, 44.90, 22.90, 4.90, 129.80)
returning order_item_id, order_id, product_id, item_total;

insert into payments(order_id, payment_method, status, amount, number_installment, transaction_code, payment_date)
values
(1, 'pix', 'approved', 240.13, 1, 'TX-PED-0001', '2026-05-10 10:35:00-03'),
(2, 'credit_card', 'approved', 429.80, 3, 'TX-PED-0002', '2026-06-15 14:25:00-03'),
(3, 'debit_card', 'approved', 354.60, 1, 'TX-PED-0003', '2026-07-20 09:20:00-03'),
(4, 'credit_card', 'refunded', 349.50, 2, 'TX-PED-0004', '2026-08-01 16:45:00-03')
returning payment_id, order_id, payment_method, status, amount;

insert into shipments(order_id, carrier_name, tracking_code, status, shipping_cost, estimated_delivery_date, shipped_at, delivered_at, created_at)
values
(1, 'Jadlog', 'BR0000000001', 'delivered', 16.50, '2026-05-17 18:00:00-03', '2026-05-11 14:00:00-03', '2026-05-14 11:20:00-03', '2026-05-10 11:00:00-03'),
(2, 'Correios', 'BR0000000002', 'preparing', 18.50, '2026-06-22 18:00:00-03', null, null, '2026-06-15 15:00:00-03'),
(3, 'Total Express', 'BR0000000003', 'in_transit', 21.75, '2026-07-27 18:00:00-03', '2026-07-21 13:30:00-03', null, '2026-07-20 10:00:00-03')
returning shipment_id, order_id, carrier_name, status;

insert into reviews(order_item_id, rating, title, comment, is_approved, created_at)
values
(1, 5, 'Excelente', 'Produto de ótima qualidade e entrega realizada antes do prazo.', 'yes', '2026-05-16 15:30:00-03')
returning review_id, order_item_id, rating;

insert into cancellations(order_id, reason, details, in_charge, refunded_amount, cancellation_date)
values
(4, 'Cliente desistiu da compra', 'Cancelamento solicitado antes do início da separação dos produtos.', 'customer', 349.50, '2026-08-01 18:00:00-03')
returning cancellation_id, order_id, refunded_amount;

insert into orders(customer_id, billing_address_id, shipping_address_id, coupon_id, status, subtotal, discount, shipping_amount, total_amount, order_date)
values
(8, 9, 9, 6, 'returned', 189.70, 18.97, 19.90, 190.63, '2026-04-02 13:10:00-03')
returning order_id, customer_id, status, total_amount;

insert into order_items(order_id, product_id, quantity, unit_price, unit_cost, discount_on_item, item_total)
values
(9, 51, 1, 109.90, 59.90, 0.00, 109.90),
(9, 52, 2, 39.90, 19.90, 0.00, 79.80)
returning order_item_id, order_id, product_id, item_total;

insert into payments(order_id, payment_method, status, amount, number_installment, transaction_code, payment_date)
values
(9, 'credit_card', 'refunded', 190.63, 2, 'TX-PED-0009', '2026-04-02 13:15:00-03')
returning payment_id, order_id, status, amount;

insert into shipments(order_id, carrier_name, tracking_code, status, shipping_cost, estimated_delivery_date, shipped_at, delivered_at, created_at)
values
(9, 'Loggi', 'BR0000000009', 'returned', 17.80, '2026-04-09 18:00:00-03', '2026-04-03 10:00:00-03', '2026-04-06 14:30:00-03', '2026-04-02 14:00:00-03')
returning shipment_id, order_id, status;

insert into returns(order_id, status, reason, details, total_amount, request_date, resolution_date)
values
(9, 'refunded', 'Produto não atendeu às expectativas', 'Cliente devolveu os óculos de natação após experimentar o produto.', 109.90, '2026-04-08 10:00:00-03', '2026-04-14 16:30:00-03')
returning return_id, order_id, status, total_amount;