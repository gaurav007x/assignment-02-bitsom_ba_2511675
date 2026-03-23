CREATE TABLE dim_date (
    date_id     INT PRIMARY KEY,
    full_date   DATE         NOT NULL,
    day         INT          NOT NULL,
    month       INT          NOT NULL,
    month_name  VARCHAR(20)  NOT NULL,
    quarter     INT          NOT NULL,
    year        INT          NOT NULL
);

CREATE TABLE dim_store (
    store_id    INT PRIMARY KEY,
    store_name  VARCHAR(100) NOT NULL,
    store_city  VARCHAR(50)  NOT NULL
);

CREATE TABLE dim_product (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category     VARCHAR(50)  NOT NULL,
    unit_price   DECIMAL(10,2) NOT NULL
);

CREATE TABLE fact_sales (
    sale_id        INT PRIMARY KEY,
    date_id        INT NOT NULL,
    store_id       INT NOT NULL,
    product_id     INT NOT NULL,
    customer_id    VARCHAR(10) NOT NULL,
    units_sold     INT          NOT NULL,
    unit_price     DECIMAL(10,2) NOT NULL,
    total_revenue  DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (date_id)    REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id)   REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ─────────────────────────────────────────────
-- INSERT: dim_date
-- ─────────────────────────────────────────────
INSERT INTO dim_date VALUES (20230101,'2023-01-01',1,1,'January',1,2023);
INSERT INTO dim_date VALUES (20230115,'2023-01-15',15,1,'January',1,2023);
INSERT INTO dim_date VALUES (20230205,'2023-02-05',5,2,'February',1,2023);
INSERT INTO dim_date VALUES (20230331,'2023-03-31',31,3,'March',1,2023);
INSERT INTO dim_date VALUES (20230521,'2023-05-21',21,5,'May',2,2023);
INSERT INTO dim_date VALUES (20230604,'2023-06-04',4,6,'June',2,2023);
INSERT INTO dim_date VALUES (20230801,'2023-08-01',1,8,'August',3,2023);
INSERT INTO dim_date VALUES (20230809,'2023-08-09',9,8,'August',3,2023);
INSERT INTO dim_date VALUES (20231026,'2023-10-26',26,10,'October',4,2023);
INSERT INTO dim_date VALUES (20231208,'2023-12-08',8,12,'December',4,2023);

-- ─────────────────────────────────────────────
-- INSERT: dim_store
-- ─────────────────────────────────────────────
INSERT INTO dim_store VALUES (1, 'Chennai Anna',   'Chennai');
INSERT INTO dim_store VALUES (2, 'Bangalore MG',   'Bangalore');
INSERT INTO dim_store VALUES (3, 'Mumbai Central', 'Mumbai');
INSERT INTO dim_store VALUES (4, 'Delhi South',    'Delhi');
INSERT INTO dim_store VALUES (5, 'Pune FC Road',   'Pune');

-- ─────────────────────────────────────────────
-- INSERT: dim_product (cleaned — category standardized to Title Case)
-- ─────────────────────────────────────────────
INSERT INTO dim_product VALUES (1, 'Speaker',     'Electronics', 49262.78);
INSERT INTO dim_product VALUES (2, 'Tablet',      'Electronics', 23226.12);
INSERT INTO dim_product VALUES (3, 'Phone',       'Electronics', 48703.39);
INSERT INTO dim_product VALUES (4, 'Smartwatch',  'Electronics', 58851.01);
INSERT INTO dim_product VALUES (5, 'Atta 10kg',   'Grocery',     52464.00);
INSERT INTO dim_product VALUES (6, 'Jeans',       'Clothing',     2317.47);
INSERT INTO dim_product VALUES (7, 'Laptop',      'Electronics', 42343.15);
INSERT INTO dim_product VALUES (8, 'Headphones',  'Electronics', 39854.96);
INSERT INTO dim_product VALUES (9, 'Jacket',      'Clothing',    30187.24);
INSERT INTO dim_product VALUES (10,'Biscuits',    'Grocery',     27469.99);

-- ─────────────────────────────────────────────
-- INSERT: fact_sales (10+ cleaned rows from retail_transactions.csv)
-- Cleaning applied: dates standardized, NULL cities replaced with known store city,
-- category casing normalized
-- ─────────────────────────────────────────────
INSERT INTO fact_sales VALUES (1,  20230101, 2, 1,  'CUST010', 20, 49262.78, 985255.60);
INSERT INTO fact_sales VALUES (2,  20230115, 1, 4,  'CUST004', 10, 58851.01, 588510.10);
INSERT INTO fact_sales VALUES (3,  20230205, 1, 3,  'CUST019', 20, 48703.39, 974067.80);
INSERT INTO fact_sales VALUES (4,  20230331, 5, 4,  'CUST025',  6, 58851.01, 353106.06);
INSERT INTO fact_sales VALUES (5,  20230521, 2, 7,  'CUST044', 13, 42343.15, 550461.00);
INSERT INTO fact_sales VALUES (6,  20230604, 1, 9,  'CUST031', 15, 30187.24, 452808.60);
INSERT INTO fact_sales VALUES (7,  20230801, 3, 6,  'CUST035', 11, 35451.81, 389969.91);
INSERT INTO fact_sales VALUES (8,  20230809, 2, 5,  'CUST027', 12, 52464.00, 629568.00);
INSERT INTO fact_sales VALUES (9,  20231026, 5, 6,  'CUST041', 16,  2317.47,  37079.52);
INSERT INTO fact_sales VALUES (10, 20231208, 2, 10, 'CUST030',  9, 27469.99, 247229.91);
INSERT INTO fact_sales VALUES (11, 20230205, 2, 1,  'CUST006', 16, 49262.78, 788204.48);
INSERT INTO fact_sales VALUES (12, 20230115, 3, 8,  'CUST015', 15, 39854.96, 597824.40);