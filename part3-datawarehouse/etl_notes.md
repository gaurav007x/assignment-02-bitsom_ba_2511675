## ETL Decisions
### Decision 1 — Standardizing Date Formats

Problem:
The dataset had dates stored in different formats like 01-02-2023, 2023/02/01, and Feb 1, 2023. This creates confusion when working with the data, especially for tasks like calculating monthly sales or trends, because the system can’t reliably interpret mixed formats.

Resolution:
To fix this, all dates were converted into a single standard format (YYYY-MM-DD). I also extracted the year and month from each date and stored them separately in the dim_date table. This made it much easier to run time-based queries and ensured consistent results across reports.

### Decision 2 — Handling Missing and Null Values

Problem:
Some records had missing values in important fields like product_category and store_id. If left as they were, these NULL values could cause issues during joins or lead to incorrect totals in reports.

Resolution:
For missing categories, I used a default value like 'Unknown' to avoid losing those records during analysis. For missing store_id, I either corrected the data using available context or removed the records if they couldn’t be reliably fixed. This helped maintain data accuracy and ensured smooth joins with dimension tables.

### Decision 3 — Standardizing Category Values

Problem:
The product_category field had inconsistent naming, such as electronics, Electronics, and ELECTRONICS. Even though they mean the same thing, the system would treat them as separate categories, leading to incorrect aggregations.

Resolution:
I standardized all category values into a consistent format (for example, Electronics, Clothing). This ensured that all similar records were grouped correctly, resulting in accurate analysis, especially for queries like revenue by category.