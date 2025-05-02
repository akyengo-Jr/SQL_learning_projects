# SQL Beginner Project: Analyzing Customer Purchase Data

## Project Goal

To learn fundamental SQL concepts for data analysis by exploring customer purchase data. This project will cover basic querying, filtering, sorting, aggregation, and grouping to gain insights into customer behavior and popular products.

## Prerequisites

1.  **SQL Database:** You'll need access to a SQL database. SQLite is a great beginner-friendly option that doesn't require a server setup. You can download a SQLite browser (e.g., DB Browser for SQLite).
2.  **Understanding of Relational Databases:** A basic understanding of tables, columns, and rows is helpful.
3.  **Text Editor:** To write and save your SQL queries (e.g., VS Code, Notepad++, Sublime Text).

## Project Steps

1.  **Set up your Database:**
    * Open your SQLite browser (or your chosen SQL tool).
    * Create a new database file (e.g., `customer_analysis.db`).
    * Create two tables: `customers` and `orders`.

2.  **Create Table Schemas:**

    **`customers` table:**

    ```sql
    CREATE TABLE customers (
        customer_id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        city TEXT,
        country TEXT
    );
    ```

    **`orders` table:**

    ```sql
    CREATE TABLE orders (
        order_id INTEGER PRIMARY KEY,
        customer_id INTEGER,
        order_date DATE,
        product_name TEXT,
        quantity INTEGER,
        price REAL,
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );
    ```

3.  **Import Data:**
    * Use the import functionality of your SQL browser to import the `customers.csv` and `orders.csv` files into their respective tables. Make sure to match the column order and data types.

4.  **Write and Execute SQL Queries:**
    * Navigate to the `queries/` folder.
    * Open each `.sql` file and write the queries as described below.
    * Execute these queries in your SQL browser and observe the results.

5.  **Analyze Results and Draw Conclusions:**
    * After running each query, think about what the results tell you about the data. For example, which products are most frequently ordered? Which countries have the most customers?

## SQL Queries to Practice

**`queries/basic_selection.sql`:**

```sql
-- Select all columns from the customers table
SELECT * FROM customers;

-- Select only the name and email columns from the customers table
SELECT name, email FROM customers;

-- Select the order_id, product_name, and price from the orders table
SELECT order_id, product_name, price FROM orders;
