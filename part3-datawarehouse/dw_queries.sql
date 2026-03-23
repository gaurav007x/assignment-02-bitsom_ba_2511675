
-- Q1
SELECT 
    d.year,
    d.month,
    p.category,
    SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_date d 
    ON f.date_id = d.date_id
JOIN dim_product p 
    ON f.product_key = p.product_key
GROUP BY d.year, d.month, p.category
ORDER BY d.year, d.month, p.category;


-- Q2
SELECT 
    s.store_name,
    SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_store s 
    ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_revenue DESC
LIMIT 2;


-- Q3
SELECT 
    d.year,
    d.month,
    SUM(f.revenue) AS current_month_revenue,
    
    LAG(SUM(f.revenue)) OVER (ORDER BY d.year, d.month) AS previous_month_revenue,
    
    ROUND(
        (
            SUM(f.revenue) 
            - LAG(SUM(f.revenue)) OVER (ORDER BY d.year, d.month)
        ) 
        / LAG(SUM(f.revenue)) OVER (ORDER BY d.year, d.month) * 100,
    2) AS growth_percentage

FROM fact_sales f
JOIN dim_date d 
    ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;