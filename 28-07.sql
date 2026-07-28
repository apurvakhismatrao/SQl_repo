
show databases;

use bankingDB;

CREATE TABLE Projects (
ProjectId INT PRIMARY KEY AUTO_INCREMENT,
ProjectName VARCHAR(200) NOT NULL,
EmployeeId INT,
StartDate DATETIME,
EndDate DATETIME
);
INSERT INTO Projects VALUES 
(1,'Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(2,'WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(3,'Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(4,'Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(5,'MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(6,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
(7,'Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
(8,'Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(9,'Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(10,'MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(11,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));

select * from Projects;
select ProjectName, datediff(EndDate, StartDate) AS Duration from Projects;


select date_format("2026/07/27", "%D, %M, %a");

select date_format(endDate, "%D, %M %Y, %W"),
date_format(startDate,"%D, %M %Y, %W"),
datediff(enddate, startDate) AS Duration
from Projects where datediff(endDate,startDate)>10;

select round(2.5);

select *, if(age>=27, "Senior", "Junior") as Status from employee;
select *, if(salary>=50000, "highly paid", "under paid") as Status from employee;

select age>=27 as stat,
if (age>=27, "Senior", "Junior") as Status from employee;

select *, ifnull(EmployeeID, "No ID present") as check1 from projects;

select greatest(23,45,67,55,99,108) As Greatest_number;
select least(23,45,67,55,99,108) As least_number;

select fullname, 
nullif(fullname, "john Doe" ) from employee;