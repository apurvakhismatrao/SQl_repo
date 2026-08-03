use bankingdb;
select * from employee;
select * from projects;
select * from address;


-- sub query --
-- single row subquery ---
--- Q. find the employee having same salary as that of james brown ---

select salary from employee where FullName = "James Brown";

select * from employee where salary = 
(select salary from employee where FullName = "James Brown");

select department from employee where EmployeeID = 1007;

select * from employee where department =
(select department from employee where EmployeeID = 1007);

select FullName from employee where EmployeeID = 1010;

select substring((select FullName from employee where EmployeeID = 1010),2,1);

select * from employee where substring(fullname,2,1) =
(select
 substring((select FullName from employee where EmployeeID = 1010),2,1));
 
select Age from employee where EmployeeID = 1009 or EmployeeID = 1010;

select * from employee where Age IN
(select Age from employee where EmployeeID =1009 or EmployeeID =1010);

select salary from employee where fullname = "Anurag Mohanty";

select * from employee where salary >
(select salary from employee where fullname = "Anurag Mohanty");

select age from employee where employeeid in (1001,1002);

select * from employee where age > any
(select age from employee where employeeid in (1001,1002));

select * from employee where age < any
( select age from employee where fullname = "James Brown" or fullname = " Linda Jones");

select * from employee where age < all
( select age from employee where fullname = "James Brown" or fullname = " Linda Jones");

select * from employee where age<26 and age <28;

select * from employee where substring(fullname,2,1) =
(select
  substring((select fullname from employee where employeeid= 1010),2,1));

select *, datediff(EndDate, StartDate ) as duration from Projects;

select *, datediff(EndDate, StartDate) as duration from Projects 
where datediff(EndDate, StartDate) >all
(select datediff(EndDate, StartDate) from projects where datediff(EndDate, StartDate) = 10 or datediff(EndDate, StartDate) =15);

select *, datediff(EndDate, StartDate) as duration from Projects 
where datediff(EndDate, StartDate) >all
(select datediff(EndDate, StartDate) from projects where datediff(EndDate, StartDate) = 10 or datediff(EndDate, StartDate) =15);

select *, datediff(EndDate, StartDate) as duration from Projects  where
datediff(EndDate, StartDate) 
>all
(select datediff(EndDate, StartDate) from Projects
where datediff(EndDate, StartDate)=10 or datediff(EndDate, StartDate)=15 );


drop database company11;







