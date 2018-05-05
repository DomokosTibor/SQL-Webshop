DROP TABLE IF EXISTS Order_Detail;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    CompanyName TEXT NOT NULL,
    ContactName TEXT NOT NULL,
    ContactTitle TEXT NOT NULL,
    Address TEXT NULL,
    City TEXT NULL,
    Region TEXT NULL,
    PostalCode TEXT NULL,
    Country TEXT NULL,
    Phone VARCHAR(15) NOT NULL,
    Fax INTEGER NULL
);

INSERT INTO Customer (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax) VALUES
	('AT&T', 'Albert', 'Owner', '1 AT&T Way', 'Arlington', 'Texas', 'TX 76011', 'USA', 18178924161, null),
	('Bárka', 'Mózes', 'Owner', null, null, null, null, null, 36301234567, null)
;

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INTEGER NOT NULL,
    EmployeeID INTEGER NOT NULL,
    OrderDate DATE NOT NULL,
    RequiredDate DATE NOT NULL,
    ShippedDate DATE NOT NULL,
    ShipVia TEXT NOT NULL,
    Freight TEXT NOT NULL,
    ShipName TEXT NOT NULL,
    ShipAddress TEXT NOT NULL,
    ShipCity TEXT NOT NULL,
    ShipRegion TEXT NOT NULL,
    ShipPostalCode TEXT NOT NULL,
    ShipCountry TEXT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    ProductName TEXT NOT NULL,
    SupplierID INTEGER NOT NULL,
    CategoryID INTEGER NOT NULL,
    QuantityPerUnit INTEGER NULL,
    UnitPrice INTEGER NULL,
    UnitsInStock INTEGER NULL,
    UnitsOnOrder INTEGER NULL,
    ReorderLevel TEXT NOT NULL,
    Discontinued TEXT NOT NULL
);

CREATE TABLE Order_Detail (
    OrderID SERIAL PRIMARY KEY,
    ProductID SERIAL,
    UnitPrice INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    Discount INTEGER NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);