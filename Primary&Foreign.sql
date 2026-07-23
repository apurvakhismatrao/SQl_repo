CREATE DATABASE company;
USE company;
CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT
);
use company;
CREATE TABLE projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Employee_ID INT,
    
  FOREIGN KEY (Employee_ID) 
    REFERENCES Employee(ID)
    ON UPDATE CASCADE
    ON DELETE CASCADE 
);
INSERT INTO Employee (ID, Name, Age) 
VALUES
(101, 'Alice Smith', 30),
(102, 'Bob Jones', 28);
INSERT INTO projects (Project_ID, Project_Name, Employee_ID) 
VALUES
(1, 'Website Redesign', 101),
(2, 'Cloud Migration', 101),
(3, 'Mobile App', 102);
UPDATE Employee 
SET ID = 111
WHERE ID = 101;

DELETE FROM Employee 
WHERE ID = 111;
desc Employee;
select * from Employee;

desc projects;
select * from projects;