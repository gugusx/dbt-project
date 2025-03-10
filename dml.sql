-- Dummy data for location
insert into global.location (location_code, location_name) 
select substring(md5(random()::text), 1, 10), 
       'Location ' || generate_series(1, 10000);

-- Dummy data for product_type 
insert into global.product_type (product_type_name) 
values 
    ('Milk'),
    ('Health Equipment'),
    ('Medicine'),
    ('Others');

-- Dummy data for product
insert into global.product (product_code, product_name, product_type_id, price, last_purchase_price) 
select substring(md5(random()::text), 1, 10), 
       'Product ' || generate_series(1, 10000), 
       (select product_type_id from global.product_type order by random() limit 1), 
       random() * 500 + 10, 
       random() * 500 + 10;

-- Dummy data for customer
insert into global.customer (customer_code, customer_name, email, handphone, address, create_date) 
select substring(md5(random()::text), 1, 10), 
       'Customer ' || generate_series(1, 10000), 
       'customer' || generate_series(1, 10000) || '@example.com', 
       '0' || substring(md5(random()::text), 1, 8), 
       'Address ' || generate_series(1, 10000) || ', City, Country', 
       current_timestamp;

-- Dummy data for sales
insert into global.sales (sales_date, sales_no, total_qty, total_amount, customer_id, location_id) 
select current_timestamp, 
       'S' || generate_series(1, 10000), 
       random() * 10000 + 1, 
       random() * 5000 + 10000, 
       (select customer_id from global.customer order by random() limit 1), 
       (select location_id from global.location order by random() limit 1);

-- Dummy data for sales_detail
insert into global.sales_detail (sales_id, product_id, qty, sub_total) 
select (select sales_id from global.sales order by random() limit 1), 
       (select product_id from global.product order by random() limit 1), 
       random() * 10 + 1, 
       random() * 500 + 10
from generate_series(1, 10000);