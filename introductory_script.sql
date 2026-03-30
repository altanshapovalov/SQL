-- Script 1 to get accustomed with SQL. Understanding of basic commands. Examples learned from Tab Nation
-- Maxim Altan-Lu Shapovalov, 30 March, 2026
-- data are the Sample Database provided by DBeaver


-- 1) Showing anything in a table
SELECT * FROM employee -- select anything from the employee table via wildcard


-- 2) Show full name of people who report to specific ID
SELECT 
	LastName as Last, FirstName as First -- specify what we want to see, and "as Last" will name the column that
FROM 
	employee -- specify from where we want to see this info
	where ReportsTo = 6 -- specify that we only want to see ppl who report to "6"
	
	
-- 3) Show all info for people who have the title of IT Staff
SELECT 
	*
from
	employee
	where Title = 'IT Staff'
	
	
-- 4) use % as a 'ctrl-f' command that detects any instance of Staff
SELECT 
	*
from
	employee
	where Title like '%Staff%' -- %x will show things that END with x, x% that BEGIN with X, and %x% that begin or end with X
	
	
-- 5) search by multiple parameters	
SELECT 
	*
from
	employee
	where ReportsTo = 1 and HireDate like '200%' -- reports to 1 AND hired anytime in the first 10 years of 2000
	

-- 6) order alphabetically by last name for any person who has IT in their title
SELECT 
	*
from
	employee
	Where Title like '%IT%'
	order by LastName
	

-- 7) update someone's last name
UPDATE Employee -- choose where we're working
SET LastName = 'de Lucia' -- this will be the new last name
WHERE LastName = 'King'; -- this is what is detected and will be changed


-- 8) delete a row based on a last name
DELETE FROM Employee WHERE LastName = 'de Lucia';


-- 9) create new row
insert into Employee (FirstName, LastName)
Values ('Andres','Segovia');


-- 10) delete row by specifying several parameters
Delete from Employee 
where FirstName = 'Andres' and LastName = 'Segovia'


-- 11) how many people are in the sales dept?
Select Count(FirstName)
From Employee
where Title like 'Sales%';
