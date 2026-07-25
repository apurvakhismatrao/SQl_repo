CREATE DATABASE BankingDB1;
USE BankingDB1;

-- create table structure--
CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR (15)
);
desc Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);
desc Accounts;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);
desc Transactions;

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
desc Branches;

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);
desc AccountBranches;

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
desc Loans;



ALTER TABLE Customers
ADD DateOfBirth DATE;
desc Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);
desc Customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);
desc Accounts;

DROP TABLE AccountBranches;
desc AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);
desc Customers;

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);
desc Accounts;

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;
desc Customers;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);
desc Customers;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');
desc Customers;
select * from Customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);
desc Accounts;
select * from Accounts;


UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;
SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;
SELECT * FROM Customers
WHERE CustomerID = 101;

DELETE FROM Accounts
WHERE AccountID = 201;
SELECT * FROM Accounts;

SELECT * FROM Customers;