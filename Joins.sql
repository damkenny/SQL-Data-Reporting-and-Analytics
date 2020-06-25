##########################################################
##########################################################

-- SECTION: SQL Joins

##########################################################
##########################################################

###########
-- EXERCISE 1: Introduction to Joins

#### Preamble 

# if you don’t currently have ‘departments_dup’ set up

DROP TABLE IF EXISTS departments_dup;

-- Create departments_dup table

CREATE TABLE departments_dup 
(
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

-- Insert values into the departments_dup table from the departments table

INSERT INTO departments_dup (dept_no, dept_name)
SELECT 
	*
FROM 
	departments;
    
    
SELECT * FROM departments_dup;
    
-- Insert a new record into the table

INSERT INTO departments_dup (dept_name) 
VALUES 	('Public Relations');

-- Delete department with dept_no = 'd002' from the table

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';  

-- Insert new records into the table

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

-- EXERCISE 2: Introduction to Joins

-- Drop the 'dept_manager_dup'

DROP TABLE IF EXISTS dept_manager_dup;

-- Create a table called 'dept_manager_dup'

CREATE TABLE dept_manager_dup (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);


SELECT * FROM dept_manager_dup;

-- Insert records from 'dept_manager' table
-- into 'dept_manager_dup' table

INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

-- Insert new records into the 'dept_manager_dup' table

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES  (999904, '2017-01-01'),
		(999905, '2017-01-01'),
        (999906, '2017-01-01'),
       	(999907, '2017-01-01');

-- Delete the record for the manager with department number 'd001'
-- from the dept_manager_dup table

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001'; 

###########
-- LECTURE: INNER JOIN - Part I

-- dept_manager_dup
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

-- departments_dup
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;


###########
-- LECTURE: INNER JOIN - Part II

-- Extract all managers' employee number, department number, and department name
-- Order by the managers' department number

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

###########
-- LECTURE: A Note on Using Joins

/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
*/

-- add m.to_date and d.dept_name

SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- JOIN

SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- d.dept_no = m.dept_no

SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

-- ORDER BY d.dept_no

SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY d.dept_no;

-- ORDER BY dept_no

SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY dept_no;


###########
-- LECTURE: Duplicate Records

-- duplicate records

-- Insert records into the dept_manager_dup and departments_dup tables respectively

INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- Select all records from the dept_manager_dup table

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

-- Select all records from the departments_dup table

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;

-- Perform inner join as before

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- add GROUP BY m.emp_no
-- Group by the column that differ the most

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;


###########
-- LECTURE: LEFT JOIN - Part I

-- remove the duplicates from the two tables
DELETE FROM dept_manager_dup 
WHERE emp_no = '110228';
        
DELETE FROM departments_dup 
WHERE dept_no = 'd009';


-- add back the initial records
INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- left join
/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;
*/

-- Select all records from dept_manager_dup
SELECT *
FROM dept_manager_dup
ORDER BY dept_no;

-- Select all records from departments_dup
SELECT *
FROM departments_dup
ORDER BY dept_no;

-- Join the dept_manager_dup and departments_dup tables
-- Extract a subset of all managers' employee number, department number, and department name
-- Order by the managers' department number

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;


###########
-- LECTURE: LEFT JOIN - Part II

-- d LEFT JOIN m
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
		LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- SELECT d.dept_no
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
		LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- LEFT OUTER JOIN
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT OUTER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- m LEFT JOIN d
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- add WHERE
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY m.dept_no;

###########
-- LECTURE: RIGHT JOIN

/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;
*/

-- right join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT OUTER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- SELECT d.dept_no
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- d LEFT JOIN m
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY dept_no;

###########
-- LECTURE: JOIN and WHERE Used Together

-- Extract the employee number, first name, last name and salary
-- of all employees who earn above 145000 dollars per year

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
;

-- What do you think would happen?
SELECT 
    e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
;

###########
-- LECTURE: Using Aggregate Functions with Joins

-- What is the average salary for the different gender?

SELECT 
    e.gender, ROUND(AVG(s.salary),2) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;    

-- SELECT e.emp_no
SELECT 
    e.emp_no, e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender; 


###########
-- LECTURE: Join more than Two Tables in SQL

-- Retrieve a list of all managers first name, last name, hire date,
-- from date and department name

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
;

-- This is the same result

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no
;


-- Retrieve a list of all managers first name, last name, hire date,
-- from date, department name and average salary

SELECT 
    m.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name,
    AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
	salaries s ON e.emp_no = s.emp_no
		JOIN
    dept_manager m ON s.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY average_salary DESC
;
