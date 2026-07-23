create database BankingDB;
show databases;
use BankingDB;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone bigint,
    AccountCreationDate DATE
);


describe customers;
select * from customers;

use BankingDB;
Create table Accounts (
AccountID INT,
AccountType varchar(20),
Balance decimal(10,2)
);
show databases;
describe Accounts;
select * from Accounts;
 
alter table Accounts
add CustomerID int; 
 
alter table Accounts
add constraint FK_Accounts_Customers
foreign key (CustomerID)
references Customers(CustomerID);

create table Transactions (
TransactionID INT,
TransacionDate date,
Amount decimal(10,2),
TransactionType varchar(20)
);
desc Transactions;
select * from Transactions;

show tables;
CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
create table AccountBranches (
AssigmentDate date
);
CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
alter table Customers
add DateOfBirth date;
select * from Customers;
alter table Customers
add Location varchar(100) after Lastname;
alter table Customers
modify Phone varchar(20);
desc Customers;



alter table Accounts
add constraint FK_Accounts_Customers
foreign key (CustomerID)
references Customers (CustomerID);

