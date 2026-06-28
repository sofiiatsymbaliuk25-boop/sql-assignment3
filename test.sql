INSERT INTO customers (full_name, email, balance) VALUES 
('John Smith', 'john.smith@example.com', 150.00),
('Anna Brown', 'anna.brown@example.com', 300.00),
('Michael Johnson', 'michael.johnson@example.com', 75.50),
('Kate Wilson', 'kate.wilson@example.com', 500.00);

INSERT INTO products (product_name, price, stock_quantity) VALUES 
('Laptop', 1200.00, 10),
('Mouse', 25.00, 100),
('Keyboard', 70.00, 50),
('Monitor', 250.00, 20),
('USB-C Cable', 15.00, 200);

-- task 1 and 2 test
CALL create_order(1); 
CALL create_order(2);
CALL create_order(3);

SELECT * FROM orders;

--task 3
CALL add_product_to_order(1, 1, 1);
CALL add_product_to_order(1, 2, 2);
UPDATE orders SET total_amount = calculate_order_total(1) WHERE order_id = 1;

CALL add_product_to_order(2, 3, 1);
CALL add_product_to_order(2, 5, 3);
UPDATE orders SET total_amount = calculate_order_total(2) WHERE order_id = 2;

CALL add_product_to_order(3, 4, 2);
UPDATE orders SET total_amount = calculate_order_total(3) WHERE order_id = 3;

--task 5
SELECT * FROM order_log;

--
SELECT 
    o.order_id, 
    c.full_name, 
    o.total_amount, 
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;