
-- Q1

SELECT 
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;



-- Q2

SELECT 
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_order_value
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_order_value DESC
LIMIT 3;



-- Q3

select distinct p.product_name
from read_csv_auto('datasets/customers.csv') c
left join read_json_auto('datasets/orders.json') o 
ON c.customer_id = o.customer_id
left join read_parquet('datasets/products.parquet') p 
ON o.order_id = p.order_id
where c.city = 'Bangalore';



-- Q4


select c.name as customer_name, o.order_date, p.product_name, p.quantity
from read_csv_auto('datasets/customers.csv') c
left join read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
left join read_parquet('datasets/products.parquet') p
ON o.order_id = p.order_id;