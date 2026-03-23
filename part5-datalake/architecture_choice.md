## Architecture Recommendation

For this scenario, a Data Lakehouse would be the best choice. The startup is working with very different types of data—structured data like payment transactions, semi-structured data like GPS logs, and unstructured data like customer reviews and menu images. A traditional data warehouse struggles with this kind of variety, while a pure data lake, although flexible, doesn’t provide strong support for structured analysis or proper data management.

A Data Lakehouse brings the best of both worlds. It can store all types of data in one place, which makes it easier to manage everything from text reviews to images without needing separate systems. It also supports both analytics and near real-time processing. For example, the business can run reports on transaction data while also analyzing live GPS data to improve delivery efficiency.

Another big advantage is better data reliability and governance. Features like schema enforcement, ACID transactions, and versioning help ensure that the data stays consistent and trustworthy—something that’s especially important when dealing with payments.

Overall, a Data Lakehouse gives the flexibility and scalability a fast-growing startup needs, while still supporting strong analytics. That makes it a more practical and future-ready choice than using only a data warehouse or a data lake.