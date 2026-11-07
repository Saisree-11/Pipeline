CREATE DATABASE retail_sales_db;
USE retail_sales_db;

CREATE TABLE dim_customer (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);
INSERT INTO dim_customer VALUES
('C101','Rahul','Hyderabad'),
('C102','Priya','Bangalore'),
('C103','Amit','Chennai');
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);
INSERT INTO dim_product VALUES
('P101','Laptop',50000),
('P102','Mobile',20000),
('P103','Headphones',2000),
('P104','Keyboard',1500);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    sales_amount DECIMAL(10,2),
    order_date DATE,

    FOREIGN KEY(customer_id)
    REFERENCES dim_customer(customer_id),

    FOREIGN KEY(product_id)
    REFERENCES dim_product(product_id)
);
INSERT INTO orders VALUES
('O101','C101','P101',1,50000,'2026-11-01'),
('O102','C102','P102',2,40000,'2026-11-02'),
('O103','C103','P103',3,6000,'2026-11-03'),
('O104','C101','P104',2,3000,'2026-11-04');

SELECT * FROM dim_customer;
SELECT * FROM dim_product;
SELECT * FROM orders;

SELECT
    f.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.price,
    f.quantity,
    f.sales_amount,
    f.order_date
FROM orders f
JOIN dim_customer c
ON f.customer_id = c.customer_id
JOIN dim_product p
ON f.product_id = p.product_id;

SELECT
    SUM(sales_amount) AS total_revenue
FROM fact_sales;


SELECT
    c.customer_name,
    SUM(f.sales_amount) AS revenue
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name;


SELECT
    c.customer_name,
    SUM(f.sales_amount) revenue
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 1;


SELECT
    p.product_name,
    SUM(f.sales_amount) revenue
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.product_name;

SELECT
    p.product_name,
    SUM(f.quantity) total_quantity
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;


SELECT
    order_date,
    SUM(sales_amount) revenue
FROM fact_sales
GROUP BY order_date
ORDER BY order_date;

SELECT
    AVG(sales_amount) AS average_order_value
FROM fact_sales;

SELECT *
FROM fact_sales
WHERE status='Delivered';

SELECT *
FROM fact_sales
WHERE status='Pending';


SELECT
    customer_id,
    COUNT(*) total_orders
FROM fact_sales
GROUP BY customer_id;

SELECT
    c.customer_name,
    COUNT(f.order_id) total_orders
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name;

SELECT
    c.city,
    SUM(f.sales_amount) revenue
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.city;
