## Storage Systems

Storage Systems

Goal 1 — Predict patient readmission risk:
For day-to-day hospital operations, structured patient data (like EHR records) is stored in a PostgreSQL database. This works well for transactional use. Every night, this data is moved to a data warehouse like Redshift or BigQuery, where it’s used for analysis and building machine learning features. The trained model is managed using tools like MLflow, and predictions are written back into PostgreSQL so doctors can see them in their dashboards.

Goal 2 — Plain English queries on patient history:
Patient notes and clinical records are broken into smaller chunks and converted into embeddings using a language model. These are stored in a vector database like Pinecone or Weaviate. When a doctor asks a question in plain English, the system finds the most relevant pieces of information and generates a clear answer. The original records still remain safely stored in PostgreSQL.

Goal 3 — Monthly management reports:
For reporting, a data warehouse like Redshift or BigQuery is used. It stores cleaned and structured data, which is used to generate reports like bed occupancy, department costs, and staff usage. These are prepared using scheduled transformations and visualized through BI tools like Tableau or Metabase.

Goal 4 — Real-time ICU vitals:
Live data from ICU devices is streamed using Kafka and processed in real time using tools like Flink. This data is stored in a time-series database such as InfluxDB or TimescaleDB for monitoring. At the same time, the system can detect anomalies (like a sudden drop in oxygen levels) and trigger alerts instantly.

## OLTP vs OLAP Boundary

The transactional system (OLTP) ends at PostgreSQL, which handles all real-time operations like patient updates, prescriptions, and billing. This ensures reliable and consistent data handling.

The analytical system (OLAP) starts in the data warehouse. Data is moved from PostgreSQL into the warehouse, where it is structured for reporting and analysis. This separation ensures that heavy analytical queries do not affect day-to-day hospital operations.

Real-time ICU data follows a separate path. It flows directly through streaming systems into a time-series database, without going through PostgreSQL.

## Trade-offs

Trade-off: Increased system complexity
Using multiple systems (PostgreSQL, Redshift, Kafka, vector DB, etc.) increases complexity. There are more components to manage, monitor, and maintain, which can make the system harder to operate.

Mitigation:
This can be handled by using managed cloud services (like AWS or GCP), which reduce operational overhead. Services like RDS, Redshift, and managed Kafka simplify deployment and monitoring. Additionally, using a central data lake (e.g., S3 with Delta Lake) as a common source of truth helps keep data consistent across systems and simplifies compliance requirements.
