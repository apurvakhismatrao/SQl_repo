create database tp;
use tp;
create table student1(
 rollno int primary key,
 name varchar(100), 
 address varchar(200),
 Marks int );
desc student1;

INSERT INTO student1 values
(1, 'apurva', 'kudus', 90),
(2, 'arya', 'wada', 92),
(3, 'aditi', 'nashik', 91),
(4, 'appu', 'kudus', 80);

 select * from student1;
 
 create table teachers (
 ID int primary key,
 name varchar(100),
 Subject varchar(100),
 StudentMarks int );
 
 INSERT INTO teachers values
 (010, 'utkarsha', 'java', 70),
 (020, 'Priyanka', 'db', 65),
 (030, 'Poonam', 'oops', 80),
 (040, 'rupali', 'greenIT', 60);
 
 select * from teachers;

alter table student1;

alter table student1
drop marks;

alter table student1
add phone int;

alter table student1
modify phone varchar(10);


 
 