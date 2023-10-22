create database assignment ;
use assignment ;

create table assignment.Countries 
(
Name varchar (500)
,Population int
,Capital varchar (500)
);

insert into assignment.countries values('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',260,'Jakarta'),
('Brazil',209,'Brasilia'),
('Pakistan',193,'Islamabad'),
('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),
('Mexico',128,'Mexico City'),
('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),
('Ethiopia',101,'Addis Ababa'),
('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),
('Iran',80,'Tehran'),
('Turkey',79,'Ankara'),
('Congo',79,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',65,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw');

insert into assignment.countries 
values('Thailand',68,'Bangkok'),
('Israel',93,'Jerusalem'),
('Nepal',84,'Kathmandu');

set sql_safe_updates = 0;

update assignment.countries set capital = 'New Delhi' 
where capital = 'Delhi';

delete from assignment.countries 
where name in ('Ethiopia','Vietnam');

alter table assignment.countries 
rename to big_countries; 

create table assignment.suppliers
(
supplier_id integer primary key auto_increment,
supplier_name varchar(30),
location varchar(50));


create table assignment.product
(
product_id int primary key auto_increment,
product_name varchar(50) NOT NULL UNIQUE,
description varchar(150),
supplier_id integer, 
foreign key(supplier_id) references suppliers(supplier_id));

create table assignment.stock
(
id integer primary key auto_increment,
product_id integer,
balance_stock integer,
foreign key(product_id) references product(product_id));

insert into suppliers values (1,'New India Suppliers','Mumbai');
insert into suppliers values (2, 'Nav Bharath Suppliers','Delhi');

insert into product values(100,'Wet Grinder','Heavy duty wet grinders',1),
(200,'Sewing Machine','Export quality sewing machines with 23 settings',2);

insert into assignment.stock values (1,100,23),(2,200,5);

alter table suppliers modify column supplier_name varchar(30) UNIQUE NOT NULL;

alter table emp add column deptno integer;

update emp set deptno = 10;
update emp set deptno = 20 where emp_no%2 = 0;
update emp set deptno = 30 where emp_no%3 = 0;
update emp set deptno = 40 where emp_no%4 = 0;
update emp set deptno = 50 where emp_no%5 = 0;

create unique index hidx on emp(emp_no);

create view emp_sal as select emp_no, first_name, last_name, salary from emp order by salary desc;


