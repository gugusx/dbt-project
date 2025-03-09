-- DB and schema Name
-- create database pos_system;
create schema global;

-- Location
create table global.location (
    location_id serial not null primary key,
    location_code varchar(10) unique,
    location_name varchar(50)
);
-- index of location
create index idx_location_code on global.location(location_code);
create index idx_location_name_pattern on global.location(location_name text_pattern_ops);


-- Type of product
create table global.product_type (
    product_type_id serial not null primary key,
    product_type_name varchar(30)
);

-- Product List
create table global.product (
    product_id serial not null primary key,
    product_code varchar(10) unique,
    product_name varchar(100),
    product_type_id int,
    price numeric(20,4),
    last_purchase_price numeric(20,4),
    constraint fk_product_type foreign key (product_type_id) references global.product_type(product_type_id)
);
-- index of product
create index idx_product_code on global.product(product_code);
create index idx_product_name_pattern on global.product(product_name text_pattern_ops);


-- Customer List
create table global.customer (
    customer_id serial not null primary key,
    customer_code varchar(10),
    customer_name varchar(100),
    email varchar(50),
    handphone varchar(20),
    address text,
    create_date timestamp
);
-- index of customer
create index idx_customer_code on global.customer(customer_code);
create index idx_customer_name_pattern on global.customer(customer_name text_pattern_ops);


-- Sales history
create table global.sales (
    sales_id serial not null primary key,
    sales_date timestamp not null,
    sales_no varchar(30),
    total_qty numeric(10,4),
    total_amount numeric(20,4),
    customer_id int,
    location_id int,
    constraint fk_customer foreign key (customer_id) references global.customer(customer_id),
    constraint fk_location foreign key (location_id) references global.location(location_id)
);
-- index of sales
create index idx_sales_no on global.sales(sales_no);
create index idx_sales_date on global.sales(sales_date);
create index idx_sales_no_pattern on global.sales(sales_no text_pattern_ops);


-- Detail sales history
create table global.sales_detail (
    sales_detail_id serial not null primary key,
    sales_id int,
    product_id int,
    qty numeric(10,4),
    sub_total numeric(20,4),
    constraint fk_sales foreign key (sales_id) references global.sales(sales_id),
    constraint fk_product foreign key (product_id) references global.product(product_id)
);