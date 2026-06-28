DROP TABLE IF EXISTS order_log CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

create table customers (
    customer_id serial primary key,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    balance numeric(10,2) default 0
);

create table products (
    product_id serial primary key,
    product_name varchar(100) not null,
    price numeric(10,2) not null,
    stock_quantity int not null
);

create table orders (
    order_id serial primary key,
    customer_id int references customers(customer_id),
    order_date timestamp default current_timestamp,
    total_amount numeric(10,2) default 0
);

create table order_items (
    order_item_id serial primary key,
    order_id int references orders(order_id),
    product_id int references products(product_id),
    quantity int not null,
    price numeric(10,2) not null
);

create table order_log (
    log_id serial primary key,
    order_id int,
    customer_id int,
    action varchar(50),
    log_date timestamp default current_timestamp
);

--task 1(function)
CREATE OR REPLACE FUNCTION calculate_order_total(p_order_id int)
RETURNS numeric AS $$
DECLARE total_sum numeric;
BEGIN 
    SELECT SUM(quantity * price) INTO total_sum 
    FROM order_items 
    WHERE order_id = p_order_id;
    
    RETURN COALESCE(total_sum, 0);
END;
$$ LANGUAGE plpgsql;

--task2(procedure)
CREATE OR REPLACE PROCEDURE create_order(p_customer_id int)
LANGUAGE plpgsql AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM customers WHERE p_customer_id = customer_id) THEN
        INSERT INTO orders (customer_id, total_amount) VALUES (p_customer_id, 0);
    ELSE
        RAISE EXCEPTION 'Customer is not found(';
	END IF;
END; 
$$;
