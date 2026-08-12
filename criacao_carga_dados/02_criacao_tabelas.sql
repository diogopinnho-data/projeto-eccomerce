-- Código utilizado:

create table customers (
	customer_id serial primary key,
	first_name varchar(20) not null,
	last_name varchar(40) not null,
	email varchar(50) not null,
	cpf varchar(11) not null,
	phone varchar(20),
	birth_date date,
	created_at timestamptz not null default current_timestamp,
	updated_at timestamptz not null default current_timestamp,
	is_active boolean not null default true
);

create table address (
	address_id serial primary key,
	customer_id int not null references customers(customer_id),
	address_type varchar(10) not null check(address_type IN ('billing', 'shipping', 'both')),
	street varchar(150) not null,
	street_number varchar(20) not null,
	complement varchar(100),
	neighborhood varchar(40) not null,
	city varchar(40) not null,
	state varchar(2) not null check(length(state) = 2),
	postal_code varchar(8) not null check (length(postal_code) = 8),
	is_default boolean not null default false,
	created_at timestamptz not null default current_timestamp

);

create table category (
	category_id serial primary key,
	category_name varchar(50) unique not null,
	slug varchar(50) unique not null,
	description text,
	is_active boolean not null,
	created_at timestamptz not null default current_timestamp
);

create table brands (
	brand_id serial primary key not null,
	brand_name varchar(30) unique not null,
	origin_country varchar(30),
	is_active boolean default true not null,
	created_at timestamptz not null default current_timestamp
);

create table suppliers (
	supplier_id serial primary key,
	legal_name varchar(100) not null,
	trade_name varchar(100) not null,
	cnpj varchar(14) unique not null check (length(cnpj)=14),
	email varchar(50),
	phone varchar(20),
	city varchar(30) not null,
	state varchar(2) not null,
	is_active boolean not null default true,
	created_at timestamptz default current_timestamp
);

create table products (
	product_id serial primary key,
	sku varchar(10) unique not null,
	product_name varchar(50) not null,
	description varchar(100),
	category_id int not null references category(category_id),
	brand_id int not null references brands(brand_id),
	cost_price numeric not null check (cost_price > 0),
	sell_price numeric not null check (sell_price > 0),
	weight_kg numeric not null check (weight_kg > 0),
	is_active boolean not null default true,
	created_at timestamptz default current_timestamp,
	updated_at timestamptz default current_timestamp
);

create table product_suppliers (
	product_id int not null references products(product_id),
	supplier_id int not null references suppliers(supplier_id),
	supplier_sku varchar(50) not null,
	supplier_cost numeric(12,2) not null check (supplier_cost > 0),
	lead_time_days smallint not null check (lead_time_days > 0),
	is_primary_supplier boolean not null default false,
	created_at timestamptz not null default current_timestamp

);

create table warehouses (
	 warehouse_id serial primary key,
	 code varchar(10) unique not null,
	 name varchar(40) not null,
	 city varchar(50) not null,
	 state varchar(2) not null,
	 is_active boolean default true not null,
	 created_at timestamptz default current_timestamp not null
);

create table inventory (
	product_id int not null references products(product_id),
	warehouse_id int not null references warehouses(warehouse_id),
	quantity int not null default 1 check (quantity >= 0),
	reserved_quantity int not null default 0 check (reserved_quantity <= quantity and reserved_quantity >= 0),
	reorder_point int not null default 5 check (reorder_point >= 0),
	updated_at timestamptz default current_timestamp not null,
	PRIMARY KEY (product_id, warehouse_id)
);

create table coupons (
	coupon_id serial primary key,
	code varchar(30) not null unique,
	discount_type varchar(10) not null check (discount_type in ('percentage', 'fixed')),
	discount_value numeric(12,2) not null check (discount_value > 0),
	min_order_amount numeric(12,2) not null default 0 check (min_order_amount >= 0),
	max_discount_amount numeric(12,2) not null check (max_discount_amount > 0),
	valid_from timestamptz not null,
	valid_until timestamptz not null,
	usage_limit int check (usage_limit > 0),
	is_active boolean not null default true,
	created_at timestamptz not null default current_timestamp
);

create table orders (
	order_id serial primary key,
	customer_id int not null references customers(customer_id),
	billing_address_id int not null references address(address_id),
	shipping_address_id int not null references address(address_id),
	coupon_id int references coupons(coupon_id),
	status varchar(20) not null,
	subtotal numeric(12,2) not null check (subtotal >= 0),
	discount numeric(12,2) default 0 check (discount >= 0),
	shipping_amount numeric(12,2) not null default 0 check (shipping_amount >= 0),
	total_amount numeric(12,2) not null check (total_amount > 0),
	order_date timestamptz not null default current_timestamp,
	created_at timestamptz not null default current_timestamp,
	updated_at timestamptz not null default current_timestamp
);

alter table orders
add constraint chk_orders_status
check (
    status in (
        'pending',
        'paid',
        'processing',
        'shipped',
        'delivered',
        'cancelled',
        'returned'
    )
);

create table order_items (
	order_item_id serial primary key,
	order_id int not null references orders(order_id),
	product_id int not null references products(product_id),
	quantity int not null check (quantity > 0),
	unit_price numeric(12,2) not null check (unit_price >= 0),
	unit_cost numeric(12,2) not null check (unit_cost >= 0),
	discount_on_item numeric(12,2) not null check (discount_on_item >= 0 and discount_on_item <= unit_price) default 0,
	item_total numeric(12,2) not null check (item_total = (quantity * unit_price) - discount_on_item),
	UNIQUE (order_id, product_id)
);



create table payments (
	payment_id serial primary key,
	order_id int not null references orders(order_id),
	payment_method varchar(30) not null 
		check (payment_method in ('credit_card', 'debit_card', 'pix', 'bank_slip')),
	status varchar(20) not null
		check (status in ('pending', 'approved', 'declined', 'refunded')),
	amount numeric(12,2) not null
		check(amount >= 0),
	number_installment int not null
		check (number_installment > 0 
				and number_installment between 1 and 24),
	transaction_code varchar(20),
	payment_date timestamptz not null default current_timestamp,
	created_at timestamptz not null default current_timestamp
);

create table shipments (
	shipment_id serial primary key,
	order_id int not null references orders(order_id),
	carrier_name varchar(50) not null,
	tracking_code varchar(20) unique not null,
	status varchar(20) not null	
		check (status in ('preparing', 'shipped', 'in_transit', 'delivered', 'lost', 'returned')),
	shipping_cost numeric(12,2) not null
		check (shipping_cost >= 0) default 0,
	estimated_delivery_date timestamptz not null default (current_timestamp + interval '7 days'),
	shipped_at timestamptz,
	delivered_at timestamptz,
	created_at timestamptz not null default current_timestamp,
	check (estimated_delivery_date > created_at),
	check (delivered_at is null or shipped_at is not null and delivered_at >= shipped_at)
);

create table reviews (
	review_id serial primary key,
	order_item_id int not null unique references order_items(order_item_id),
	rating smallint not null
		check(rating >= 0 and rating <= 5),
	title varchar(20),
	comment varchar(100),
	is_approved varchar(3) not null
		check(is_approved in ('yes', 'no')),
	created_at timestamptz not null default current_timestamp
);

create table cancellations (
	cancellation_id serial primary key,
	order_id int not null references orders(order_id),
	reason text not null,
	details text,
	in_charge varchar(50) not null 
		check (in_charge in ('customer', 'store', 'system')),
	refunded_amount numeric(12,2) not null
		check (refunded_amount >= 0),
	cancellation_date timestamptz not null default current_timestamp
);

create table returns (
	return_id serial primary key,
	order_id int unique references orders(order_id),
	status varchar(20) not null
		check (status in ('requested', 'approved', 'rejected', 'received', 'refunded')),
	reason text not null,
	details text,
	total_amount numeric(12,2) not null
		check (total_amount >= 0),
	request_date timestamptz not null default current_timestamp,
	resolution_date timestamptz not null
);

create table return_items (
	return_id int not null references returns(return_id),
	order_item_id int not null unique references order_items(order_item_id),
	returned_quantity int not null 
		check (returned_quantity >= 0),
	condition varchar(20) not null 
		check (condition in ('sealed', 'opened', 'used', 'damaged')),
	returned_amount numeric(12,2) not null 
		check (returned_amount >= 0)
);
