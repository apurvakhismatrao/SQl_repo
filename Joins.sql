use bankingdb;
select * from employee;
select * from projects;
select * from address;

select employee.EmployeeID, FullName, City
from employee
inner join 
address
on employee.EmployeeID = address.EmployeeID;



select employee.EmployeeID, FullName, ProjectName
from employee
left join 
projects
on employee.EmployeeID = projects.EmployeeID;

select projects.EmployeeID, FullName, ProjectName
from employee
right join 
projects
on employee.EmployeeID = projects.EmployeeID;

select projects.EmployeeID, FullName, ProjectName
from projects
left join 
employee
on employee.EmployeeID = projects.EmployeeID;

select projects.EmployeeID, FullName, ProjectName
from projects
left join 
employee
on employee.EmployeeID = projects.EmployeeID
where employee.EmployeeID >1004;

select projects.EmployeeID, FullName, ProjectName
from projects
left join 
employee
on employee.EmployeeID = projects.EmployeeID
where employee.EmployeeID >1004 AND FullName LIKE "P%";















