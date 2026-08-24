CREATE DATABASE HR_Analysis;

USE  HR_Analysis;

SELECT DATABASE();

CREATE TABLE Departments 
(
 Department_ID INT PRIMARY KEY,
 Department_Name VARCHAR(50),
 Location VARCHAR(50)
);

DESC Departments;

INSERT INTO Departments
(Department_ID, Department_Name, Location)
VALUES
(1, 'IT', 'Mumbai'),
(2, 'HR', 'Thane'),
(3, 'Finance', 'Mumbai'),
(4, 'Sales', 'Pune'),
(5, 'Marketing', 'Navi Mumbai');

SELECT * FROM Departments;

CREATE TABLE Jobs
(
 Job_ID INT PRIMARY KEY,
 Job_Title VARCHAR(50),
 Job_Level VARCHAR(30)
);

DESC Jobs;

INSERT INTO Jobs
(Job_ID, Job_Title, Job_Level)
VALUES
(101, 'Data Analyst', 'Junior'),
(102, 'Software Developer', 'Mid'),
(103, 'HR Executive', 'Junior'),
(104, 'Accountant', 'Mid'),
(105, 'Sales Executive', 'Junior'),
(106, 'Marketing Executive', 'Junior'),
(107, 'Project Manager', 'Senior');

SELECT * FROM Jobs;

CREATE TABLE Employee
(
 Employee_ID INT PRIMARY KEY,
 First_Name VARCHAR(50),
 Last_Name VARCHAR(50),
 Gender VARCHAR(10),
 Date_Of_Birth DATE,
 Hire_Date DATE,
 Department_ID INT,
 Job_ID INT,
 Manager_ID INT,
 Salary DECIMAL(10,2),
 Location VARCHAR(50),
 FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
 FOREIGN KEY (Job_ID) REFERENCES Jobs(Job_ID)
);

DESC Employee;


INSERT INTO Employee
(Employee_ID, First_Name, Last_Name, Gender, Date_of_Birth, Hire_Date,
 Department_ID, Job_ID, Manager_ID, Salary, Location)
VALUES
(1, 'Aarav', 'Sharma', 'Male', '1998-05-12', '2021-06-15', 1, 101, 7, 45000, 'Mumbai'),
(2, 'Priya', 'Patil', 'Female', '1997-08-21', '2020-03-10', 2, 103, 7, 42000, 'Thane'),
(3, 'Rahul', 'Mehta', 'Male', '1995-11-03', '2019-01-20', 1, 102, 7, 65000, 'Mumbai'),
(4, 'Sneha', 'Joshi', 'Female', '1999-02-14', '2022-07-11', 3, 104, 7, 48000, 'Mumbai'),
(5, 'Vikram', 'Patil', 'Male', '1996-09-18', '2020-11-05', 4, 105, 7, 40000, 'Pune'),
(6, 'Neha', 'Shah', 'Female', '1998-12-25', '2021-09-13', 5, 106, 7, 43000, 'Navi Mumbai'),
(7, 'Rohan', 'Desai', 'Male', '1992-04-30', '2017-02-01', 1, 107, NULL, 90000, 'Mumbai'),
(8, 'Anjali', 'Kulkarni', 'Female', '1997-06-17', '2020-05-18', 1, 101, 7, 47000, 'Mumbai'),
(9, 'Karan', 'Gupta', 'Male', '1996-10-09', '2021-01-25', 4, 105, 7, 41000, 'Pune'),
(10, 'Pooja', 'More', 'Female', '1999-03-22', '2023-04-17', 2, 103, 7, 39000, 'Thane'),
(11, 'Aditya', 'Rane', 'Male', '1995-07-07', '2019-08-19', 3, 104, 7, 52000, 'Mumbai'),
(12, 'Isha', 'Nair', 'Female', '1998-01-29', '2022-02-14', 5, 106, 7, 44000, 'Navi Mumbai'),
(13, 'Sahil', 'Kadam', 'Male', '1997-05-05', '2021-12-01', 1, 101, 7, 46000, 'Mumbai'),
(14, 'Meera', 'Singh', 'Female', '1996-11-16', '2019-06-24', 2, 103, 7, 50000, 'Thane'),
(15, 'Akash', 'Jadhav', 'Male', '1994-08-08', '2018-10-10', 4, 105, 7, 55000, 'Pune');


SELECT * FROM Employee;

CREATE TABLE ATTENDANCEss (
    Attendance_ID INT PRIMARY KEY,
    Employee_ID INT,
    Attendance_Date DATE,
    Status VARCHAR(20),
    Working_Hours DECIMAL(4,2),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

DESC ATTENDANCEss;

INSERT INTO ATTENDANCEss
VALUES
(1, 1, '2026-08-01', 'Present', 8),
(2, 2, '2026-08-01', 'Present', 8),
(3, 3, '2026-08-01', 'Present', 9),
(4, 4, '2026-08-01', 'Absent', 0),
(5, 5, '2026-08-01', 'Present', 8),
(6, 6, '2026-08-01', 'Present', 7.5),
(7, 7, '2026-08-01', 'Present', 9),
(8, 8, '2026-08-01', 'Late', 6),
(9, 9, '2026-08-01', 'Present', 8),
(10, 10, '2026-08-01', 'Present', 8),
(11, 11, '2026-08-01', 'Present', 8.5),
(12, 12, '2026-08-01', 'Absent', 0),
(13, 13, '2026-08-01', 'Present', 8),
(14, 14, '2026-08-01', 'Late', 6.5),
(15, 15, '2026-08-01', 'Present', 8);

SELECT * FROM ATTENDANCEss;

SELECT *
FROM ATTENDANCEss
WHERE Status = 'Absent';

SELECT *
FROM ATTENDANCEss
WHERE Working_Hours > 8;

CREATE TABLE Performances (
    Performance_ID INT PRIMARY KEY,
    Employee_ID INT,
    Review_Date DATE,
    Rating DECIMAL(3,1),
    Performance_Level VARCHAR(20),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

DESC Performances;

INSERT INTO Performances
(Performance_ID, Employee_ID, Review_Date, Rating, Performance_Level)
VALUES
(1, 1, '2026-06-30', 4.2, 'Excellent'),
(2, 2, '2026-06-30', 3.8, 'Good'),
(3, 3, '2026-06-30', 4.7, 'Excellent'),
(4, 4, '2026-06-30', 3.5, 'Good'),
(5, 5, '2026-06-30', 3.2, 'Good'),
(6, 6, '2026-06-30', 4.0, 'Excellent'),
(7, 7, '2026-06-30', 4.9, 'Excellent'),
(8, 8, '2026-06-30', 3.6, 'Good'),
(9, 9, '2026-06-30', 3.1, 'Average'),
(10, 10, '2026-06-30', 3.9, 'Good'),
(11, 11, '2026-06-30', 4.4, 'Excellent'),
(12, 12, '2026-06-30', 3.7, 'Good'),
(13, 13, '2026-06-30', 4.1, 'Excellent'),
(14, 14, '2026-06-30', 4.3, 'Excellent'),
(15, 15, '2026-06-30', 3.4, 'Good');

SELECT * FROM Performances;

SELECT *
FROM Performances
WHERE Rating > 4;

SELECT *
FROM Performances
WHERE Performance_Level = 'Excellent';

SELECT MAX(Rating) AS Highest_Rating
FROM Performances;

SELECT AVG(Rating) AS Average_Rating
FROM Performances;

CREATE TABLE Leave_Record (
    Leave_ID INT PRIMARY KEY,
    Employee_ID INT,
    Leave_Type VARCHAR(30),
    Start_Date DATE,
    End_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

DESC Leave_Record;

INSERT INTO Leave_Record
(Leave_ID, Employee_ID, Leave_Type, Start_Date, End_Date, Status)
VALUES
(1, 1, 'Casual Leave', '2026-07-05', '2026-07-05', 'Approved'),
(2, 2, 'Sick Leave', '2026-07-10', '2026-07-11', 'Approved'),
(3, 3, 'Casual Leave', '2026-07-15', '2026-07-15', 'Approved'),
(4, 4, 'Sick Leave', '2026-07-20', '2026-07-22', 'Approved'),
(5, 5, 'Casual Leave', '2026-07-08', '2026-07-08', 'Rejected'),
(6, 6, 'Annual Leave', '2026-07-25', '2026-07-27', 'Approved'),
(7, 7, 'Annual Leave', '2026-07-01', '2026-07-03', 'Approved'),
(8, 8, 'Sick Leave', '2026-07-12', '2026-07-12', 'Approved'),
(9, 9, 'Casual Leave', '2026-07-18', '2026-07-19', 'Approved'),
(10, 10, 'Sick Leave', '2026-07-21', '2026-07-21', 'Rejected'),
(11, 11, 'Annual Leave', '2026-07-28', '2026-07-30', 'Approved'),
(12, 12, 'Casual Leave', '2026-07-05', '2026-07-06', 'Approved'),
(13, 13, 'Sick Leave', '2026-07-14', '2026-07-14', 'Approved'),
(14, 14, 'Annual Leave', '2026-07-22', '2026-07-24', 'Approved'),
(15, 15, 'Casual Leave', '2026-07-09', '2026-07-09', 'Approved');

SELECT * FROM Leave_Record;

SELECT *
FROM Leave_Record
WHERE Status = 'Approved';

SELECT *
FROM Leave_Record
WHERE Leave_Type = 'Sick Leave';

SELECT Leave_Type, COUNT(*) AS Total_Leaves
FROM Leave_Record
GROUP BY Leave_Type;

SELECT Status, COUNT(*) AS Total
FROM Leave_Record
GROUP BY Status;

SELECT *
FROM Employee;

SELECT First_Name, Last_Name, Salary
FROM Employee;

SELECT First_Name, Last_Name, Salary
FROM Employee
WHERE Salary > 50000;

SELECT *
FROM Employee
WHERE Department_ID = 1;

SELECT First_Name, Last_Name, Gender
FROM Employee
WHERE Gender = 'Female';

SELECT First_Name, Last_Name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT MAX(Salary) AS Highest_Salary
FROM Employee;

SELECT MIN(Salary) AS Lowest_Salary
FROM Employee;

SELECT AVG(Salary) AS Average_Salary
FROM Employee;

SELECT COUNT(*) AS Total_Employee
FROM Employee;

SELECT Department_ID, COUNT(*) AS Total_Employee
FROM Employee
GROUP BY Department_ID;

SELECT 
    d.Department_Name,
    COUNT(e.Employee_ID) AS Total_Employee
FROM Departments d
JOIN Employee e
    ON d.Department_ID = e.Department_ID
GROUP BY d.Department_Name;

SELECT 
    d.Department_Name,
    AVG(e.Salary) AS Average_Salary
FROM Departments d
JOIN Employee e
    ON d.Department_ID = e.Department_ID
GROUP BY d.Department_Name;

SELECT 
    d.Department_Name,
    MAX(e.Salary) AS Highest_Salary
FROM Departments d
JOIN Employee e
    ON d.Department_ID = e.Department_ID
GROUP BY d.Department_Name;

SELECT 
    e.First_Name,
    e.Last_Name,
    d.Department_Name
FROM Employee e
JOIN Departments d
    ON e.Department_ID = d.Department_ID;
    
    SELECT 
    e.First_Name,
    e.Last_Name,
    j.Job_Title
FROM Employee e
JOIN Jobs j
    ON e.Job_ID = j.Job_ID;
    
    SELECT 
    e.Employee_ID,
    e.First_Name,
    e.Last_Name,
    d.Department_Name,
    j.Job_Title,
    j.Job_Level,
    e.Salary,
    e.Location
FROM Employee e
JOIN Departments d
    ON e.Department_ID = d.Department_ID
JOIN Jobs j
    ON e.Job_ID = j.Job_ID;
    
    SELECT 
    d.Department_Name,
    AVG(e.Salary) AS Average_Salary
FROM Departments d
JOIN Employee e
    ON d.Department_ID = e.Department_ID
GROUP BY d.Department_Name
HAVING AVG(e.Salary) > 50000;

SELECT 
    First_Name,
    Last_Name,
    Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);

SELECT AVG(Salary)
FROM Employee;

SELECT 
    First_Name,
    Last_Name,
    Salary
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
);

SELECT MAX(Salary) AS Second_Highest_Salary
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employee
);

SELECT 
    First_Name,
    Last_Name,
    Salary
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employee
    )
);

SELECT 
    First_Name,
    Last_Name,
    Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 5;

SELECT 
    First_Name,
    Last_Name,
    Salary
FROM Employee
WHERE Salary > 45000;

SELECT 
    e.First_Name,
    e.Last_Name,
    e.Salary,
    d.Department_Name
FROM Employee e
JOIN Departments d
    ON e.Department_ID = d.Department_ID
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.Department_ID = e.Department_ID
);

SELECT 
    First_Name,
    Last_Name,
    Hire_Date
FROM Employee
WHERE Hire_Date > '2021-12-31';

SELECT 
    First_Name,
    Last_Name,
    Hire_Date
FROM Employee
WHERE Hire_Date BETWEEN '2020-01-01' AND '2022-12-31';

SELECT 
    First_Name,
    Last_Name
FROM Employee
WHERE First_Name LIKE 'A%';

SELECT
    First_Name,
    Last_Name,
    Salary,
    CASE
        WHEN Salary >= 70000 THEN 'High Salary'
        WHEN Salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS Salary_Category
FROM Employee;

SELECT
    e.First_Name,
    e.Last_Name,
    p.Rating,
    CASE
        WHEN p.Rating >= 4.5 THEN 'Outstanding'
        WHEN p.Rating >= 4.0 THEN 'Excellent'
        WHEN p.Rating >= 3.0 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS Performance_Category
FROM Employee e
JOIN Performance p
    ON e.Employee_ID = p.Employee_ID;
    
    SELECT
    CASE
        WHEN Salary >= 70000 THEN 'High Salary'
        WHEN Salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS Salary_Category,
    COUNT(*) AS Total_Employee
FROM Employee
GROUP BY Salary_Category;

SELECT
    e.First_Name,
    e.Last_Name,
    p.Rating,
    p.Performance_Level
FROM Employee e
JOIN Performance p
    ON e.Employee_ID = p.Employee_ID
WHERE p.Rating < 3.5;

SELECT
    e.First_Name,
    e.Last_Name,
    a.Status,
    a.Working_Hours,
    CASE
        WHEN a.Status = 'Absent' THEN 'Poor Attendance'
        WHEN a.Status = 'Late' THEN 'Needs Attention'
        ELSE 'Good Attendance'
    END AS Attendance_Category
FROM Employee e
JOIN Attendance a
    ON e.Employee_ID = a.Employee_ID;
    
    SELECT
    e.First_Name,
    e.Last_Name,
    a.Working_Hours
FROM Employee e
JOIN Attendance a
    ON e.Employee_ID = a.Employee_ID
WHERE a.Working_Hours >= 8;

SELECT
    e.Employee_ID,
    CONCAT(e.First_Name, ' ', e.Last_Name) AS Employee_Name,
    d.Department_Name,
    j.Job_Title,
    e.Salary,
    p.Rating,
    CASE
        WHEN p.Rating >= 4.5 THEN 'Outstanding'
        WHEN p.Rating >= 4.0 THEN 'Excellent'
        WHEN p.Rating >= 3.0 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS Performance_Category
FROM Employee e
JOIN Departments d
    ON e.Department_ID = d.Department_ID
JOIN Jobs j
    ON e.Job_ID = j.Job_ID
JOIN Performance p
    ON e.Employee_ID = p.Employee_ID;
    
    