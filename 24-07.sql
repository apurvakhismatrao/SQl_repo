show databases;

use bankingDB;
CREATE TABLE Employee (
  EmployeeId INT PRIMARY KEY,
  FullName VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary float NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL
);

INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25), 
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27), 
(1003, 'James Brown', 'Finance', 50000, 'Male', 28), 
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

select * from Employee;

-- Group by --
select Department, count(Department) from Employee group by department;

select Department, count(Department) from Employee
where gender = "Male" group by department;

select Department, count(Department) from Employee
where salary >=50000 group by department;

-- group by with HAVING Clause--
select Department, sum(salary) from employee
group by department having sum(salary)>150000 ;

select Gender, count(*) from employee group by gender;

select Gender, count(*) from employee
group by gender having sum(salary)>=250000;

select EmployeeId, Fullname, Department, salary,
AVG(salary) over (PARTITION BY Department) AS DepartmentAverageSalary 
from Employee
 ORDER BY Department, salary DESC;

select EmployeeId, Fullname, Department, salary,
sum(salary) over (PARTITION BY Department) AS DepartmentSumSalary 
from Employee
 ORDER BY Department, salary DESC;
 
 select EmployeeId, Fullname, Gender, Age,
AVG(Age) over (PARTITION BY Gender) AS GenderAverageAge
from Employee
 ORDER BY Gender, Age DESC;
 
 select  EmployeeId, Fullname, Department,
 ROW_NUMBER() OVER (PARTITION BY Department ) AS RankInDepartment
 from employee order by Department;
 
 select EmployeeId, Fullname, Department, salary,
 RANK() OVER (ORDER BY Salary) AS OverallSalaryRank
 from Employee ORDER BY OverallSalaryRank;
 
 select EmployeeId, Fullname, Department, salary,
 dense_rank() OVER (ORDER BY Salary DESC) AS OverallSalaryRank
 from Employee ORDER BY OverallSalaryRank;
 