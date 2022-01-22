CREATE TABLE rw_Product
    (
        ProductID INT NOT NULL sortkey distkey,
        Name NVARCHAR(50) NOT NULL ,
        ProductNumber NVARCHAR(25) NOT NULL,
        MakeFlag INT NOT NULL ,
        FinishedGoodsFlag INT NOT NULL ,
        Color NVARCHAR(15) NOT NULL ,
        SafetyStockLevel INT NOT NULL ,
        ReorderPoint INT NOT NULL ,
        StandardCost NUMERIC(15, 2) NULL ,
        ListPrice NUMERIC(15, 2) NULL , 
        Size NVARCHAR(50) NULL ,
        SizeUnitMeasureCode NVARCHAR(15) NULL ,
        WeightUnitMeasureCode NVARCHAR(15) NULL ,
        Weight FLOAT NULL ,
        DaysToManufacture INT NOT NULL ,
        ProductLine NCHAR(2) NULL ,
        Class NCHAR(2) NULL ,
        Style NCHAR(2) NULL ,
        ProductSubcategoryID INT NULL ,
        ProductModelID INT NULL ,
        SellStartDate DATETIME NULL ,
        SellEndDate DATETIME NULL ,
        DiscontinuedDate DATETIME NULL ,
        rowguid NVARCHAR(400) NULL ,
        ModifiedDate DATE NOT NULL ,
        CONSTRAINT PK_rw_Product_ProductID PRIMARY KEY ( ProductID )
    );

CREATE TABLE rw_SpecialOfferProduct 
    (
        SpecialOfferID INT NOT NULL ,
        ProductID INT NOT NULL sortkey distkey,
        rowguid NVARCHAR(400) NULL ,
        ModifiedDate DATE NOT NULL ,
        CONSTRAINT PK_rw_SpecialOfferProduct PRIMARY KEY ( SpecialOfferID, ProductID )
    );

CREATE TABLE rw_SalesOrderDetail 
    (
        SalesOrderID INT NOT NULL sortkey distkey,
        SalesOrderDetailID INT NOT NULL ,
        CarrierTrackingNumber NVARCHAR(25) NULL ,
        OrderQty INT NOT NULL ,
        ProductID INT NOT NULL ,
        SpecialOfferID INT NOT NULL ,
        UnitPrice NUMERIC(15, 2) NOT NULL ,
        UnitPriceDiscount FLOAT NOT NULL ,
        LineTotal NUMERIC(15, 2) NOT NULL ,
        rowguid NVARCHAR(400) NULL ,
        ModifiedDate DATE NOT NULL ,
        CONSTRAINT PK_rw_SalesOrderDetail PRIMARY KEY ( SalesOrderID, SalesOrderDetailID)
    );

CREATE TABLE rw_SalesOrderHeader 
    (
        SalesOrderID INT NOT NULL sortkey distkey ,
        RevisionNumber INT NOT NULL ,
        OrderDate NVARCHAR(50) NULL ,
        DueDate DATETIME NULL ,
        ShipDate DATETIME NULL ,
        Status NVARCHAR(7) NULL ,
        OnlineOrderFlag INT NOT NULL ,
        SalesOrderNumber NVARCHAR(20) NOT NULL ,
        PurchaseOrderNumber NVARCHAR(20) NULL ,
        AccountNumber NVARCHAR(25) NOT NULL ,
        CustomerID INT NOT NULL ,
        SalesPersonID INT NULL ,
        TerritoryID INT NOT NULL ,
        BillToAddressID INT NOT NULL ,
        ShipToAddressID INT NOT NULL ,
        ShipMethodID INT NOT NULL ,
        CreditCardID INT NULL ,
        CreditCardApprovalCode NVARCHAR(25) NULL ,
        CurrencyRateID INT NULL ,
        SubTotal NUMERIC(15, 2) NOT NULL ,
        TaxAmt NUMERIC(15, 2) NOT NULL ,
        Freight NUMERIC(15, 2) NOT NULL ,
        TotalDue NUMERIC(15, 2) NOT NULL ,
        Comment NVARCHAR(120) NULL ,
        rowguid NVARCHAR(400) NULL ,
        ModifiedDate DATE NOT NULL ,
        CONSTRAINT PK_rw_SalesOrderHeader_SalesOrderID PRIMARY KEY ( SalesOrderID )
        
    );

CREATE TABLE rw_Customer 
    (
        CustomerID INT NOT NULL ,
        PersonID INT NULL ,
        StoreID INT NULL ,
        TerritoryID INT NOT NULL,
        AccountNumber NVARCHAR(25) NOT NULL ,
        rowguid NVARCHAR(400) NULL ,
        ModifiedDate DATE NOT NULL ,
        CONSTRAINT PK_rw_Customer_CustomerID PRIMARY KEY ( CustomerID )
    );

CREATE TABLE rw_Person 
    (
        BusinessEntityID INT NOT NULL ,
        PersonType NVARCHAR(5) NOT NULL ,
        NameStyle  NULL ,
        Title NVARCHAR(8) NULL ,
        FirstName NVARCHAR(50) NULL ,
        MiddleName NVARCHAR(50) NULL ,
        LastName NVARCHAR(50) NULL ,
        Suffix NVARCHAR(10) NULL ,
        EmailPromotion NVARCHAR(50) NULL ,
        AdditionalContactInfo NVARCHAR(1000) NULL ,
        Demographics NVARCHAR(1000) NULL ,
        rowguid NVARCHAR(400) NULL ,
        ModifiedDate DATE NOT NULL ,
        CONSTRAINT PK_rw_Person_BusinessEntityID PRIMARY KEY ( BusinessEnty )
        );
