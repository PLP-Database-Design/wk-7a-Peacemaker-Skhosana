Question 1
SQL query to split the Products column into individual rows for each product
SELECT OrderID, CustomerName, 'Laptop' AS Product
FROM ProductDetail
WHERE Products LIKE '%Laptop%'
UNION ALL
SELECT OrderID, CustomerName, 'Mouse' AS Product
FROM ProductDetail
WHERE Products LIKE '%Mouse%'
UNION ALL
SELECT OrderID, CustomerName, 'Tablet' AS Product
FROM ProductDetail
WHERE Products LIKE '%Tablet%'
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard' AS Product
FROM ProductDetail
WHERE Products LIKE '%Keyboard%'
UNION ALL
SELECT OrderID, CustomerName, 'Phone' AS Product
FROM ProductDetail
WHERE Products LIKE '%Phone%';

Question 2
CREATE TABLE Customer (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert the unique CustomerName and OrderID data
INSERT INTO Customer (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customer(OrderID)
);

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

