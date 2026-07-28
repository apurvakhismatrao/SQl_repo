use company; 
select * from employee;
select concat("Bob", " ", "Jones") AS Name;

SELECT lower(name) from employee;
SELECT upper(name) from employee;

SELECT replace("Hi ! How are you !", "Hi", "Bye");
select name, replace(name, "Jones", "JACK") AS NEW 
from employee;
select * from employee;
SELECT name, reverse(name) as REVERSED
from employee;

SELECT name, length(name) as Char_Length
from employee;

select substring('Good Moeging',3,5) as extractstring,
 length(substring('Good Moeging',3,5)) as clk;
 
 select substring(name,1,3) as clipped from employee;
 
 select * from trim_example;
 select te.*,
 length(modified) as OG_Length,
 rtrim(modified),length(rtrim(modified)) as ln
 from trim_example as te;
 
 select * from trim_example;
 select te.*,
 length(modified) as OG_Length,
 ltrim(modified),length(ltrim(modified)) as ln
 from trim_example as te;
 
 select abs(-90);
 
 select mod(5,3);
 
 select floor(42.2);
select ceiling(42.2);

select truncate(3.14,1);
select truncate(3254.14,-1);
select truncate(3254.14,-2);

select exp(2);
select power(4,2);
select sqrt(144);



select last_day('2022-03-02');

select  abs(("2023-02-02",now())) as days;
select month(now());
select year(now());

select avg(salary) as avg_sal from Employee;


