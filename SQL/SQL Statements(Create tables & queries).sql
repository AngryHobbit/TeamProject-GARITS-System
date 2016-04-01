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
PRIMARY KEY (StockID)
);

Create TABLE PartNo
(
PartID varchar(50) NOT NULL,
StockID int NOT NULL,
PRIMARY KEY (PartID),
FOREIGN KEY (StockID) REFERENCES Stock(StockID)
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

Create TABLE Order
(
OrderID int NOT NULL AUTO_INCREMENT,
Quantity int NOT NULL,
StockID int NOT NULL,
SupplierID int NOT NULL,
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
PartID varchar(50),
PRIMARY KEY (TaskID),
FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
FOREIGN KEY (StockID) REFERENCES Stock(StockID),
FOREIGN KEY (PartID) REFERENCES PartNo(PartID)
);