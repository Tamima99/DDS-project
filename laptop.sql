drop table laptop CASCADE CONSTRAINTS;
drop table Branch_D CASCADE CONSTRAINTS;
drop table Customer_D CASCADE CONSTRAINTS;
drop table Seller_D CASCADE CONSTRAINTS;
drop table Record_D CASCADE CONSTRAINTS;
drop table Order_D CASCADE CONSTRAINTS;
drop table OrderDetails_D CASCADE CONSTRAINTS;



--set linesize 200;

CREATE TABLE Branch_D(
	BranchID NUMBER(5),
	BranchName VARCHAR2(50),
	Phone VARCHAR2(15),
	Email VARCHAR2(50),	
    Location VARCHAR2(50), 
	PRIMARY KEY (BranchID)
);
	
	

CREATE TABLE Customer_D(
	CID NUMBER(5),
	CName VARCHAR2(50),	
	Age NUMBER(3),
	BranchID NUMBER(5),
	PRIMARY KEY (CID),
	FOREIGN KEY (BranchID) REFERENCES Branch_D (BranchID)
);

CREATE TABLE Seller_D (
  SID NUMBER(5),
  PRIMARY KEY(SID),
  Name VARCHAR2(50)
);

create table laptop(
pid number(5),
brand varchar2(10),
graphics varchar2(35),
price number,
SID NUMBER(5),
BranchID NUMBER(5),
PRIMARY KEY(pid),
FOREIGN KEY (BranchID) REFERENCES Branch_D(BranchID),
FOREIGN KEY (SID) REFERENCES Seller_D(SID)
);

CREATE TABLE Record_D(
	pid NUMBER(5),
    BranchID NUMBER(5),
    StockQuantity NUMBER(5),
	OrderQuantity NUMBER(5),
	FOREIGN KEY (pid) REFERENCES laptop (pid),
	FOREIGN KEY (BranchID) REFERENCES Branch_D (BranchID)
);

CREATE TABLE Order_D(
	OID  NUMBER(5),
	CID  NUMBER(5),
	pid  NUMBER(5),
	brand varchar2(10),
	SID  NUMBER(5),
	PRIMARY KEY (OID),
	FOREIGN KEY (CID) REFERENCES Customer_D(CID),
	FOREIGN KEY (SID) REFERENCES Seller_D(SID),
    FOREIGN KEY (pid) REFERENCES laptop (pid)
	);
create table OrderDetails_D(
	OID  NUMBER(5),
	BranchID NUMBER(5),
	Quantity  NUMBER(5),
	TotalPrice  NUMBER(20),
	OrderDate date,
	FOREIGN KEY (OID) REFERENCES Order_D (OID),  
	FOREIGN KEY (BranchID) REFERENCES Branch_D (BranchID)	
);

CREATE OR REPLACE TRIGGER BranchTrigger
AFTER INSERT
ON Branch_D
BEGIN
   DBMS_OUTPUT.PUT_LINE('VALUES INSERTED INTO BRANCH TABLE');
END;
/

-- Insert 5 rows into Branch_D
INSERT INTO Branch_D (BranchID, BranchName, Phone, Email, Location)
VALUES (1001, 'Branch d1','111-111-1001', 'branchd1@gmail.com', 'Dhaka');

INSERT INTO Branch_D (BranchID, BranchName, Phone, Email, Location)
VALUES (1002, 'Branch d2','222-222-1001', 'branchd2@gmail.com', 'Dhaka');

INSERT INTO Branch_D (BranchID, BranchName, Phone, Email, Location)
VALUES (1003, 'Branch d3','333-333-1001', 'branchd3@gmail.com', 'Dhaka');

INSERT INTO Branch_D (BranchID, BranchName, Phone, Email, Location)
VALUES (1004, 'Branch d4','444-444-1001', 'branchd4@gmail.com', 'Dhaka');

INSERT INTO Branch_D (BranchID, BranchName, Phone, Email, Location)
VALUES (1005, 'Branch d5','555-555-1001', 'branchd5@gmail.com', 'Dhaka');


CREATE OR REPLACE TRIGGER CustomerTrigger
AFTER INSERT
ON Customer_D
BEGIN
   DBMS_OUTPUT.PUT_LINE('VALUES INSERTED INTO CUSTOMER TABLE');
END;
/
-- Insert 5 rows into Customer_D
INSERT INTO Customer_D (CID, CName, Age, BranchID)
VALUES (1001, 'Customer 1', 22, 1001);

INSERT INTO Customer_D (CID, CName, Age, BranchID)
VALUES (1002, 'Customer 2', 25, 1001);

INSERT INTO Customer_D (CID, CName, Age, BranchID)
VALUES (1003, 'Customer 3', 30, 1003);

INSERT INTO Customer_D (CID, CName, Age, BranchID)
VALUES (1004, 'Customer 4', 42, 1002);

INSERT INTO Customer_D (CID, CName, Age, BranchID)
VALUES (1005, 'Customer 5', 33, 1005);


-- Insert 5 rows into Selle_D
INSERT INTO Seller_D (SID, Name) 
VALUES (101, 'Seller d1');
INSERT INTO Seller_D (SID, Name) 
VALUES (102, 'Seller d2');
INSERT INTO Seller_D (SID, Name) 
VALUES (103, 'Seller d3');
INSERT INTO Seller_D (SID, Name) 
VALUES (104 ,'Seller d4');
INSERT INTO Seller_D (SID, Name) 
VALUES (105, 'Seller d5');




CREATE OR REPLACE TRIGGER LaptopTrigger
AFTER INSERT
ON laptop
BEGIN
   DBMS_OUTPUT.PUT_LINE('VALUES INSERTED INTO LAPTOP TABLE');
END;
/

insert into laptop(pid,brand,graphics,price,SID,BranchID) 
			values (1,'ASUS','Intel Celeron N4020',42500,101,1001);
insert into laptop(pid,brand,graphics,price,SID,BranchID)
			values (2,'HP','AMD Radeon Graphics',65000,102,1001);			
insert into laptop(pid ,brand,graphics,price,SID,BranchID)
			values (3,'MSI','GeForce MX450 GDDR5 2GB',10500,101,1002);			
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (4,'Lenovo','Integrated Intel UHD',46000,102,1003);	
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (5,'Acer','AMD Radeon',44990,103,1003);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (6,'ASUS','Intel Iris Xe',78000,104,1004);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (7,'Lenovo','AMD Radeon',89500,105,1005);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (8,'HP','Intel Iris Xe',69000,103,1005);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (9,'HP','Intel UHD Graphics 620',45500,104,1005);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (10,'Lenovo','Integrated Intel UHD',53000,101,1002);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (11,'HP','AMD Radeon Vega',64500,104,1004);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (12,'HP','Intel Iris Xe',83000,102,1003);
insert into laptop(pid , brand,graphics,price,SID,BranchID)
			values (13,'ASUS','Integrated AMD Radeon',71500,101,1005);




-- Insert 5 rows into Record_D
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(1, 1001, 10, 7);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(2, 1001, 15, 8);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(3, 1002, 7, 3);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(4, 1003, 8, 4);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(5, 1003, 9, 5);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(6, 1004, 3, 1);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(7, 1005, 2, 1);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(8, 1005, 5, 3);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(9, 1005, 4, 2);
INSERT INTO Record_D (pid, BranchID, StockQuantity, OrderQuantity) VALUES(10, 1002, 3, 1);


-- Insert 5 rows into Order_D
INSERT INTO Order_D (OID, CID, pid, brand, SID) VALUES
(1001, 1001, 1, 'ASUS' ,101);
INSERT INTO Order_D (OID, CID, pid, brand, SID) VALUES
(1002, 1002, 9, 'HP',104);
INSERT INTO Order_D (OID, CID, pid, brand, SID) VALUES
(1003, 1003, 2, 'HP' ,102);

--INSERT INTO Order_D (OID, CID, pid, brand, SID) VALUES
--(1004, 1004, 3, 'MSI' ,101);
--INSERT INTO Order_D (OID, CID, pid, brand, SID) VALUES
--(1005, 1005, 4, 'Lenovo' ,102);
--INSERT INTO Order_D (OID, CID, pid, brand, SID) VALUES
--(1001, 1001, 1, 'ASUS' ,101);


-- Insert 5 rows into OrderDetails_D
INSERT INTO OrderDetails_D (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1001, 1001, 1, 42500, '01-FEB-2022');

INSERT INTO OrderDetails_D (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1002, 1005, 2, 91000, '01-MAR-2022');

INSERT INTO OrderDetails_D (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1003, 1001, 3, 130000, '01-JAN-2022');

INSERT INTO OrderDetails_D (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1004, 1002, 1, 10500, '01-APR-2022');

INSERT INTO OrderDetails_D (OID, BranchID, Quantity, TotalPrice, OrderDate) VALUES
(1005, 1003, 2, 92000, '01-MAY-2022');

commit; 



SELECT * FROM Branch_D;
SELECT * FROM Customer_D;
SELECT * FROM Seller_D;
SELECT * FROM Record_D;
SELECT * FROM Order_D;
SELECT * FROM OrderDetails_D;
SELECT * FROM laptop;