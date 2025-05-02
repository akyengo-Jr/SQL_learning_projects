-- Count the number of orders for each product
SELECT product_name, COUNT(*) AS number_of_orders
FROM orders
GROUP BY product_name;

-- Calculate the total revenue for each product
SELECT product_name, SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY product_name
ORDER BY total_revenue DESC;

-- Count the number of customers in each country
SELECT country, COUNT(*) AS number_of_customers
FROM customers
GROUP BY country
ORDER BY number_of_customers DESC;

-- Find the average order value for each customer
SELECT c.name, AVG(o.quantity * o.price) AS average_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY average_order_value DESC;
