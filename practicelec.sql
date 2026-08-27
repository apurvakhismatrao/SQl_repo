select database();
show databases;
use bankingdb;

create view MY_View2 AS
select *, ntile(4) over (partition by salary)
as col2 from employee order by age;

select * from MY_View2;



