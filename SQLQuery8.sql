Create Database MyPizzaBox;

use MyPizzaBox;
CREATE TABLE LoginTable(
UserName Varchar(45),
PassPin Int,
);

CREATE TABLE PizzaStore(
PizzaStoreID int IDENTITY(1,1) PRIMARY KEY not null,
PizzaStoreName VARCHAR (45) not null,
PizzaStoreLocation VARCHAR(45) not null, 
);

CREATE TABLE Customer(
CustomerID INT IDENTITY(1,1) PRIMARY KEY not null,
PizzaStoreID INT NOT NULL,
First VARCHAR(45),
Last VARCHAR(45) not null,
Phone VARCHAR(10) not null,


CONSTRAINT FK_Cus_PizzaStoreID
    FOREIGN KEY (PizzaStoreID)
    REFERENCES PizzaStore (PizzaStoreID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Orders(
OrderID INT IDENTITY(1,1) PRIMARY KEY not null,
PizzaStoreID INT,
CustomerID INT,
Total FlOAT,
OrderTime Time(0) not null,

CONSTRAINT FK_Ord_PizzaStoreID
    FOREIGN KEY (PizzaStoreID) 
	REFERENCES PizzaStore(PizzaStoreID)
    ON DELETE CASCADE
	ON UPDATE CASCADE,

CONSTRAINT FK_Ord_CustomerID
    FOREIGN KEY (CustomerID) 
    REFERENCES Customer(CustomerID)
    ON DELETE NO ACTION
	ON UPDATE NO ACTION,

);

Alter table orders drop  FK_Ord_CustomerID;

CREATE TABLE Pizza(
PizzaID INT IDENTITY(1,1) PRIMARY KEY not null,
PizzaStoreID INT, 
OrderID INT, 
PizzaType VARCHAR(45) not null,
PizzaSize VARCHAR(45) not null,
PizzaCrust VARCHAR(45) not null,
PizzaPrice FLOAT,

CONSTRAINT FK_Pizza_PizzaStoreID
    FOREIGN KEY (PizzaStoreID) REFERENCES PizzaStore(PizzaStoreID)
    ON DELETE CASCADE
	ON UPDATE CASCADE,


CONSTRAINT FK_Pizza_OrderID
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
    ON DELETE NO ACTION
	ON UPDATE NO ACTION,

);

INSERT INTO LoginTable(UserName, PassPin) VALUES('Therese', 3333);
INSERT INTO LoginTable(UserName, PassPin) VALUES('Test', 1111);
Select * From LoginTable;

use MyPizzaBox;
INSERT INTO PizzaStore(PizzaStoreName,PizzaStoreLocation) VALUES('Loo PIZZA', 'Manhattan');
INSERT INTO PizzaStore(PizzaStoreName,PizzaStoreLocation) VALUES('Sikes PIZZA', 'Manhattan');
INSERT INTO PizzaStore(PizzaStoreName,PizzaStoreLocation) VALUES('Tees PIZZA', 'Addison');
Select * From PizzaStore;

use MyPizzaBox;
INSERT INTO Customer(PizzaStoreID, First, Last, Phone) VALUES(1, 'Mary', 'Poppins', '1111111111' );
INSERT INTO Customer(PizzaStoreID, First, Last, Phone) VALUES(1, 'Tweety', 'Bird', '222222222' );

INSERT INTO Customer(PizzaStoreID, First, Last, Phone) VALUES(2, 'Daffy', 'Duck', '3333333333' );
INSERT INTO Customer(PizzaStoreID, First, Last, Phone) VALUES(2, 'Donald', 'Duck', '4444444444' );

INSERT INTO Customer(PizzaStoreID, First, Last, Phone) VALUES(3, 'Daffy', 'Duck', '5555555555' );
INSERT INTO Customer(PizzaStoreID, First, Last, Phone) VALUES(3, 'Big', 'Bird', '6666666666' );

Select * From Customer;

use MyPizzaBox;;
INSERT INTO Orders(PizzaStoreID, CustomerID, Total, OrderTime) VALUES(1,1,5.00, '08:00' );
INSERT INTO Orders(PizzaStoreID, CustomerID, Total, OrderTime) VALUES(1,1,20.00, '09:00' );

INSERT INTO Orders(PizzaStoreID, CustomerID, Total, OrderTime) VALUES(1,2,7.00,'09:00' );

INSERT INTO Orders(PizzaStoreID, CustomerID, Total, OrderTime) VALUES(2,3,9.00,'10:00');
INSERT INTO Orders(PizzaStoreID, CustomerID, Total, OrderTime) VALUES(2,4,15.00,'11:00');

INSERT INTO Orders(PizzaStoreID, CustomerID, Total, OrderTime) VALUES(3,5,9.00,'12:00');
INSERT INTO Orders(PizzaStoreID, CustomerID, Total, OrderTime) VALUES(3,6,15.00,'13:00');
Select * From Orders;


use MyPizzaBox;;
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,1,'California', 'crust', 'small', 5.00 );
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,2,'Pepperoni', 'crust', 'Medium', 7.00 );
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,3,'French', 'crust', 'Large', 12.00 );
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,1,'California', 'crust', 'small', 5.00 );
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,2,'Italian', 'crust', 'Medium', 7.00 );
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,3,'Cheese', 'crust', 'Large', 12.00 );
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,1,'Ham Pizza', 'crust', 'Large', 12.00 );

Select * From Pizza;

--There should exist at least one store -DONE
Select * From PizzaStore;
--Store should be able to view it's completed orders -DONE
Select * From Orders Where PizzaStoreID = 1; 

--Order should be able to view its pizzas --DONE
Select * From Pizza where OrderID = 1;
--Order should be able to compute its cost --DONE
Select SUM(PizzaPrice) 
FROM Pizza WHERE OrderID = 1;
--Order Should be able to limit its cost to no more than $250; --BUSINESS LOGIC

--Pizza should be able to have a crust -DONE
Select * From Pizza;
--Pizza should be able to have a size -DONE
Select * From Pizza;
--Pizza should be able to compute its cost --BUSINESS LOGIC

--User should be able to view its order history --DONE
Select * From Orders where PizzaStoreID = 2 AND CustomerID = 3;
--User should be able to only order from 1 location / 24-hour period -- BUSINESS LOGIC
--User should be able to only order if account exists-- BUSINESS LOGIC. If account does not exist, automatically add it, and then make order. 

--User should be able to sign in(e.g. online portal/app) --BUSINESS LOGIC
Insert into LoginTable(UserName,PassPin) VALUES('Therese', 3333);
Insert into LoginTable(UserName,PassPin) VALUES('Test', 1111);
Select * From LoginTable;
--User should be able to view A list of locations --DONE
Select PizzaStoreLocation From PizzaStore;
--User should be able to make an order  --DONE
INSERT INTO Orders(PizzaStoreID, CustomerID, Total) VALUES(2,1,12.00 );
INSERT INTO Orders(PizzaStoreID, CustomerID, Total) VALUES(2,1,13.00 );
INSERT INTO Pizza(PizzaStoreID, OrderID, PizzaType, PizzaCrust, PizzaSize, PizzaPrice ) VALUES(1,3,'Rugged', 'crust', 'Large', 12.00 );
Select * From Pizza, Orders;
--User should be able to choose a preset Pizza --BUSINESS LOGIC(LIST)
--User should be able to Select a crust --BUSINESS LOGIC (List e.g. thin, thick)
--User should be able to select a size -- BUSINESS LOGIC(Small, Medium, Large)

--User shuold be able to sign out -- BUSINESS LOGIC ( on a sign out, e.g. for console user can't type it "out" and the Console message will say.
--"you've been signed out. User has to sign in in order to use the app again, even if they open and close it. becuause she has to sign it anyway to use it. 


