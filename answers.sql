Question 1
SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
FROM ProductDetail
INNER JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) n
  ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1
ORDER BY OrderID, n.n;
Question 2
-- Create Orders table to store OrderID and CustomerName
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Create OrderDetails table to store OrderID, Product, and Quantity
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
Question 
