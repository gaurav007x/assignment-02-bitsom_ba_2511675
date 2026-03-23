## Database Recommendation

For a healthcare patient management system, I would lean towards using a relational database like MySQL as the main system. In healthcare, data accuracy isn’t optional—it’s critical. Things like updating a patient’s medical history or prescribing medication need to be handled carefully, because even a small inconsistency can have serious consequences. That’s where ACID properties come in. They ensure that every transaction is either fully completed or not done at all, so the data always stays reliable.

If we look at it through the lens of the CAP theorem, healthcare systems usually prioritize consistency over availability. Even if there’s a network issue, it’s more important that all systems show the same correct patient data rather than allowing outdated or conflicting information.

On the other hand, MongoDB works differently. It follows BASE principles, which focus more on availability and scalability, even if that means the data might not always be immediately consistent. This makes it great for handling large amounts of flexible or unstructured data, but not ideal for core healthcare operations where correctness is non-negotiable.

That said, if the system also includes something like fraud detection or analytics, MongoDB becomes very useful. These use cases involve processing large and fast-changing datasets, where flexibility and scalability matter more than strict consistency. In such scenarios, a hybrid approach works best.

In short, MySQL is better suited for managing core patient data, while MongoDB can support analytics and high-scale workloads. Together, they provide a balanced and practical solution.
