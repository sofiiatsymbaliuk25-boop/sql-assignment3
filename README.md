# sql-assignment3

There is a creation of 5 tables customers, products, orders, order_items, order_log. 

1. Task1 (Function creation - calculate_order_total()) - what calculates the total cost of the order.
2. Task2 (Procedure creation - create_order()) - what creates a new order for customer, if he exists.
3. Task3 (Procedure: Add Product to Order - add_product_to_order()) - what adds product to order, previously checks if product is available, automatically decrease the product quantity (stock_quantity). 
4. Task5 (Trigger: Order Audit Log - trigger_log_order_creation()) - after new order was created, it writes a record into order_log.

1. Task1: Function takes and calculates actual sum of (quantity * price) fow all the rows with index order_id. If the order is empty, it returns 0(COALESCE using)
2. Task2: if the customer does not exist, so the procedure calls an exception. Generally it just creates a new order record into orders table.
3. Task3: Procedure checks quantity of the product if it is bigger than 0 and it`s availability on stock. It updates the product_stock and inserts a product into order_items table.
4. Task5: Trigger executes only if the new row into orders table was inserted. 

