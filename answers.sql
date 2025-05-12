
sql
-- Week 7 Assignment: Achieving 1NF and 2NF

-- 🎯 Question 1: Achieving 1NF (First Normal Form)
-- Step: Create ProductDetail table and insert rows where each product appears on a separate row (already normalized)

CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
);

-- ✔️ This data now complies with 1NF (no multivalued attributes)
INSERT INTO ProductDetail(OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- 🔍 Explanation:
-- Each row now represents a single product per order, eliminating multi-valued fields.

-- 🧩 Question 2: Achieving 2NF (Second Normal Form)
-- Step 1: Create an 'orders' table with OrderID as the primary key and CustomerName
-- CustomerName is moved to a separate table since it only depends on OrderID (not on the combination of OrderID and Product)

CREATE TABLE orders(
    OrderID INT PRIMARY KEY,
    customerName VARCHAR(100)
);

INSERT INTO orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create a 'product' table that separates product-related data and references the order_id from orders table

CREATE TABLE product(
    product_id INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT,
    order_id INT,
    FOREIGN KEY(order_id) REFERENCES orders(OrderID)
);

INSERT INTO product(product_id, productName, quantity, order_id)
VALUES 
(1, 'Laptop', 2, 101),
(2, 'Mouse', 1, 101),
(3, 'Tablet', 3, 102),
(4, 'Keyboard', 2, 102),
(5, 'Mouse', 1, 102),
(6, 'Phone', 1, 103);


