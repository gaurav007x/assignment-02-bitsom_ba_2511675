// ==========================================
// OP1: insertMany() — insert all documents
// ==========================================
db.products.insertMany([
  {
    product_id: "E1001",
    category: "Electronics",
    name: "Samsung 55-inch 4K Smart TV",
    price: 54999,
    brand: "Samsung",
    specifications: {
      screen_size: "55 inch",
      resolution: "4K UHD",
      smart_tv: true,
      ports: ["HDMI", "USB", "Bluetooth"]
    },
    warranty: {
      period_years: 2,
      type: "On-site"
    },
    ratings: { average: 4.5, reviews_count: 1287 }
  },
  {
    product_id: "C2001",
    category: "Clothing",
    name: "Men's Slim Fit Denim Jacket",
    price: 2499,
    brand: "Levi's",
    sizes_available: ["S", "M", "L", "XL"],
    color_options: ["Blue", "Black"],
    material: { fabric: "Denim", composition: "100% Cotton" },
    care_instructions: [
      "Machine wash cold",
      "Do not bleach",
      "Iron at low temperature"
    ],
    ratings: { average: 4.2, reviews_count: 342 }
  },
  {
    product_id: "G3001",
    category: "Groceries",
    name: "Amul Full Cream Milk 1L",
    price: 65,
    brand: "Amul",
    expiry_date: "2026-04-01",
    nutrition: {
      calories_per_100ml: 67,
      protein: "3.2g",
      fat: "4.0g"
    },
    storage_instructions: "Keep refrigerated below 4°C"
  }
]);

// ==========================================
// OP2: find() — Electronics with price > 20000
// ==========================================
db.products.find(
  {
    category: "Electronics",
    price: { $gt: 20000 }
  },
  {
    _id: 0,
    name: 1,
    price: 1,
    brand: 1,
    "specifications.resolution": 1
  }
);

// ==========================================
// OP3: find() — Groceries expiring before 2025-01-01
// ==========================================
db.products.find(
  {
    category: "Groceries",
    expiry_date: { $lt: "2025-01-01" }
  },
  {
    _id: 0,
    name: 1,
    expiry_date: 1,
    brand: 1
  }
);

// ==========================================
// OP4: updateOne() — add discount_percent
// ==========================================
db.products.updateOne(
  { product_id: "E1001" },
  {
    $set: {
      discount_percent: 10,
      discounted_price: {
        $multiply: ["$price", 0.9]
      }
    }
  }
);

// ==========================================
// OP5: createIndex() — index on category
// ==========================================
db.products.createIndex(
  { category: 1, price: 1 },
  { name: "idx_category_price" }
);

// Explanation:
// This compound index improves performance for queries filtering by category
// and sorting/filtering by price, which are common in e-commerce use cases.