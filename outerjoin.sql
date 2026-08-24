use bankingdb;

select * from employee;
select * from projects;
select * from address;


#Q show all the employees, their projects and duration of project against them

select fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
left join
projects as P
on E.employeeid = P.employeeid;

select fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
left join
projects as P
on E.employeeid = P.employeeid
where projectname is null;

select fullname, projectname, 
datediff(EndDate,StartDate ) as duration ,
state
from employee as E
left join
projects as P
on E.employeeid = P.employeeid
left join
address as A
on E.employeeid = A.EmployeeId;

#union
select E.employeeid,projectid, fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
left join
projects as P
on E.employeeid = P.employeeid
union
select P.employeeid,projectid, fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
right join
projects as P
on E.employeeid = P.employeeid;

#union all
select E.employeeid,projectid, fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
left join
projects as P
on E.employeeid = P.employeeid
union all
select P.employeeid,projectid, fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
right join
projects as P
on E.employeeid = P.employeeid;

update employee set salary = salary +10000;
select * from employee;

select * from employee
cross join address;

update employee set salary = salary - 20000;
select * from employee;


use bankingdb;
create view My_view1 AS 
select E.employeeid,projectid, fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
left join
projects as P
on E.employeeid = P.employeeid
union all
select P.employeeid,projectid, fullname, projectname, 
datediff(EndDate,StartDate ) as duration 
from employee as E
right join
projects as P
on E.employeeid = P.employeeid;
select * from My_view1;