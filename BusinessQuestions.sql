-- Business Questions
-- 1. Which products are currently below their reorder level and need restocking?
-- Include product name, quantity in stock, reorder level, and which warehouse it's
-- stored in. 
SELECT ProductName, QuantityInStock, ReorderLevel, WarehouseName
FROM Inventory JOIN Products USING (ProductID)
               JOIN Warehouses USING (WarehouseID)
WHERE QuantityInStock < ReorderLevel;

-- 2. Which suppliers have delayed the most orders in the last 60 days?
-- Assume the schema includes order status and dates). 
SELECT SupplierName, COUNT(*) AS DelayedOrders
FROM PurchaseOrders JOIN Suppliers USING (SupplierID)
WHERE ExpectedDeliveryDate < CURRENT_DATE 
AND DeliveryStatus = 'Pending'AND OrderDate >= CURDATE() - INTERVAL 60 DAY
GROUP BY SupplierName
ORDER BY DelayedOrders DESC; 

-- 3. Which three warehouses hold the highest total inventory by value?
-- Assume unit price x quantity in stock. 
SELECT WarehouseName, SUM(QuantityInStock * UnitPrice) AS TotalValue
FROM Inventory JOIN Products USING (ProductID)
               JOIN Warehouses USING (WarehouseID)
GROUP BY WarehouseName
ORDER BY TotalValue DESC
LIMIT 3;

-- 4. Which products have not had any new stock orders in the past 6 months?
SELECT ProductName
FROM Products LEFT JOIN OrderDetails USING (ProductID)
              LEFT JOIN PurchaseOrders USING (PurchaseOrderID)
WHERE OrderDate IS NULL OR OrderDate < CURDATE() - INTERVAL 6 MONTH;

-- 5. Provide a list of top 5 most frequently reordered products, sorted by
-- number of times reordered. 
SELECT ProductName, COUNT(OrderDetailID) AS ReorderFrequency
FROM OrderDetails JOIN Products USING (ProductID)
GROUP BY ProductName
ORDER BY ReorderFrequency DESC
LIMIT 5;



