--Average time to service vehicle, overall and per service/repair requested, and / or given mechanic

SELECT AVG(`EstimateTime`) FROM job;
SELECT * FROM job WHERE `JobID` = 1 and `Estimate Time` = '240' and `Actual time` = '360'; 

--A stock control system is needed to find a part, price it up, and update the stock level.

SELECT * FROM stock WHERE `StockID` = 2 and `Price` = '1.30' and `Quantity` = '12';

--Updating database
UPDATE `stock` SET `Year`= '2008-2012' WHERE `PartID` = 4;

--Deleting item from database
DELETE FROM `vehicle` WHERE `VehicleID` = 8;

--Insert 
INSERT INTO `vehicle`(`VehicleID`, `RegNo`, `Make`, `Model`, `EngSerial`, `ChassisNo`, `Colour`, `CustomerID`) VALUES (8,'DF05 POT', 'Opel', 'Vectra Estate', '567437965', '34672876', 'Blue', 4);

--Customer Vehicle Record
SELECT DISTINCT Vehicles.VehicleID, Vehicles.RegNo, Vehicles.Make, Vehicles.Engserial, 
Vehicles.ChassisNo, Vehicles.Colour, Vehicles.Type, Vehicles.CustomerID
	FROM Vehicles
	INNER JOIN Customer
	ON Vehicles.CustomerID = Customer.CustomerID
	WHERE Vehicles.CustomerID = 3;

--Job Sheet
SELECT Jobs.JobID, Jobs.DateBookedIn, 
Jobs.DescriptionOfJob, Jobs.EstimateTime, 
Jobs.ActualTime, Jobs.DescriptionWorkCarriedOut, 
Jobs.DateCompleted,Customer.Forename,Customer.Surname,
Customer.Telephone, Vehicles.RegNo , Vehicles.Make, Vehicles.Model
FROM Jobs
JOIN Customer
ON Jobs.CustomerID = Customer.CustomerID
JOIN Vehicles
ON Customer.CustomerID = vehicles.CustomerID
WHERE Jobs.JobID = 1;

SELECT Jobs.JobID, Tasks.TaskDescription, Stock.PartID, Tasks.QuantityUsed
From Jobs
JOIN Tasks
ON Jobs.JobID = Tasks.JobID
JOIN Stock
ON Tasks.StockID = Stock.StockID
WHERE Jobs.JobID = 1;

--Statments separated works better
SELECT Jobs.JobID, Jobs.DateBookedIn, 
Jobs.DescriptionOfJob, Jobs.EstimateTime, 
Jobs.ActualTime, Jobs.DescriptionWorkCarriedOut, 
Jobs.DateCompleted,Customer.Forename,Customer.Surname,
Customer.Telephone, Vehicles.RegNo , Vehicles.Make, Vehicles.Model,
Tasks.TaskDescription, Tasks.PartID, Tasks.QuantityUsed
FROM Jobs
JOIN Customer
ON Jobs.CustomerID = Customer.CustomerID
JOIN Vehicles
ON Customer.CustomerID = vehicles.CustomerID
JOIN Tasks
ON Jobs.JobID = Tasks.JobID
WHERE Jobs.JobID = 1;

--Invoice
SELECT Jobs.JobID, 
Jobs.DescriptionWorkCarriedOut, 
Customer.Forename, Customer.Surname, 
Vehicles.RegNo, Vehicles.Make, Vehicles.Model
FROM Jobs
JOIN Customer
ON Jobs.CustomerID = Customer.CustomerID
JOIN Vehicles
ON Customer.CustomerID = vehicles.CustomerID
WHERE Jobs.JobID = 1;

SELECT Jobs.JobID, Stock.PartName, Stock.PartID, Stock.Price, Tasks.QuantityUsed 
FROM Jobs
JOIN Tasks
ON Jobs.JobID = Tasks.JobID
JOIN Stock
ON Tasks.StockID = Stock.StockID
WHERE Jobs.JobID = 1;

--This works but stops displaying all values
SELECT Jobs.JobID, Stock.PartName, Stock.PartID, Stock.Price, Tasks.QuantityUsed,SUM(Stock.price) AS Total
From Jobs
JOIN Tasks
ON Jobs.JobID = Tasks.JobID
JOIN Stock
ON Tasks.StockID = Stock.StockID
WHERE Jobs.JobID = 1;

--Stock Ledger
 SELECT Stock.PartName, Stock.PartID, Stock.Manufacturer, Stock.Model, Stock.Year, Stock.Price, Stock.Quantity
 FROM Stock;

 --Spare Parts Report
SELECT Stock.PartName, Stock.PartID, Stock.Manufacturer, Stock.Model, 
Stock.Year, Stock.Price, Tasks.InitialStockLevel, Tasks.QuantityUsed, Stock.Quantity,
Stock.Threshold
FROM Tasks
JOIN Stock
ON Tasks.StockID = Stock.StockID
JOIN Jobs
ON Tasks.JobID = Jobs.JobID
WHERE Tasks.JobID = 1;

--Creating tables
Create DATABASE GARITS;

Create TABLE Customer 
(
CustomerID int NOT NULL AUTO_INCREMENT,
CompanyName varchar(50),
Title varchar(20) NOT NULL,
Forename varchar(50) NOT NULL,
Surname varchar(50) NOT NULL,
HouseNoOrName varchar(50) NOT NULL,
BuildingName varchar(50),
StreetName varchar(50) NOT NULL,
TownOrCity varchar(50),
Area varchar(50),
Postcode varchar(20)NOT NULL,
Telephone varchar(20),
Mobile varchar(20),
Fax varchar(20),
Email varchar(50),
Discount int(20),
PRIMARY KEY (CustomerID)
);

Create TABLE Vehicles 
(
VehicleID int NOT NULL AUTO_INCREMENT,
RegNo varchar(10) NOT NULL, 
Make varchar(10) NOT NULL,
Model varchar(10),
Engserial varchar(15),
ChassisNo varchar(15),
Colour varchar(15) NOT NULL,
Type varchar (10) NOT NULL,
CustomerID int NOT NULL,
PRIMARY KEY (VehicleID), 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


Create TABLE Staff
(
StaffID int NOT NULL AUTO_INCREMENT,
Forename varchar(50) NOT NULL ,
Surname varchar(50) NOT NULL,
JobRole varchar(25) NOT NULL,
LabourRate int(20),
Login Varchar(50) NOT NULL,
Password varchar(20)NOT NULL,
PRIMARY KEY (StaffID)
);



Create TABLE Stock
(
StockID int NOT NULL AUTO_INCREMENT,
PartName varchar(100) NOT NULL,
PartType varchar(100),
Make varchar(50)NOT NULL,
Model varchar(50)NOT NULL,
Quantity int(20) NOT NULL,
Threshold int(20) NOT NULL,
Price float(20) NOT NULL,
Manufacturer varchar(50),
Year varchar(10),
Delivery int(10),
PartID varchar(50),
PRIMARY KEY (StockID)
);


Create TABLE Suppliers
(
SupplierID int NOT NULL AUTO_INCREMENT,
CompanyName varchar(50),
HouseNoOrName varchar(50) NOT NULL,
BuildingName varchar(50),
StreetName varchar(50) NOT NULL,
TownOrCity varchar(50),
Area varchar(50),
Postcode varchar(20)NOT NULL,
Telephone varchar(20),
Fax varchar(20),
PRIMARY KEY (SupplierID)
);

Create TABLE Orders
(
OrderID int NOT NULL AUTO_INCREMENT,
OrderQuantity int(20) NOT NULL,
StockID int,
SupplierID int NOT NULL,
Price float(20) NOT NULL,
PRIMARY KEY (OrderID),
FOREIGN KEY (StockID) REFERENCES Stock(StockID),
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

Create TABLE Jobs
(
JobID int NOT NULL AUTO_INCREMENT,
DateBookedIn date NOT NULL,
Type varchar(10) NOT NULL,
DescriptionOfJob varchar(255) NOT NULL,
EstimateTime time NOT NULL,
ActualTime time,
DescriptionWorkCarriedOut varchar(255),
DateCompleted date,
VehicleID int NOT NULL,
StaffID int,
CustomerID int NOT NULL,
PRIMARY KEY (JobID),
FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

Create TABLE Tasks
(
TaskID int NOT NULL AUTO_INCREMENT,
TaskDescription varchar(255) NOT NULL,
InitialStockLevel int(10),
QuantityUsed int(10),
JobID int NOT NULL,
StockID int,
PRIMARY KEY (TaskID),
FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);