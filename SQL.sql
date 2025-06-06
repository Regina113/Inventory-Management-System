CREATE TABLE Categories (
       CategoryID INT PRIMARY KEY,
       CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Suppliers (
       SupplierID INT PRIMARY KEY,
       SupplierName VARCHAR(100) NOT NULL,
       ContactName VARCHAR(100),
       Phone VARCHAR(20)
);

CREATE TABLE Products (
       ProductID INT PRIMARY KEY,
       ProductName VARCHAR(100) NOT NULL,
       CategoryID INT, 
       SupplierID INT,
       UnitPrice DECIMAL(10, 2) NOT NULL,
       ReorderLevel INT DEFAULT 10,
       Discontinued BIT DEFAULT 0,
       FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
       FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Warehouses (
       WarehouseID INT PRIMARY KEY,
       WarehouseName VARCHAR(100) NOT NULL,
       Location VARCHAR(100)
);

CREATE TABLE Inventory (
       InventoryID INT PRIMARY KEY,
       ProductID INT,
       WarehouseID INT, 
       QuantityInStock INT NOT NULL,
       FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
       FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

CREATE TABLE PurchaseOrders (
       PurchaseOrderID INT PRIMARY KEY,
       SupplierID INT,
       OrderDate DATE NOT NULL,
       ExpectedDeliveryDate DATE,
       DeliveryStatus VARCHAR(20) CHECK (DeliveryStatus IN ('Pending', 'Delivered', 'Cancelled')),
       FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE OrderDetails (
       OrderDetailID INT PRIMARY KEY,
       PurchaseOrderID INT,
       ProductID INT,
       QuantityOrdered INT NOT NULL,
       UnitPrice DECIMAL(10, 2) NOT NULL,
       FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrders(PurchaseOrderID),
       FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Categories
INSERT INTO Categories(CategoryID, CategoryName)
            VALUES(1, 'Electronics');
INSERT INTO Categories(CategoryID, CategoryName)
            VALUES(2, 'Office Supplies');
INSERT INTO Categories(CategoryID, CategoryName)
            VALUES(3, 'Furniture');

-- Suppliers
INSERT INTO Suppliers(SupplierID, SupplierName, ContactName, Phone)
            VALUES(1, 'Global Tech Supplies', 'Amanda Reyes', '555-1234');
INSERT INTO Suppliers(SupplierID, SupplierName, ContactName, Phone)
            VALUES(2, 'Nova Office Solutions', 'Liam Brooks', '555-5678');
INSERT INTO Suppliers(SupplierID, SupplierName, ContactName, Phone)
            VALUES(3, 'Metro Distributors', 'Emily Carter', '555-9012');

-- Products
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(1, 'Wireless Mouse', 1, 1, 15.99, 20, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(2, 'Laptop Stand', 3, 2, 45.50, 10, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(3, 'Stapler', 2, 2, 7.25, 15, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(4, 'Office Desk', 3, 3, 250.00, 5, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(5, 'Monitor 24 inch', 1, 1, 129.99, 8, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(6, 'Printer Ink Cartridge', 2, 1, 34.99, 10, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(7, 'USB Flash Drive 32GB', 1, 3, 9.99, 25, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(8, 'Ergonomic Chair', 3, 3, 175.00, 4, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(9, 'Notepad Pack', 2, 2, 3.99, 20, 0);
INSERT INTO Products(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, ReorderLevel, Discontinued)
            VALUES(10, 'Keyboard', 1, 1, 19.99, 15, 0);

-- Warehouses
INSERT INTO Warehouses(WarehouseID, WarehouseName, Location)
            VALUES(1, 'Chicago Central', 'Chicago, IL');
INSERT INTO Warehouses(WarehouseID, WarehouseName, Location)
            VALUES(2, 'Dallas Hub', 'Dallas, TX');
INSERT INTO Warehouses(WarehouseID, WarehouseName, Location)
            VALUES(3, 'New York Storage', 'New York, NY');

-- Inventory
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(1, 1, 1, 5);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(2, 2, 1, 12);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(3, 3, 2, 8);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(4, 4, 2, 3);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(5, 5, 3, 14);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(6, 6, 3, 9);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(7, 7, 1, 30);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(8, 8, 2, 4);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(9, 9, 1, 25);
INSERT INTO Inventory(InventoryID, ProductID, WarehouseID, QuantityInStock)
            VALUES(10, 10, 3, 13);

-- PurchaseOrders
INSERT INTO PurchaseOrders(PurchaseOrderID, SupplierID, OrderDate, ExpectedDeliveryDate, DeliveryStatus)
            VALUES(1, 1, '2025-04-15', '2025-04-20', 'Delivered');
INSERT INTO PurchaseOrders(PurchaseOrderID, SupplierID, OrderDate, ExpectedDeliveryDate, DeliveryStatus)
            VALUES(2, 2, '2025-04-18', '2025-04-28', 'Delivered');
INSERT INTO PurchaseOrders(PurchaseOrderID, SupplierID, OrderDate, ExpectedDeliveryDate, DeliveryStatus)
            VALUES(3, 3, '2025-05-01', '2025-05-07', 'Pending');
INSERT INTO PurchaseOrders(PurchaseOrderID, SupplierID, OrderDate, ExpectedDeliveryDate, DeliveryStatus)
            VALUES(4, 1, '2025-05-03', '2025-05-09', 'Pending');
INSERT INTO PurchaseOrders(PurchaseOrderID, SupplierID, OrderDate, ExpectedDeliveryDate, DeliveryStatus)
            VALUES(5, 2, '2025-03-10', '2025-03-17', 'Delivered');
INSERT INTO PurchaseOrders(PurchaseOrderID, SupplierID, OrderDate, ExpectedDeliveryDate, DeliveryStatus)
            VALUES(6, 1, '2025-05-15', '2025-05-21', 'Pending');
INSERT INTO PurchaseOrders(PurchaseOrderID, SupplierID, OrderDate, ExpectedDeliveryDate, DeliveryStatus)
            VALUES(7, 3, '2024-11-12', '2024-11-20', 'Delivered');

-- Order Details
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(1, 1, 1, 20, 15.99);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(2, 1, 5, 10, 129.99);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(3, 2, 3, 25, 7.25);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(4, 2, 9, 50, 3.99);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(5, 3, 7, 15, 9.99);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(6, 4, 6, 10, 34.99);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(7, 5, 2, 20, 45.50);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(8, 6, 1, 30, 15.99);
INSERT INTO OrderDetails(OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitPrice)
            VALUES(9, 7, 8, 5, 175.00);

          

       

