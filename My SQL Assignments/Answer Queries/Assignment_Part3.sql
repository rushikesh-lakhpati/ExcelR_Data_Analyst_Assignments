DELIMITER //
CREATE PROCEDURE `order_status` (IN inputMonth INT, IN inputYear INT)
BEGIN
    SELECT 
    ordernumber, 
    orderdate, 
    status
    FROM assignment.orders
    WHERE MONTH(orderdate) = inputMonth AND YEAR(orderdate) = inputYear;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION `purchase_status`(cnum integer) 
RETURNS varchar(10) 
Deterministic
BEGIN
	declare pstatus varchar(10) default '';
    declare amt integer default 0;
    
    select sum(amount) into amt from payments where customerNumber = cnum;
    if amt < 25000 then
      set pstatus = 'Silver';
	elseif amt between 25000 and 50000 then
      set pstatus = 'Gold';
	else 
       set pstatus = 'Platinum';
	end if;
    
RETURN pstatus;
END//
DELIMITER ;

select 
customerNumber, 
customerName, 
purchase_status(customerNumber) 
from assignment.customers;

DELIMITER //
CREATE TRIGGER upd_cascade 
AFTER UPDATE ON `movies` 
FOR EACH ROW
BEGIN
    update rentals set movieid = new.id
    where movieid = old.id;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER del_cascade 
AFTER DELETE ON `movies` 
FOR EACH ROW
BEGIN
   delete from rentals 
   where movieid = old.id;
END//
DELIMITER ;

SELECT 
fname, 
lname, 
salary, 
NTH_VALUE(fname, 3) OVER  ( ORDER BY salary DESC) third_highest_salary 
FROM assignment.employee;

SELECT 
fname, 
lname, 
salary,
DENSE_RANK() OVER ( ORDER BY salary DESC ) emp_rank
FROM assignment.employee;

SELECT
fname,
lname,
salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM assignment.employee;


