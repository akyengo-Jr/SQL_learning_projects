-- Count the total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Calculate the average price of all products in the orders table
SELECT AVG(price) AS average_price FROM orders;

-- Find the maximum and minimum price in the orders table
SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM orders;

-- Calculate the total quantity of all items ordered
SELECT SUM(quantity) AS total_quantity FROM orders;
