## Vector DB Use Case

A traditional keyword-based search wouldn’t work well for this kind of problem. Legal documents are usually written in complex language, and the same idea can be described in different ways. For example, if someone searches for “termination clauses,” they might miss sections labeled as “contract cancellation conditions” or “exit provisions,” even though they mean the same thing. Since keyword search depends on exact word matches, it can easily overlook relevant sections or return incomplete results.

This is where a vector database becomes useful. Instead of focusing on exact words, it looks at the meaning behind the text. It does this by converting both the contract and the user’s query into embeddings—basically numerical representations of meaning. This allows the system to match ideas, not just words.

In practice, the contract would be split into smaller parts like paragraphs, and each part would be converted into an embedding and stored. When a lawyer asks a question in plain English, that query is also converted into an embedding and compared with the stored ones. The system then returns the most relevant sections based on similarity.

Overall, this makes the search much more intuitive and accurate, especially for long and complex documents. That’s why a vector database plays such an important role in building systems like this.