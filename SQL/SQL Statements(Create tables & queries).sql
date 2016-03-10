--Average time to service vehicle, overall and per service/repair requested, and / or given mechanic

SELECT AVG(`EstimateTime`) FROM job;
SELECT * FROM job WHERE `JobID` = 1 and `Estimate Time` = '240' and `Actual time` = '360'; 

--A stock control system is needed to find a part, price it up, and update the stock level.

SELECT * FROM stock WHERE `PartID` = 2 and `Price` = '1.30' and `Quantity` = '12';

--Updating database
UPDATE `stock` SET `Year`= '2008-2012' WHERE `PartID` = 4;

--Deleting item from database
DELETE FROM `vehicle` WHERE `VehicleID` = 8;

--Insert 
INSERT INTO `vehicle`(`VehicleID`, `RegNo`, `Make`, `Model`, `EngSerial`, `ChassisNo`, `Colour`, `CustomerID`) VALUES (8,'DF05 POT', 'Opel', 'Vectra Estate', '567437965', '34672876', 'Blue', 4);


--Creating tables

Create TABLE staff
(
StaffID int NOT NULL AUTO_INCREMENT,
StaffPosition varchar(255) NOT NULL,
Forename varchar(255) NOT NULL ,
Surname varchar(255) NOT NULL,
Address Varchar(255) NOT NULL,
Telephone varchar(20),
Email varchar(255),
PRIMARY KEY (StaffID
);

Create TABLE Customer 
(CustomerID int NOT NULL AUTO_INCREMENT,
Forename varchar(255) NOT NULL,
Surname varchar(255) NOT NULL,
Address varchar(255) NOT NULL,
Telephone varchar(11),
Email varchar(255),
CustomerType varchar(255),
PRIMARY KEY (CustomerID)
);

Create TABLE Account Holder
(
Discount int(10) NOT NULL,
);

Create TABLE Company
(
CompanyName varchar(10) NOT NULL,
);

Create TABLE Vehicles 
(
VehicleID int NOT NULL AUTO_INCREMENT,
RegNo varchar(10) NOT NULL, 
Make varchar(10) NOT NULL,
Model varchar(10) NOT NULL,
Engserial int(9) NOT NULL,
ChassisNo int(8) NOT NULL,
Colour varchar(10) NOT NULL,
FOREIGN KEY CustomerCustomerID int(10),
PRIMARY KEY (VehicleID) 
);




Create TABLE Tasks
(
TaskNo int NOT NULL AUTO_INCREMENT,
Task varchar(255) NOT NULL,
InitialStockLevel int(10) NOT NULL,
Quantity int(10) NOT NULL,
JobSheetJobNo int(10) NOT NULL,
PRIMARY KEY (TaskNo)
);

Create TABLE Jobs
(JobID int NOT NULL AUTO_INCREMENT,
DateBookedIn date NOT NULL,
Type varchar(10) NOT NULL,
DescriptionOfJob varchar(255) NOT NULL,
EstimateTime time(7) NOT NULL,
ActualTime time(7) NOT NULL,
DescriptionWorkCarriedOut varchar(255) NOT NULL,
DateCompleted date NOT NULL,
FOREIGN KEY VehiclesVehicleID int(10),
FOREIGN KEY staffStaffID int(10),
FOREIGN KEY CustomerCustomerID int(10),
PRIMARY KEY (JobID)
);

Create TABLE Stock
(
PartID int NOT NULL AUTO_INCREMENT,
Type varchar(255) NOT NULL,
Name varchar(255) NOT NULL,
Model varchar(255) NOT NULL,
Make varchar(255) NOT NULL,
Price double(10) NOT NULL,
Quantity int(10) NOT NULL,
Manufacturer varchar(255) NOT NULL,
Year int(10) NOT NULL,
LowLevelThreshold int(10) NOT NULL,
Delivery int(10) NOT NULL,
PRIMARY KEY (PartID)
);

