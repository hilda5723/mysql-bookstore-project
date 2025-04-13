-- CREATE DATABASE BookStoreDB;
USE BookStoreDB;

-- 1. Books Table
CREATE TABLE Books(
Book_Id INT PRIMARY KEY AUTO_INCREMENT,
Title VARCHAR(255),
Category VARCHAR(100),
Price DECIMAL(10,2) CHECK(Price>0),
Pub_Id INT,
Quantity INT,
FOREIGN KEY(Pub_Id) REFERENCES Publishers(Pub_ID)
);

-- 2. Authors Table
CREATE TABLE Authors(
Author_Id INT PRIMARY KEY AUTO_INCREMENT,
AuthorName VARCHAR(100),
AuthorAddress VARCHAR(100)
);

-- 3. Book_Author Table
CREATE TABLE Book_Author(
Book_Author_ID INT PRIMARY KEY AUTO_INCREMENT,
Book_ID INT,
Author_ID INT,
FOREIGN KEY (Book_ID) REFERENCES Books(Book_Id),
FOREIGN KEY (Author_ID) REFERENCES Authors(Author_Id)
);

-- 4. Publishers Table
CREATE TABLE Publishers(
Pub_ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100),
Address VARCHAR(100)
);


CREATE TABLE Book_language(
Language_Id INT PRIMARY KEY AUTO_INCREMENT,
Language VARCHAR(50)
);

-- 5. Address Table
CREATE TABLE Address(
Address_Id INT PRIMARY KEY AUTO_INCREMENT,
Address VARCHAR(100),
CountryID INT,
FOREIGN KEY(CountryID) REFERENCES  Country(Country_Id)
);

-- 6. Customers Table
CREATE TABLE Customers(
Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
CustomerName VARCHAR(100),
CustomerNumber VARCHAR(30)
);

-- 7. Customer_Address Table
CREATE TABLE Customer_Address(
CustomerAddress_Id INT PRIMARY KEY AUTO_INCREMENT,
AddressID INT,
StatusID INT,
CustomerID INT,
FOREIGN KEY (AddressID) REFERENCES Address(Address_Id),
FOREIGN KEY (CustomerID) REFERENCES Customers(Customer_Id),
FOREIGN KEY (StatusID) REFERENCES Address_Status(Status_Id)
);

-- 8. Address_Status Table
CREATE TABLE Address_Status(
Status_Id INT PRIMARY KEY AUTO_INCREMENT,
AddressID INT,
AddressStatus TEXT,
FOREIGN KEY (AddressID) REFERENCES Address(Address_Id)
);

-- 9. Country Table
CREATE TABLE Country(
Country_Id INT PRIMARY KEY AUTO_INCREMENT,
CountryName  VARCHAR(255)
);

-- 11. Shipping_Method Table
CREATE TABLE Shipping_Method(
Method_Id INT PRIMARY KEY AUTO_INCREMENT,
Method VARCHAR(40)
);

-- 12. Cust_Order Tabel
CREATE TABLE Cust_Order(
Order_Id INT PRIMARY KEY AUTO_INCREMENT,
OrderDate DATE,
TotalPrice DECIMAL(10,2) CHECK(TotalPrice>0),
BookID INT,
ShippingID INT,
StatusID INT,
HistoryID INT,
FOREIGN KEY(BookID) REFERENCES Books(Book_Id),
FOREIGN KEY(ShippingID) REFERENCES Shipping_Method(Method_Id),
FOREIGN KEY(StatusID) REFERENCES Order_Status(OrderStatus_Id),
FOREIGN KEY(HistoryID) REFERENCES Order_History(History_Id)
);

-- 13. Order_line Table
CREATE TABLE Order_Line(
Line_Id INT PRIMARY KEY AUTO_INCREMENT,
BookID INT,
OrderID INT,
FOREIGN KEY(BookID) REFERENCES Books(Book_Id),
FOREIGN KEY(OrderID) REFERENCES Cust_Order(Order_Id)
);

-- 14. Order_History Table
CREATE TABLE Order_History(
History_Id INT PRIMARY KEY AUTO_INCREMENT,
OrderHistory TEXT
);

-- 15. Order_Status Table
CREATE TABLE Order_Status(
OrderStatus_Id INT PRIMARY KEY AUTO_INCREMENT,
OrderStatus TEXT
);


