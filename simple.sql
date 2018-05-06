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
    Fax VARCHAR(15) NULL
);

INSERT INTO Customer (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax) VALUES
	('Spar','Aladár','Manager','Soroksári u. 12.','Budapest',null,'1061','Hun',3613598187,3613598187),
	('Aldi','Brigitta','Manager','Kerepesi u. 39.','Budapest',null,'1016','Hun',3615489672,null),
	('Lidl','Cecília','Manager','Rákóczi u. 1.','Kecskemét',null,'5300','Hun',3641135848,3641135848),
	('Coop','Dénes','Owner','Bodó köz 11.','Miskolc',null,'2180','Hun',3641789254,null),
	('TESCO','Edward','Manager','12 Staines Rd.', 'Ilford','Essex','IG1 1PT','UK',447587828371,null)
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

--INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES
--;

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    ProductName TEXT NOT NULL,
    SupplierID TEXT NOT NULL,
    CategoryID INTEGER NOT NULL,
    QuantityPerUnit INTEGER NULL,
    UnitPrice INTEGER NULL,
    UnitsInStock INTEGER NULL,
    UnitsOnOrder INTEGER NULL,
    ReorderLevel INTEGER NOT NULL,
    Discontinued BIT NOT NULL
);

INSERT INTO Product (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
    ('Gyulai Kolbász', 'GYHU',1,250,1000,50,20,20,'1'),
    ('Baromfi Párizsi', 'LUDH',1,10,200,50,15,20,'0'),
    ('Chilis Sertés Párizsi', 'PICK',1,10,200,50,20,20,'1'),
    ('Füstölt szalonna', 'GYHU',1,10,150,50,15,20,'0'),
    ('Prémium Sertés combsonka', 'PONN',1,25,600,40,20,20,'0'),
    ('Sertés Bécsi virsli', 'DHUS',1,15,450,30,15,20,'1'),
    ('Nádudvari Tej', 'NADT',2,100,210,25,20,20,'0'),
    ('Trappista Sajt', 'PANT',2,10,180,35,15,20,'0'),
    ('Karaván füstölt sajt', 'PANT',2,10,200,26,20,20,'1'),
    ('Alma', 'ALFK',3,10,40,100,15,20,'0'),
    ('Banán', 'ZGYE',3,10,50,50,20,20,'0'),
    ('Szőlő', 'ALFK',3,10,60,30,15,20,'1'),
    ('Körte', 'ALFK',3,10,55,25,20,20,'0'),
    ('Krumpli', 'ZGYE',4,100,160,300,15,20,'0'),
    ('Sárgarépa', 'ZGYE',4,10,80,100,20,20,'1'),
    ('Karalábé', 'ZGYE',4,10,90,80,15,20,'0'),
    ('Kenyér', 'NADK',5,100,410,300,20,20,'0'),
    ('Kifli', 'NADK',5,10,30,100,15,20,'1')
;

CREATE TABLE Order_Detail (
    OrderID SERIAL PRIMARY KEY,
    ProductID SERIAL,
    UnitPrice INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    Discount INTEGER NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

--INSERT INTO Order_Detail (ProductID, UnitPrice, Quantity, Discount) VALUES
--;