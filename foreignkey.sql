create database fk_db;
use fk_db;

create table Employee (
ID INT primary key,
Name VARCHAR(100) NOT NULL,
Age INT,
Salary decimal(10, 2)
);
select * from Employee;

create table Project (
ProjectID INT primary key,
ProjectName VARCHAR(100) NOT NULL,
ID INT,
foreign key (ID) references Employee(Id)
on update cascade
on delete cascade
);
select * from Project;

insert into Employee 
values
(101, 'Alice Smith', 29, 75000),
(102, 'Bob Jones', 34, 82000),
(103, 'Charlie Brown', 41, 95000),
(104, 'Diana Prince', 26, 68000);

select * from Employee;

insert into Project
values
(1, 'Website Redsign', 101),
(2, 'Cloud Migration', 101),
(3, 'Mobile App Launch', 102),
(4, 'Data Analytics Pipeline', 103);

select * from Project;

delete from Employee where Id =103;
select * from Employee;
select * from Project;

update Employee set Id =105
where Name = 'Alice Smith';

select * from Employee;
select * from Project;




