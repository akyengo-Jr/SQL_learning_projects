-- Select all orders placed after '2025-04-05'
SELECT * FROM orders WHERE order_date > '2025-04-05';

-- Select customers located in 'London'
SELECT * FROM customers WHERE city = 'London';

-- Select orders for 'Laptop' with a price greater than 1200
SELECT * FROM orders WHERE product_name = 'Laptop' AND price > 1200;

-- Select the top 5 most recent orders
SELECT * FROM orders ORDER BY order_date DESC LIMIT 5;

-- Select customers from 'UK' ordered alphabetically by name
SELECT * FROM customers WHERE country = 'UK' ORDER BY name ASC;
