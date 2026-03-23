## Anomaly Analysis

Insert Anomaly:
New customers or sales reps cannot be inserted without creating an order.

For this, lets say we need to add a new product, it cannot be directly inserted without either using nulls at order_id, sales_rep_id and customer_id or creating a fake order

Update Anomaly:
Customer and sales rep attributes are repeated across rows. Updating one row may cause inconsistency.
Since multiple customers can order from multiple sales_reps, those data points are duplicated at multiple points. Lets say a customer wants to update the email address, hence it must be updated everywhere.
sales_rep_id SR01 has multiple office addresses. 

Delete Anomaly:
Deleting an order may remove product or sales rep information entirely.
There is only one order for product P008, if we remove order id ORD1185 this will remove the product information entirely.

## Normalization Justification

At first glance, keeping everything in a single table does seem simpler. It’s easy to understand and quick to work with when the dataset is small. However, once we look at real-world usage, this approach starts to create more problems than it solves. The orders_flat.csv dataset is a good example of this.

For instance, the same customer shows up multiple times in the data. Take customer_id = CUST048, which appears in several orders like ORD2011, ORD2014, and ORD2069. Along with it, details such as name, email, and city are repeated again and again. If this customer moves to a new city, we would have to update every single row. If even one row is missed, the data becomes inconsistent.

The same issue exists with products. Information like product name, category, and price is repeated for every order. If a product’s price changes, multiple rows need updating, which increases the chance of mistakes. Also, if the only order for a product is deleted, all details about that product are lost.

Normalization solves these problems by splitting the data into separate tables like Customers, Products, and Orders. Each piece of information is stored once and linked using keys. While a single table may look simpler initially, it leads to duplication and maintenance issues over time. So, normalization isn’t over-engineering—it’s a practical way to keep data clean, consistent, and reliable.