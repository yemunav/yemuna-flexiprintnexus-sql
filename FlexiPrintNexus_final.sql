DROP TABLE Customers;

CREATE TABLE Customers (
    CustomerID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,   -- auto generates IDs

    -- Common fields
    CustomerType VARCHAR2(30) NOT NULL
        CHECK (CustomerType IN ('Corporate','WalkIn','Online')),
    Name VARCHAR2(150) NOT NULL,
    Phone VARCHAR2(20),
    Email VARCHAR2(100),
    Address VARCHAR2(200),

    -- Corporate-specific fields
    CorporateCategory VARCHAR2(50)
        CHECK (CorporateCategory IN ('Private','Government')),
    GSTNumber VARCHAR2(20),
    PurchaseOrderNo VARCHAR2(50),
    OfficeVerificationAddress VARCHAR2(200),

    -- Walk-In specific fields
    BillType VARCHAR2(30) DEFAULT 'N/A',
    Notes VARCHAR2(200) DEFAULT 'N/A',

    -- Online-specific fields
    Platform VARCHAR2(30) DEFAULT 'N/A'
        CHECK (Platform IN ('Instagram','Facebook','Website','App','N/A')),
    PlatformCustomerRef VARCHAR2(100) DEFAULT 'N/A',
    PreferredDeliveryMode VARCHAR2(30) DEFAULT 'SelfPickup'
        CHECK (PreferredDeliveryMode IN ('SelfPickup','InHouse','ThirdParty','Courier','International'))
);

delete from customers;

-- Corporate Private Customers
INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','ABC Advertising Pvt Ltd','9876543210','contact@abcads.com','Chennai',
        'Private','33ABCDE1234F1Z5','PO-2026-001','No.12, Mount Road, Chennai','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','Bright Media Solutions','9876543211','info@gmail.com','Madurai',
        'Private','33BRIGHT5678F1Z6','PO-2026-002','Industrial Estate, Madurai','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','Creative Prints Pvt Ltd','9876543212','sales@gmail.com','Coimbatore',
        'Private','33CREAT1234F1Z7','PO-2026-003','Race Course Road, Coimbatore','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','Vision Ads Pvt Ltd','9876543213','vision@gmail.com','Trichy',
        'Private','33VISIO5678F1Z8','PO-2026-004','Main Bazaar, Trichy','SelfPickup');

-- Corporate Government Customers
INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','Tamil Nadu Tourism Dept','9876543214','tn.tourism@gov.in','Chennai',
        'Government','33TNTUR1234F1Z9','PO-2026-005','Secretariat, Chennai','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','Madurai Corporation','9876543215','madurai.corp@gov.in','Madurai',
        'Government','33MDCOR5678F1Z0','PO-2026-006','Corporation Office, Madurai','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','TN Highways Dept','9876543216','tn.highways@gov.in','Trichy',
        'Government','33TNHIG1234F1Z1','PO-2026-007','Highways Office, Trichy','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','Coimbatore Municipal Office','9876543217','cmb.municipal@gov.in','Coimbatore',
        'Government','33CMBMU5678F1Z2','PO-2026-008','Town Hall, Coimbatore','SelfPickup');

-- Walk-in Customers (GST Bill)
INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Ravi Kumar','9876543218','Madurai','GSTBill','Flex board for shop opening','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Priya Sharma','9876543219','Trichy','GSTBill','Banner for college fest','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Suresh Babu','9876543220','Coimbatore','GSTBill','Poster printing for NGO','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Meena Lakshmi','9876543221','Chennai','GSTBill','Wedding banner order','SelfPickup');

-- Walk-in Customers (Estimate Quote)
INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Arun Raj','9876543222','Madurai','EstimateQuote','Asked for price quote only','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Deepa Nair','9876543223','Trichy','EstimateQuote','Enquired about banner sizes','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Karthik Subramanian','9876543224','Coimbatore','EstimateQuote','Requested quotation for bulk flex boards','SelfPickup');

-- Corporate Government (extra)
INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress, PreferredDeliveryMode)
VALUES ('Corporate','Tamil Nadu Electricity Board','9876543310','tneb@tn.gov.in','Chennai',
        'Government','33TNEB1234F1Z4','PO-2026-016','Anna Salai, Chennai','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, CorporateCategory, PreferredDeliveryMode)
VALUES ('Corporate','Madurai District Collector Office','9876543311','Madurai','Government','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Email, Address,
                       CorporateCategory, GSTNumber, PurchaseOrderNo, PreferredDeliveryMode)
VALUES ('Corporate','Bright Ads Pvt Ltd','9876543312','contact@brightads.com','Coimbatore',
        'Private','33BRIAD1234F1Z5','PO-2026-018','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address,
                       CorporateCategory, GSTNumber, PreferredDeliveryMode)
VALUES ('Corporate','Royal Prints Pvt Ltd','9876543313','Trichy',
        'Private','33ROYPR1234F1Z6','SelfPickup');

-- Walk-in Customers (more)
INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Meena Lakshmi','9876543314','Chennai','GSTBill','School annual day banners','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, PreferredDeliveryMode)
VALUES ('WalkIn','Sathish Kumar','9876543315','Madurai','GSTBill','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Divya R','9876543316','Trichy','EstimateQuote','Asked for visiting card pricing','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, BillType, PreferredDeliveryMode)
VALUES ('WalkIn','Naveen Raj','9876543317','Salem','EstimateQuote','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, PreferredDeliveryMode)
VALUES ('WalkIn','Hari Prasad','9876543318','Chennai','SelfPickup');

-- Corporate Private (minimal fields)
INSERT INTO Customers (CustomerType, Name, Address, CorporateCategory, PreferredDeliveryMode)
VALUES ('Corporate','Techno Solutions Pvt Ltd','Coimbatore','Private','SelfPickup');

INSERT INTO Customers (
    CustomerType, Name, Phone, Address, BillType, Notes, PreferredDeliveryMode
)
VALUES (
    'WalkIn',
    'Ravi Kumar',
    '9123456780',
    'Madurai',
    'GSTBill',
    'Flex board for shop opening',
    'SelfPickup'
);

-- Walk-In Customers (basic + variations)
INSERT INTO Customers (CustomerType, Name, Phone, Address, PreferredDeliveryMode)
VALUES ('WalkIn','Ramesh Kumar','9876543210','Chennai','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Address, Notes, PreferredDeliveryMode)
VALUES ('WalkIn','Sita Devi','Chennai','Prefers cash payments','SelfPickup');

-- Corporate Private (extra cases)
INSERT INTO Customers (CustomerType, Name, Phone, Email, Address, CorporateCategory, GSTNumber, PreferredDeliveryMode)
VALUES ('Corporate','ABC Pvt Ltd','9123456780','contact@abcpvt.com','Chennai','Private','GSTIN98765','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Address, CorporateCategory, GSTNumber, PreferredDeliveryMode)
VALUES ('Corporate','XYZ Printers','Chennai','Private','GSTIN54321','SelfPickup');

-- Corporate Government (extra cases)
INSERT INTO Customers (CustomerType, Name, Email, Address, CorporateCategory, GSTNumber, PreferredDeliveryMode)
VALUES ('Corporate','Govt Printing Dept','govdept@example.com','Chennai','Government','GSTIN12345','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Phone, Address, CorporateCategory, GSTNumber, PreferredDeliveryMode)
VALUES ('Corporate','Municipal Office','9001122334','Chennai','Government','GSTIN67890','SelfPickup');

-- Online Customers (Instagram)
INSERT INTO Customers (CustomerType, Name, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','Priya Sharma','Chennai','Instagram','DM56789','ThirdParty');

INSERT INTO Customers (CustomerType, Name, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','Karthik Iyer','Chennai','Instagram','DM99887','SelfPickup');

-- Online Customers (Facebook)
INSERT INTO Customers (CustomerType, Name, Email, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','Arun Kumar','arun.fb@example.com','Chennai','Facebook','FBORDER202','SelfPickup');

INSERT INTO Customers (CustomerType, Name, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','Lakshmi N','Chennai','Facebook','FBORDER303','Courier');

-- Online Customers (Website)
INSERT INTO Customers (CustomerType, Name, Email, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','John Doe','john@example.com','Chennai','Website','WEBUSER102','Courier');

INSERT INTO Customers (CustomerType, Name, Phone, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','Maria Lopez','9988776655','Chennai','Website','WEBUSER555','International');

-- Online Customers (Mobile App)
INSERT INTO Customers (CustomerType, Name, Phone, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','Meena R','9988776655','Chennai','App','APPORDER555','International');

INSERT INTO Customers (CustomerType, Name, Address, Platform, PlatformCustomerRef, PreferredDeliveryMode)
VALUES ('Online','David Chen','Chennai','App','APPORDER777','InHouse');

INSERT INTO Customers (
    CustomerType, Name, Phone, Email, Address,
    CorporateCategory, GSTNumber, PurchaseOrderNo, OfficeVerificationAddress,
    PreferredDeliveryMode
)
VALUES (
    'Corporate',
    'Tamil Nadu Health Department',
    '044-23456789',
    'healthdept@tn.gov.in',
    'Secretariat, Chennai',
    'Government',
    '33TNHEA1234F1Z9',
    'PO-2026-050',
    'Block A, Secretariat, Chennai',
    'InHouse'
    );

commit;

SELECT * FROM customers;

desc customers;

CREATE TABLE Employees (
    EmployeeID   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name         VARCHAR2(100) NOT NULL,
    Role         VARCHAR2(40) NOT NULL
        CHECK (Role IN ('Sales','Designer','MachineOperator','DeliveryStaff','Admin','Manager')),
    Phone        VARCHAR2(20),
    JoiningDate  DATE DEFAULT SYSDATE,
    Status       VARCHAR2(20) DEFAULT 'Active'
        CHECK (Status IN ('Active','Inactive'))
);

INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Muthu Vel','Sales','9445001001', DATE '2022-03-01');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Kavitha R','Sales','9445001002', DATE '2022-06-15');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Arjun S','Designer','9445001003', DATE '2021-11-10');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Priyanka M','Designer','9445001004', DATE '2023-01-20');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Selvam K','MachineOperator','9445001005', DATE '2020-08-05');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Ganesh P','MachineOperator','9445001006', DATE '2021-02-14');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Vignesh T','MachineOperator','9445001007', DATE '2022-09-09');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Ramesh D','DeliveryStaff','9445001008', DATE '2022-04-18');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Anitha V','DeliveryStaff','9445001009', DATE '2023-05-02');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Bala Murugan','Admin','9445001010', DATE '2019-12-01');
INSERT INTO Employees (Name, Role, Phone, JoiningDate) VALUES ('Sudha N','Manager','9445001011', DATE '2019-01-15');

select * from employees;

CREATE TABLE Products (
    ProductID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ProductName  VARCHAR2(80) NOT NULL,
    Category     VARCHAR2(20) NOT NULL
        CHECK (Category IN ('Printing','Design')),
    UnitType     VARCHAR2(20) NOT NULL
        CHECK (UnitType IN ('SqFt','Piece','Box','Set')),
    BaseRate     NUMBER(10,2) NOT NULL
);

-- Printing jobs
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Flex Banner','Printing','SqFt',12);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Vinyl Sticker','Printing','SqFt',18);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Backlit Signboard','Printing','SqFt',45);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('One-Way Vision Sticker','Printing','SqFt',30);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Cloth Banner','Printing','SqFt',22);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Standee (X-Banner)','Printing','Piece',350);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Visiting Card Printing (Box of 100)','Printing','Box',150);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('ID Card','Printing','Piece',40);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Table Cover Print','Printing','Piece',600);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Acrylic Sign Letters','Printing','Piece',250);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Poster Print (A3)','Printing','Piece',40);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Poster Print (Large Format)','Printing','SqFt',15);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Invitation Card Printing (Box of 100)','Printing','Box',800);

-- Design-only services (no material/machine involved — just designer's time)
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Logo Design','Design','Piece',1500);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Visiting Card Design','Design','Piece',300);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Invitation Card Design','Design','Piece',500);
INSERT INTO Products (ProductName, Category, UnitType, BaseRate) VALUES ('Poster Design','Design','Piece',400);

select * from products;

CREATE TABLE Materials (
    MaterialID     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    MaterialName   VARCHAR2(60) NOT NULL,
    CostPerSqFt    NUMBER(8,2) NOT NULL,
    StockQty       NUMBER(10,2) DEFAULT 0,
    ReorderLevel   NUMBER(10,2) DEFAULT 100
);

INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Flex 13oz',6.50,850,150);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Flex Frontlit',7.00,420,150);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Flex Backlit',12.00,180,100);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Vinyl Glossy',9.50,300,100);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Vinyl Matte',9.80,60,100);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('One-Way Vision Film',15.00,90,80);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Cloth Media',10.00,220,100);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Acrylic Sheet 3mm',35.00,50,40);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('PVC Foam Board',20.00,140,80);
INSERT INTO Materials (MaterialName, CostPerSqFt, StockQty, ReorderLevel) VALUES ('Art Card (visiting card stock)',2.00,500,200);

select * from materials;

CREATE TABLE Machines (
    MachineID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    MachineName  VARCHAR2(60) NOT NULL,
    MaxWidthFt   NUMBER(5,2) NOT NULL,
    Status       VARCHAR2(20) DEFAULT 'Working'
        CHECK (Status IN ('Working','UnderMaintenance','Idle'))
);

INSERT INTO Machines (MachineName, MaxWidthFt, Status) VALUES ('Solvent Printer A - 10ft',10,'Working');
INSERT INTO Machines (MachineName, MaxWidthFt, Status) VALUES ('Solvent Printer B - 6ft',6,'Working');
INSERT INTO Machines (MachineName, MaxWidthFt, Status) VALUES ('UV Flatbed Printer',4,'Working');
INSERT INTO Machines (MachineName, MaxWidthFt, Status) VALUES ('Digital Card Press',2,'Working');
INSERT INTO Machines (MachineName, MaxWidthFt, Status) VALUES ('Laser Acrylic Cutter',3,'UnderMaintenance');
INSERT INTO Machines (MachineName, MaxWidthFt, Status) VALUES ('Sublimation Printer',5,'Idle');

SELECT * FROM machines;

CREATE TABLE Suppliers (
    SupplierID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name             VARCHAR2(100) NOT NULL,
    Phone            VARCHAR2(20),
    MaterialSupplied VARCHAR2(60),
    City             VARCHAR2(40)
);

INSERT INTO Suppliers (Name, Phone, MaterialSupplied, City) VALUES ('Chennai Flex Traders','9840011001','Flex 13oz','Chennai');
INSERT INTO Suppliers (Name, Phone, MaterialSupplied, City) VALUES ('Madurai Vinyl Co','9840011002','Vinyl Glossy','Madurai');
INSERT INTO Suppliers (Name, Phone, MaterialSupplied, City) VALUES ('SS Acrylic Supplies','9840011003','Acrylic Sheet 3mm','Coimbatore');
INSERT INTO Suppliers (Name, Phone, MaterialSupplied, City) VALUES ('Trichy Print Media','9840011004','Cloth Media','Trichy');
INSERT INTO Suppliers (Name, Phone, MaterialSupplied, City) VALUES ('Southern Board Supplies','9840011005','PVC Foam Board','Chennai');
INSERT INTO Suppliers (Name, Phone, MaterialSupplied, City) VALUES ('Anna Paper & Cards','9840011006','Art Card (visiting card stock)','Chennai');

select * from suppliers;

CREATE TABLE DeliveryPartners (
    PartnerID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    PartnerName  VARCHAR2(80) NOT NULL,
    Phone        VARCHAR2(20),
    City         VARCHAR2(40),
    ServiceType  VARCHAR2(30) CHECK (ServiceType IN ('LocalCourier','InterCity','International'))
);

INSERT INTO DeliveryPartners (PartnerName, Phone, City, ServiceType) VALUES ('Speedy Local Courier','9500011001','Chennai','LocalCourier');
INSERT INTO DeliveryPartners (PartnerName, Phone, City, ServiceType) VALUES ('TN Parcel Services','9500011002','Madurai','InterCity');
INSERT INTO DeliveryPartners (PartnerName, Phone, City, ServiceType) VALUES ('BlueDart','9500011003','Chennai','International');
INSERT INTO DeliveryPartners (PartnerName, Phone, City, ServiceType) VALUES ('DTDC','9500011004','Coimbatore','InterCity');


COMMIT;

select * from deliverypartners;

CREATE TABLE Quotations (
    QuoteID          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CustomerID       NUMBER NOT NULL REFERENCES Customers(CustomerID),
    ProductID        NUMBER NOT NULL REFERENCES Products(ProductID),
    QuoteDate        DATE DEFAULT SYSDATE,
    EstimatedAmount  NUMBER(10,2),
    Status           VARCHAR2(20) DEFAULT 'Pending'
        CHECK (Status IN ('Pending','Converted','Rejected'))
);

INSERT INTO Quotations (CustomerID, ProductID, QuoteDate, EstimatedAmount, Status)
VALUES ((SELECT CustomerID FROM Customers WHERE Name='Arun Raj'),
        (SELECT ProductID FROM Products WHERE ProductName='Flex Banner'),
        DATE '2026-06-01', 1200, 'Converted');

INSERT INTO Quotations (CustomerID, ProductID, QuoteDate, EstimatedAmount, Status)
VALUES ((SELECT CustomerID FROM Customers WHERE Name='Deepa Nair'),
        (SELECT ProductID FROM Products WHERE ProductName='Standee (X-Banner)'),
        DATE '2026-06-05', 700, 'Pending');

INSERT INTO Quotations (CustomerID, ProductID, QuoteDate, EstimatedAmount, Status)
VALUES ((SELECT CustomerID FROM Customers WHERE Name='Karthik Subramanian'),
        (SELECT ProductID FROM Products WHERE ProductName='Flex Banner'),
        DATE '2026-06-10', 5400, 'Converted');

INSERT INTO Quotations (CustomerID, ProductID, QuoteDate, EstimatedAmount, Status)
VALUES ((SELECT CustomerID FROM Customers WHERE Name='Divya R'),
        (SELECT ProductID FROM Products WHERE ProductName='Visiting Card Printing (Box of 100)'),
        DATE '2026-06-12', 300, 'Rejected');

INSERT INTO Quotations (CustomerID, ProductID, QuoteDate, EstimatedAmount, Status)
VALUES ((SELECT CustomerID FROM Customers WHERE Name='Naveen Raj'),
        (SELECT ProductID FROM Products WHERE ProductName='Vinyl Sticker'),
        DATE '2026-06-15', 900, 'Pending');
        
select * from quotations;

CREATE TABLE Orders (
    OrderID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CustomerID    NUMBER NOT NULL REFERENCES Customers(CustomerID),
    EmployeeID    NUMBER REFERENCES Employees(EmployeeID),
    OrderDate     DATE DEFAULT SYSDATE,
    PromisedDate  DATE,
    DeliveredDate DATE,
    Status        VARCHAR2(20) DEFAULT 'InProgress'
        CHECK (Status IN ('InProgress','Ready','Delivered','Cancelled'))
);

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='ABC Advertising Pvt Ltd'),(SELECT EmployeeID FROM Employees WHERE Name='Muthu Vel'),DATE '2026-06-02',DATE '2026-06-05',DATE '2026-06-05','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Ravi Kumar' AND Phone='9876543218'),(SELECT EmployeeID FROM Employees WHERE Name='Kavitha R'),DATE '2026-06-03',DATE '2026-06-04',DATE '2026-06-06','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Tamil Nadu Tourism Dept'),(SELECT EmployeeID FROM Employees WHERE Name='Muthu Vel'),DATE '2026-06-04',DATE '2026-06-10',NULL,'InProgress');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Priya Sharma' AND Address='Trichy'),(SELECT EmployeeID FROM Employees WHERE Name='Kavitha R'),DATE '2026-06-05',DATE '2026-06-07',DATE '2026-06-09','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Bright Media Solutions'),(SELECT EmployeeID FROM Employees WHERE Name='Muthu Vel'),DATE '2026-06-06',DATE '2026-06-09',DATE '2026-06-09','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Suresh Babu'),(SELECT EmployeeID FROM Employees WHERE Name='Kavitha R'),DATE '2026-06-07',DATE '2026-06-08',NULL,'Ready');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Madurai Corporation'),(SELECT EmployeeID FROM Employees WHERE Name='Muthu Vel'),DATE '2026-06-08',DATE '2026-06-15',DATE '2026-06-18','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Meena Lakshmi' AND Notes='Wedding banner order'),(SELECT EmployeeID FROM Employees WHERE Name='Kavitha R'),DATE '2026-06-09',DATE '2026-06-11',DATE '2026-06-11','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Creative Prints Pvt Ltd'),(SELECT EmployeeID FROM Employees WHERE Name='Muthu Vel'),DATE '2026-06-10',DATE '2026-06-13',DATE '2026-06-13','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='John Doe'),(SELECT EmployeeID FROM Employees WHERE Name='Kavitha R'),DATE '2026-06-11',DATE '2026-06-14',NULL,'Cancelled');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Techno Solutions Pvt Ltd'),(SELECT EmployeeID FROM Employees WHERE Name='Kavitha R'),DATE '2026-06-12',DATE '2026-06-15',DATE '2026-06-15','Delivered');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, PromisedDate, DeliveredDate, Status) VALUES
((SELECT CustomerID FROM Customers WHERE Name='Priya Sharma' AND Address='Chennai'),(SELECT EmployeeID FROM Employees WHERE Name='Muthu Vel'),DATE '2026-06-16',DATE '2026-06-18',DATE '2026-06-18','Delivered');

select * from orders;

CREATE TABLE OrderItems (
    ItemID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrderID      NUMBER NOT NULL REFERENCES Orders(OrderID),
    ProductID    NUMBER NOT NULL REFERENCES Products(ProductID),
    MaterialID   NUMBER REFERENCES Materials(MaterialID),   -- NULL for design-only services
    MachineID    NUMBER REFERENCES Machines(MachineID),      -- NULL for design-only services
    WidthFt      NUMBER(6,2),
    HeightFt     NUMBER(6,2),
    Quantity     NUMBER(6) DEFAULT 1,
    RatePerSqFt  NUMBER(8,2),
    Discount     NUMBER(5,2) DEFAULT 0,
    Amount       NUMBER(10,2)
);

INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(1,(SELECT ProductID FROM Products WHERE ProductName='Flex Banner'),(SELECT MaterialID FROM Materials WHERE MaterialName='Flex 13oz'),(SELECT MachineID FROM Machines WHERE MachineName='Solvent Printer A - 10ft'),10,4,1,12,0,480);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(2,(SELECT ProductID FROM Products WHERE ProductName='Flex Banner'),(SELECT MaterialID FROM Materials WHERE MaterialName='Flex 13oz'),(SELECT MachineID FROM Machines WHERE MachineName='Solvent Printer B - 6ft'),6,3,1,12,0,216);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(3,(SELECT ProductID FROM Products WHERE ProductName='Backlit Signboard'),(SELECT MaterialID FROM Materials WHERE MaterialName='Flex Backlit'),(SELECT MachineID FROM Machines WHERE MachineName='UV Flatbed Printer'),8,5,1,45,10,1620);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(4,(SELECT ProductID FROM Products WHERE ProductName='Cloth Banner'),(SELECT MaterialID FROM Materials WHERE MaterialName='Cloth Media'),(SELECT MachineID FROM Machines WHERE MachineName='Solvent Printer B - 6ft'),12,3,1,22,0,792);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(5,(SELECT ProductID FROM Products WHERE ProductName='Vinyl Sticker'),(SELECT MaterialID FROM Materials WHERE MaterialName='Vinyl Glossy'),(SELECT MachineID FROM Machines WHERE MachineName='Solvent Printer A - 10ft'),20,2,1,18,5,684);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(6,(SELECT ProductID FROM Products WHERE ProductName='Vinyl Sticker'),(SELECT MaterialID FROM Materials WHERE MaterialName='Vinyl Matte'),(SELECT MachineID FROM Machines WHERE MachineName='Solvent Printer B - 6ft'),5,3,4,18,0,1080);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(7,(SELECT ProductID FROM Products WHERE ProductName='Flex Banner'),(SELECT MaterialID FROM Materials WHERE MaterialName='Flex Frontlit'),(SELECT MachineID FROM Machines WHERE MachineName='Solvent Printer A - 10ft'),15,6,3,12,15,2754);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(8,(SELECT ProductID FROM Products WHERE ProductName='Flex Banner'),(SELECT MaterialID FROM Materials WHERE MaterialName='Flex 13oz'),(SELECT MachineID FROM Machines WHERE MachineName='Solvent Printer B - 6ft'),8,4,1,12,0,384);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(9,(SELECT ProductID FROM Products WHERE ProductName='Standee (X-Banner)'),NULL,NULL,NULL,NULL,2,NULL,0,700);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(10,(SELECT ProductID FROM Products WHERE ProductName='Visiting Card Printing (Box of 100)'),(SELECT MaterialID FROM Materials WHERE MaterialName='Art Card (visiting card stock)'),(SELECT MachineID FROM Machines WHERE MachineName='Digital Card Press'),NULL,NULL,3,NULL,0,450);
-- Design-only order (logo design, no material/machine)
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(11,(SELECT ProductID FROM Products WHERE ProductName='Logo Design'),NULL,NULL,NULL,NULL,1,NULL,0,1500);
-- Wedding order: design + invitation card printing together
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(8,(SELECT ProductID FROM Products WHERE ProductName='Invitation Card Design'),NULL,NULL,NULL,NULL,1,NULL,0,500);
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(8,(SELECT ProductID FROM Products WHERE ProductName='Invitation Card Printing (Box of 100)'),(SELECT MaterialID FROM Materials WHERE MaterialName='Art Card (visiting card stock)'),(SELECT MachineID FROM Machines WHERE MachineName='Digital Card Press'),NULL,NULL,2,NULL,0,1600);
-- Poster order
INSERT INTO OrderItems (OrderID, ProductID, MaterialID, MachineID, WidthFt, HeightFt, Quantity, RatePerSqFt, Discount, Amount) VALUES
(12,(SELECT ProductID FROM Products WHERE ProductName='Poster Print (A3)'),NULL,(SELECT MachineID FROM Machines WHERE MachineName='Digital Card Press'),NULL,NULL,20,NULL,0,800);

select * from orderitems;

CREATE TABLE Payments (
    PaymentID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrderID      NUMBER NOT NULL REFERENCES Orders(OrderID),
    Amount       NUMBER(10,2) NOT NULL,
    PaymentMode         VARCHAR2(20) CHECK (PaymentMode IN ('Cash','UPI','BankTransfer','Cheque')),
    PaymentDate  DATE DEFAULT SYSDATE,
    Status       VARCHAR2(20) DEFAULT 'Full'
        CHECK (Status IN ('Full','Partial','Pending'))
);

INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (1,480,'UPI',DATE '2026-06-05','Full');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (2,216,'Cash',DATE '2026-06-06','Full');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (3,800,'BankTransfer',DATE '2026-06-04','Partial');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (4,792,'UPI',DATE '2026-06-09','Full');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (5,684,'Cash',DATE '2026-06-09','Full');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (6,500,'Cash',DATE '2026-06-08','Partial');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (7,2754,'BankTransfer',DATE '2026-06-19','Full');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (8,2100,'UPI',DATE '2026-06-11','Partial');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (9,350,'Cash',DATE '2026-06-11','Partial');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (11,1500,'UPI',DATE '2026-06-15','Full');
INSERT INTO Payments (OrderID, Amount, PaymentMode, PaymentDate, Status) VALUES (12,800,'Cash',DATE '2026-06-18','Full');

select * from payments;

CREATE TABLE PurchaseOrders (
    PONumber      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    SupplierID    NUMBER NOT NULL REFERENCES Suppliers(SupplierID),
    MaterialID    NUMBER NOT NULL REFERENCES Materials(MaterialID),
    QuantitySqFt  NUMBER(10,2) NOT NULL,
    OrderDate     DATE DEFAULT SYSDATE,
    ReceivedDate  DATE
);

INSERT INTO PurchaseOrders (SupplierID, MaterialID, QuantitySqFt, OrderDate, ReceivedDate) VALUES
((SELECT SupplierID FROM Suppliers WHERE Name='Chennai Flex Traders'),(SELECT MaterialID FROM Materials WHERE MaterialName='Flex 13oz'),500,DATE '2026-05-20',DATE '2026-05-23');
INSERT INTO PurchaseOrders (SupplierID, MaterialID, QuantitySqFt, OrderDate, ReceivedDate) VALUES
((SELECT SupplierID FROM Suppliers WHERE Name='Madurai Vinyl Co'),(SELECT MaterialID FROM Materials WHERE MaterialName='Vinyl Glossy'),200,DATE '2026-05-25',DATE '2026-05-28');
INSERT INTO PurchaseOrders (SupplierID, MaterialID, QuantitySqFt, OrderDate, ReceivedDate) VALUES
((SELECT SupplierID FROM Suppliers WHERE Name='SS Acrylic Supplies'),(SELECT MaterialID FROM Materials WHERE MaterialName='Acrylic Sheet 3mm'),60,DATE '2026-06-01',NULL);
INSERT INTO PurchaseOrders (SupplierID, MaterialID, QuantitySqFt, OrderDate, ReceivedDate) VALUES
((SELECT SupplierID FROM Suppliers WHERE Name='Trichy Print Media'),(SELECT MaterialID FROM Materials WHERE MaterialName='Cloth Media'),150,DATE '2026-06-03',DATE '2026-06-07');
INSERT INTO PurchaseOrders (SupplierID, MaterialID, QuantitySqFt, OrderDate, ReceivedDate) VALUES
((SELECT SupplierID FROM Suppliers WHERE Name='Anna Paper & Cards'),(SELECT MaterialID FROM Materials WHERE MaterialName='Art Card (visiting card stock)'),1000,DATE '2026-06-10',NULL);

select * from purchaseorders;

CREATE TABLE Deliveries (
    DeliveryID        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrderID           NUMBER NOT NULL REFERENCES Orders(OrderID),
    EmployeeID        NUMBER REFERENCES Employees(EmployeeID),
    DeliveryPartnerID NUMBER REFERENCES DeliveryPartners(PartnerID),
    DeliveryMode              VARCHAR2(30)
        CHECK (DeliveryMode IN ('SelfPickup','InHouse','ThirdParty','Courier','International')),
    DeliveryDate      DATE,
    Status            VARCHAR2(20) DEFAULT 'Pending'
        CHECK (Status IN ('Pending','Delivered','Failed'))
);

INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(1,(SELECT EmployeeID FROM Employees WHERE Name='Ramesh D'),NULL,'SelfPickup',DATE '2026-06-05','Delivered');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(2,(SELECT EmployeeID FROM Employees WHERE Name='Ramesh D'),NULL,'SelfPickup',DATE '2026-06-06','Delivered');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(4,(SELECT EmployeeID FROM Employees WHERE Name='Anitha V'),NULL,'InHouse',DATE '2026-06-09','Delivered');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(5,(SELECT EmployeeID FROM Employees WHERE Name='Ramesh D'),NULL,'SelfPickup',DATE '2026-06-09','Delivered');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(8,(SELECT EmployeeID FROM Employees WHERE Name='Ramesh D'),NULL,'InHouse',DATE '2026-06-11','Delivered');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(3,NULL,NULL,'SelfPickup',NULL,'Pending');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(6,NULL,NULL,'SelfPickup',NULL,'Pending');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status) VALUES
(12,(SELECT EmployeeID FROM Employees WHERE Name='Anitha V'),NULL,'InHouse',DATE '2026-06-18','Delivered');
INSERT INTO Deliveries (OrderID, EmployeeID, DeliveryPartnerID, DeliveryMode, DeliveryDate, Status)
VALUES (7, NULL,
        (SELECT PartnerID FROM DeliveryPartners WHERE PartnerName='TN Parcel Services'),
        'ThirdParty', DATE '2026-06-18', 'Delivered');

COMMIT;
select * from deliveries;

CREATE TABLE Inventory (
    InventoryID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    MaterialID     NUMBER NOT NULL REFERENCES Materials(MaterialID),
    MovementType   VARCHAR2(10) NOT NULL CHECK (MovementType IN ('IN','OUT')),
    Quantity       NUMBER(10,2) NOT NULL,
    MovementDate   DATE DEFAULT SYSDATE,
    Reason         VARCHAR2(60)
);

INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Flex 13oz'),'IN',500,DATE '2026-05-23','Purchase');
INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Vinyl Glossy'),'IN',200,DATE '2026-05-28','Purchase');
INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Cloth Media'),'IN',150,DATE '2026-06-07','Purchase');
INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Flex 13oz'),'OUT',40,DATE '2026-06-05','Used in Order');
INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Vinyl Glossy'),'OUT',40,DATE '2026-06-09','Used in Order');
INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Cloth Media'),'OUT',36,DATE '2026-06-09','Used in Order');
INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Vinyl Matte'),'OUT',5,DATE '2026-06-08','Damaged');
INSERT INTO Inventory (MaterialID, MovementType, Quantity, MovementDate, Reason) VALUES
((SELECT MaterialID FROM Materials WHERE MaterialName='Acrylic Sheet 3mm'),'OUT',3,DATE '2026-06-15','Stock Correction');

select * from inventory;

CREATE TABLE Feedbacks (
    FeedbacksID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrderID       NUMBER NOT NULL REFERENCES Orders(OrderID),
    CustomerID    NUMBER NOT NULL REFERENCES Customers(CustomerID),
    Rating        NUMBER(1) NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comments      VARCHAR2(200),
    FeedbacksDate  DATE DEFAULT SYSDATE
);

INSERT INTO Feedbacks (OrderID, CustomerID, Rating, Comments, FeedbacksDate) VALUES
(1,(SELECT CustomerID FROM Customers WHERE Name='ABC Advertising Pvt Ltd'),5,'Great print quality, on time',date'2026-06-06');
INSERT INTO Feedbacks (OrderID, CustomerID, Rating, Comments, FeedbacksDate) VALUES
(2,(SELECT CustomerID FROM Customers WHERE Name='Ravi Kumar' AND Phone='9876543218'),4,'Good but delivery was a bit late',date'2026-06-07');
INSERT INTO Feedbacks (OrderID, CustomerID, Rating, Comments, FeedbacksDate) VALUES
(4,(SELECT CustomerID FROM Customers WHERE Name='Priya Sharma' AND Address='Trichy'),5,'Loved the banner colors',date'2026-06-10');
INSERT INTO Feedbacks (OrderID, CustomerID, Rating, Comments, FeedbacksDate) VALUES
(5,(SELECT CustomerID FROM Customers WHERE Name='Bright Media Solutions'),3,'Sticker quality was average',date'2026-06-10');
INSERT INTO Feedbacks (OrderID, CustomerID, Rating, Comments, FeedbacksDate) VALUES
(7,(SELECT CustomerID FROM Customers WHERE Name='Madurai Corporation'),2,'Order was delivered late',date'2026-06-19');
INSERT INTO Feedbacks (OrderID, CustomerID, Rating, Comments, FeedbacksDate) VALUES
(8,(SELECT CustomerID FROM Customers WHERE Name='Meena Lakshmi' AND Notes='Wedding banner order'),5,'Perfect for our wedding',date'2026-06-12');

select * from Feedbacks;

COMMIT;



--AUDIT QUERIES (1,2,3,4)
-- 1 Corporate customers missing GST
SELECT CustomerID, Name, CorporateCategory, CustomerType, GSTNumber
FROM Customers
WHERE CustomerType = 'Corporate' AND GSTNumber IS NULL;

--2 Walk-in customers missing BillType
SELECT CustomerID, Name, Phone, BillType
FROM Customers
WHERE CustomerType = 'WalkIn'
  AND (BillType IS NULL OR BillType = 'N/A');

--3 Count customers by type (raw)
SELECT CustomerType, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY CustomerType;

--4 Customers with no contact info
SELECT CustomerID, Name, Email, Phone
FROM Customers
WHERE Email IS NULL AND Phone IS NULL;

--REPORT QUERIES(5,6,7,8,9)
--5 Corporate government customers (with NULL handling)
SELECT CustomerID, Name, Phone,
       NVL(GSTNumber, 'No GST Provided') AS GSTNumber,
       NVL(PurchaseOrderNo, 'No PO Issued') AS PurchaseOrderNo
FROM Customers
WHERE CustomerType = 'Corporate' AND CorporateCategory = 'Government';

--6 Walk-in customers who asked for estimates (with NULL handling)
SELECT CustomerID, Name, Phone, Address,
        Notes
FROM Customers
WHERE CustomerType = 'WalkIn' AND BillType = 'EstimateQuote';

--7 Count customers by type (with NULL handling)
SELECT NVL(CustomerType, 'Unknown') AS CustomerType,
       COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY NVL(CustomerType, 'Unknown');

--8 Unified contact list (email if available, else phone, else 'No Contact Info')
SELECT Name,
       COALESCE(Email, Phone, 'No Contact Info') AS ContactInfo
FROM Customers;

--9 Billing status using CASE
SELECT Name,
       CASE 
         WHEN GSTNumber IS NOT NULL THEN 'GST Registered'
         ELSE 'Non-GST / Estimate'
       END AS BillingStatus
FROM Customers;

--10 Online customers missing platform reference
SELECT CustomerID, Name, Platform, PlatformCustomerRef
FROM Customers
WHERE CustomerType = 'Online'
  AND (PlatformCustomerRef IS NULL OR PlatformCustomerRef = 'N/A');

--11 Customer distribution by city
SELECT Address AS City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Address
ORDER BY TotalCustomers DESC;

--12 Preferred delivery mode usage
SELECT PreferredDeliveryMode, COUNT(*) AS ModeCount
FROM Customers
GROUP BY PreferredDeliveryMode
ORDER BY ModeCount DESC;

--13 Top platforms globally
SELECT Platform, COUNT(*) AS TotalOrders
FROM Customers
WHERE CustomerType = 'Online'
GROUP BY Platform
ORDER BY TotalOrders DESC;

--14 GST vs Non‑GST split
SELECT CASE WHEN GSTNumber IS NOT NULL THEN 'GST Registered' ELSE 'Non-GST' END AS GSTStatus,
       COUNT(*) AS Total
FROM Customers
GROUP BY CASE WHEN GSTNumber IS NOT NULL THEN 'GST Registered' ELSE 'Non-GST' END;

-- Q1. How many customers of each type do we have?

SELECT CustomerType, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY CustomerType
ORDER BY TotalCustomers DESC;

-- Q2. How much revenue came in each month?

SELECT TO_CHAR(o.OrderDate, 'YYYY-MM') AS OrderMonth,
       SUM(oi.Amount) AS MonthlyRevenue
FROM Orders o
JOIN OrderItems oi ON oi.OrderID = o.OrderID
GROUP BY TO_CHAR(o.OrderDate, 'YYYY-MM')
ORDER BY OrderMonth;

-- Q3. Who are our top 5 customers by amount spent?

SELECT c.Name, SUM(oi.Amount) AS TotalSpent
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON oi.OrderID = o.OrderID
GROUP BY c.Name
ORDER BY TotalSpent DESC
FETCH FIRST 5 ROWS ONLY;

-- All Customers by their amount spent :

SELECT c.Name, SUM(oi.Amount) AS TotalSpent
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON oi.OrderID = o.OrderID
GROUP BY c.Name
ORDER BY TotalSpent DESC;

-- Q4. Which product/service brings in the most revenue?

SELECT p.ProductName, p.Category, SUM(oi.Amount) AS Revenue, COUNT(*) AS TimesOrdered
FROM OrderItems oi
JOIN Products p ON p.ProductID = oi.ProductID
GROUP BY p.ProductName, p.Category
ORDER BY Revenue DESC;

-- Q5. How does revenue split between Printing and Design?

SELECT p.Category, SUM(oi.Amount) AS Revenue
FROM OrderItems oi
JOIN Products p ON p.ProductID = oi.ProductID
GROUP BY p.Category;

-- SIMPLER ALTERNATIVE (group by Category only — one column, easy to say):

SELECT p.Category, SUM(oi.Amount) AS Revenue
FROM OrderItems oi
JOIN Products p ON p.ProductID = oi.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

-- Q6. Which material is used most, and how much revenue from it?

SELECT m.MaterialName, COUNT(*) AS TimesUsed, SUM(oi.Amount) AS RevenueFromThisMaterial
FROM OrderItems oi
JOIN Materials m ON m.MaterialID = oi.MaterialID
GROUP BY m.MaterialName
ORDER BY RevenueFromThisMaterial DESC;

-- Q7. Which materials are running low and need reordering?

SELECT MaterialName, StockQty, ReorderLevel
FROM Materials
WHERE StockQty < ReorderLevel;

-- Q8. Stock IN vs OUT for each material (from the Inventory log)

SELECT m.MaterialName,
       SUM(CASE WHEN i.MovementType='IN' THEN i.Quantity ELSE 0 END) AS TotalIn,
       SUM(CASE WHEN i.MovementType='OUT' THEN i.Quantity ELSE 0 END) AS TotalOut
FROM Inventory i
JOIN Materials m ON m.MaterialID = i.MaterialID
GROUP BY m.MaterialName;

-- Query A — total stock that came IN, per material:
SELECT m.MaterialName, SUM(i.Quantity) AS TotalIn
FROM Inventory i
JOIN Materials m ON m.MaterialID = i.MaterialID
WHERE i.MovementType = 'IN'
GROUP BY m.MaterialName;

-- Query B — total stock that went OUT, per material:
SELECT m.MaterialName, SUM(i.Quantity) AS TotalOut
FROM Inventory i
JOIN Materials m ON m.MaterialID = i.MaterialID
WHERE i.MovementType = 'OUT'
GROUP BY m.MaterialName;

-- Q9. Which machine is used the most?

SELECT mc.MachineName, COUNT(*) AS JobsRun
FROM OrderItems oi
JOIN Machines mc ON mc.MachineID = oi.MachineID
GROUP BY mc.MachineName
ORDER BY JobsRun DESC;

-- Q10. Which orders were delivered LATE (after promised date)?

SELECT o.OrderID, c.Name AS CustomerName, o.PromisedDate, o.DeliveredDate
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE o.DeliveredDate IS NOT NULL
  AND o.DeliveredDate > o.PromisedDate;
  
-- Q11. Quotation outcomes — how many became real orders?

SELECT Status, COUNT(*) AS NumberOfQuotes
FROM Quotations
GROUP BY Status;

-- Q12. Which orders still have money outstanding (unpaid) (not fully paid)?

SELECT o.OrderID, c.Name AS CustomerName, SUM(oi.Amount) AS OrderTotal
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON oi.OrderID = o.OrderID
LEFT JOIN Payments p ON p.OrderID = o.OrderID
WHERE p.Status IS NULL OR p.Status IN ('Partial','Pending')
GROUP BY o.OrderID, c.Name;

-- SIMPLER ALTERNATIVE: split into two easy queries instead of one clever one.

-- Query A — total amount for every order (easy JOIN, no LEFT JOIN needed):

SELECT o.OrderID, c.Name AS CustomerName, SUM(oi.Amount) AS OrderTotal
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON oi.OrderID = o.OrderID
GROUP BY o.OrderID, c.Name
ORDER BY o.OrderID;

-- Query B — orders that have NO Payments row marked 'Full':

SELECT OrderID
FROM Orders
WHERE OrderID NOT IN (
    SELECT OrderID FROM Payments WHERE Status = 'Full'
);

-- Q13. Which sales employee brought in the most revenue?

SELECT e.Name AS EmployeeName, SUM(oi.Amount) AS RevenueGenerated
FROM Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN OrderItems oi ON oi.OrderID = o.OrderID
WHERE e.Role = 'Sales'
GROUP BY e.Name
ORDER BY RevenueGenerated DESC;

-- Q14. How many orders are Delivered / Cancelled / In Progress?

SELECT Status, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Status;

-- Q15. Average days from order to delivery

SELECT ROUND(AVG(DeliveredDate - OrderDate), 1) AS AvgDaysToDeliver
FROM Orders
WHERE DeliveredDate IS NOT NULL;

-- Q16. Which delivery mode do customers prefer?

SELECT PreferredDeliveryMode, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY PreferredDeliveryMode
ORDER BY TotalCustomers DESC;

-- Q17. Deliveries handled by each courier partner

SELECT dp.PartnerName, COUNT(*) AS DeliveriesHandled
FROM Deliveries d
JOIN DeliveryPartners dp ON dp.PartnerID = d.DeliveryPartnerID
GROUP BY dp.PartnerName
ORDER BY DeliveriesHandled DESC;

-- Query A — see the raw delivery rows that used a courier partner:
SELECT OrderID, DeliveryPartnerID, DeliveryMode
FROM Deliveries
WHERE DeliveryPartnerID IS NOT NULL;

-- Query B — now just count and match names:
SELECT dp.PartnerName, COUNT(*) AS DeliveriesHandled
FROM Deliveries d, DeliveryPartners dp
WHERE d.DeliveryPartnerID = dp.PartnerID
GROUP BY dp.PartnerName;

-- Q18. Average rating + which orders scored low (3 or below)

SELECT ROUND(AVG(Rating), 1) AS AverageRating, COUNT(*) AS TotalFeedbackss
FROM Feedbacks;

SELECT f.OrderID, c.Name AS CustomerName, f.Rating, f.Comments
FROM Feedbacks f
JOIN Customers c ON c.CustomerID = f.CustomerID
WHERE f.Rating <= 3;

-- Q18 ALTERNATIVE — Average rating (already simple, shown for comparison)

SELECT AVG(Rating) AS AverageRating
FROM Feedbacks;

-- Q19. Customers by city

SELECT Address AS City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Address
ORDER BY TotalCustomers DESC;

-- 1. SECOND HIGHEST spender (a VERY common interview question:
--    "find the Nth highest value")

SELECT c.Name, SUM(oi.Amount) AS TotalSpent
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON oi.OrderID = o.OrderID
GROUP BY c.Name
ORDER BY TotalSpent DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

-- 2. RANK customers by how much they've spent

SELECT c.Name,
       SUM(oi.Amount) AS TotalSpent,
       RANK() OVER (ORDER BY SUM(oi.Amount) DESC) AS SpendRank
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON oi.OrderID = o.OrderID
GROUP BY c.Name;

-- 3. Most recent order for each customer

SELECT CustomerName, OrderID, OrderDate FROM (
    SELECT c.Name AS CustomerName, o.OrderID, o.OrderDate,
           ROW_NUMBER() OVER (PARTITION BY c.CustomerID ORDER BY o.OrderDate DESC) AS rn
    FROM Customers c
    JOIN Orders o ON o.CustomerID = c.CustomerID
)
WHERE rn = 1;

-- 4. Customers who have NEVER placed an order

SELECT c.Name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID
);

-- 5. Orders that are ABOVE the average order value

SELECT OrderID, OrderTotal FROM (
    SELECT o.OrderID, SUM(oi.Amount) AS OrderTotal
    FROM Orders o JOIN OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY o.OrderID
)
WHERE OrderTotal > (
    SELECT AVG(OrderTotal) FROM (
        SELECT SUM(oi.Amount) AS OrderTotal
        FROM Orders o JOIN OrderItems oi ON oi.OrderID = o.OrderID
        GROUP BY o.OrderID
    )
);

-- 6. Running total of revenue over time (cumulative sum)

SELECT OrderDate, DailyRevenue,
       SUM(DailyRevenue) OVER (ORDER BY OrderDate) AS RunningTotal
FROM (
    SELECT o.OrderDate, SUM(oi.Amount) AS DailyRevenue
    FROM Orders o JOIN OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY o.OrderDate
);

-- 7. What PERCENTAGE of total revenue does each product make up?

SELECT p.ProductName,
       SUM(oi.Amount) AS Revenue,
       ROUND(SUM(oi.Amount) * 100.0 / (SELECT SUM(Amount) FROM OrderItems), 1) AS PctOfTotalRevenue
FROM OrderItems oi
JOIN Products p ON p.ProductID = oi.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

-- 8. Find customers with DUPLICATE phone numbers (data quality check)

SELECT Phone, COUNT(*) AS TimesUsed
FROM Customers
WHERE Phone IS NOT NULL
GROUP BY Phone
HAVING COUNT(*) > 1;

-- 9. Month-over-month revenue growth

SELECT OrderMonth, MonthlyRevenue,
       LAG(MonthlyRevenue) OVER (ORDER BY OrderMonth) AS PrevMonthRevenue,
       MonthlyRevenue - LAG(MonthlyRevenue) OVER (ORDER BY OrderMonth) AS ChangeFromPrevMonth
FROM (
    SELECT TO_CHAR(o.OrderDate,'YYYY-MM') AS OrderMonth, SUM(oi.Amount) AS MonthlyRevenue
    FROM Orders o JOIN OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY TO_CHAR(o.OrderDate,'YYYY-MM')
);

-- 10. Employees who have NEVER handled an order (idle staff check)

SELECT Name, Role
FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders WHERE EmployeeID IS NOT NULL);

