
################################################
################################################

-- Solution to assignment

###############################################
##############################################

-- Use the employees database
USE employees;

###############################################
###############################################

-- Writing Queries Solution


-- EXERCISE 1: SELECT - FROM
-- Select the department number from the departments table

-- Solution
SELECT 
    dept_no
FROM
    departments;

-- EXERCISE 2: SELECT - FROM
-- Select all records from the departments table

-- Solution
SELECT 
    *
FROM
    departments;


-- EXERCISE 3: AND
-- Select all female employees whose first name is 'Kellie'

-- Solution

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND first_name = 'Kellie'; 

-- EXERCISE 4: OR
/*
Retrieve a list with all employees whose first name is either
'Kellie' or 'Aruna'
*/

-- Solution
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna'; 

-- EXERCISE 5: IN / NOT IN    
-- Use the IN operator to select all individuals from the 'employees' table,
-- whose first name is 'Denis' or 'Elvis'.

-- Solution

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
-- EXERCISE 6: IN / NOT IN 
-- Extract all records from the 'employees' table, aside from those 
-- employees named 'John' , 'Mark' or 'Jacob'

-- Solution

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');


-- EXERCISE 7: LIKE / NOT LIKE 
-- Extract all individuals from the 'employees' table whose first name 
-- starts with 'Mark'

-- Solution
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('Mark%');
    

-- EXERCISE 8: LIKE/ NOT LIKE
-- Retrieve a list of all employees who were employed in the year 2000.

-- Solution

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

-- EXERCISE 9: LIKE/ NOT LIKE
-- Retrieve a list of all employees whose employees number
-- starts with 1000, and has one single character

-- Solution

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

-- EXERCISE 10: BETWEEN - AND
-- Select all the records from the salaries table, regarding contracts
-- from 66000 to 70000 dollars/year

-- Selecting all records from the salaries table

SELECT 
    *
FROM
    salaries;

-- Solution

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

-- EXERCISE 11: BETWEEN - AND
-- Retrieve a list of individuals whose emp_no is not between
-- '10004' and '10012'

-- Solution
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
 
 -- EXERCISE 12: BETWEEN - AND
-- Select all names of departments between 'd003' and 'd005'

-- Solution
 
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

-- EXERCISE 13: IS NOT NULL / IS NULL
-- Select the names of all departments whose department number value is not null

-- Solution

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

-- EXERCISE 14: Other Comparison Operators
-- Retrieve a list of all female employees who were hired on or after 1st January, 2000. 

-- Solution

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'F';

-- EXERCISE 15: Other Comparison Operators
-- Extract a list with employees' salaries higher than 150,000 dollars per annum

-- Solution

SELECT 
   *
FROM
    salaries
WHERE
    salary > 150000;