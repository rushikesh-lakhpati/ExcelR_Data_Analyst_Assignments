select * 
from assignment.employee 
where salary > 3000;

select 
count(*) 
from assignment.students 
where marks between 50 and 60;

select 
count(*) 
from assignment.students 
where marks between 80 and 100;

select distinct city 
from assignment.station 
where id%2=0;

select 
count(city) - count(distinct city) as Difference
from assignment.station;

select distinct city 
from assignment.station 
where Left(city,1) in ('a','e','i','o','u');

select distinct city 
from assignment.station 
where RIGHT(city,1) in ('a','e','i','o','u') and LEFT(city,1) in ('a','e','i','o','u');

select distinct city 
from assignment.station 
where Left(city,1) not in ('a','e','i','o','u');

select distinct city 
from assignment.station 
where RIGHT(city,1) in ('a','e','i','o','u') or LEFT(city,1) in ('a','e','i','o','u');

SELECT *
FROM assignment.emp
WHERE salary > 2000 AND hire_date < 36
ORDER BY emp_no ASC; 

select * 
from assignment.emp 
where date_sub(date(now()), INTERVAL 36 MONTH) <= hire_date and salary >2000
order by emp_no asc ;

select 
deptno, 
sum(salary) 
from assignment.employee 
group by deptno;

select 
count(*) 
from assignment.city 
where population > 100000;

select 
sum(population) 	
from assignment.city 
where district = 'california';

select 
countrycode,
avg(population) as AvgPopulation 
from assignment.city 
group by countrycode;

select 
o.ordernumber, 
o.status, 
o.comments, 
c.customernumber, 
c.customername 
from assignment.orders o inner join assignment.customers c on c.customernumber = o.customernumber
where status='Disputed';




