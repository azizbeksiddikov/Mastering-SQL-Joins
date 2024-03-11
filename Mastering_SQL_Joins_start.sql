##########################################################
##########################################################
-- Guided Project: Mastering SQL Joins in PostgreSQL
##########################################################
##########################################################


#############################
-- Task One: Getting Started
-- In this task, we will retrieve data from the dept_manager_dup and
-- departments_dup tables in the database
#############################

-- 1.1: Retrieve all data from the dept_manager_dup table


-- 1.2: Retrieve all data from the departments_dup table


#############################
-- Task Two: INNER JOIN
-- In this task, you will retrieve data from the two 
-- tables using INNER JOIN
#############################

##########
-- INNER JOIN

-- 2.1: Extract all managers' employees number, department number, 
-- and department name. Order by the manager's department number



-- add m.from_date and m.to_date


-- 2.2 (Ex.): Extract a list containing information about all managers'
-- employee number, first and last name, dept_number and hire_date
-- Hint: Use the employees and dept_manager tables

-- Retrieve data from the employees and dept_manager

SELECT * FROM employees;
SELECT * FROM dept_manager;

-- Solution to 2.2


#############################
-- Task Three: Duplicate Records
-- In this task, you will retrieve data from the two 
-- tables with duplicate records using INNER JOIN
#############################

###########
-- Duplicate Records

-- 3.1: Let us add some duplicate records
-- Insert records into the dept_manager_dup and departments_dup tables respectively

INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- 3.2: Select all records from the dept_manager_dup table

SELECT *
FROM dept_manager_dup
ORDER BY dept_no ASC;

-- 3.3: Select all records from the departments_dup table

SELECT *
FROM departments_dup
ORDER BY dept_no ASC;

-- 3.4: Perform INNER JOIN as before


-- 3.5: add a GROUP BY clause. Make sure to include all the fields in the GROUP BY clause



#############################
-- Task Four: LEFT JOIN
-- In this task, you will retrieve data from the two tables using LEFT JOIN
#############################

###########
-- LEFT JOIN

-- 4.1: Remove the duplicates from the two tables
DELETE FROM dept_manager_dup 
WHERE emp_no = '110228';
        
DELETE FROM departments_dup 
WHERE dept_no = 'd009';

-- 4.2: Add back the initial records
INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- 4.3: Select all records from dept_manager_dup
SELECT *
FROM dept_manager_dup
ORDER BY dept_no;

-- 4.4: Select all records from departments_dup
SELECT *
FROM departments_dup
ORDER BY dept_no;

-- Recall, when we had INNER JOIN
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
JOIN departments_dup d 
ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- 4.5: Join the dept_manager_dup and departments_dup tables
-- Extract a subset of all managers' employee number, department number, 
-- and department name. Order by the managers' department number


-- 4.6: What will happen when we d LEFT JOIN m?


-- 4.7: Let's select d.dept_no


-- LEFT OUTER JOIN


#############################
-- Task Five: RIGHT JOIN
-- In this task, you will retrieve data from the two tables using RIGHT JOIN
#############################

###########
-- RIGHT JOIN

-- We have seen LEFT JOIN in the previous task

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d 
ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- 5.1: Let's use RIGHT JOIN


-- 5.2: SELECT d.dept_no


-- 5.3: d LEFT JOIN m


#############################
-- Task Six: JOIN and WHERE Used Together
-- In this task, you will retrieve data from tables
-- using JOIN and WHERE together
#############################

###########
-- JOIN and WHERE Used Together

-- 6.1: Extract the employee number, first name, last name and salary
-- of all employees who earn above 145000 dollars per year

-- Let us retrieve all data in the salaries table
SELECT * FROM salaries;

-- Solution to 6.1



-- 6.2: What do you think will be the output of this query?

SELECT e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE s.salary > 145000;

-- 6.3 (Ex.): Select the first and last name, the hire date and the salary
-- of all employees whose first name is 'Mario' and last_name is 'Straney'


-- 6.4: Join the 'employees' and the 'dept_manager' tables to return a subset
-- of all the employees whose last name is 'Markovitch'. 
-- See if the output contains a manager with that name


-- 6.5: Join the 'employees' and the 'dept_manager' tables to return a subset
-- of all the employees who were hired before 31st of January, 1985



#############################
-- Task Seven: Using Aggregate Functions with Joins
-- In this task, you will retrieve data from tables in the employees database,
-- using Aggregate Functions with Joins
#############################

###########
-- Using Aggregate Functions with Joins

-- 7.1: What is the average salary for the different gender?
   

-- 7.2: What do you think will be the output if we SELECT e.emp_no?
SELECT e.emp_no, e.gender, AVG(s.salary) AS average_salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
GROUP BY e.emp_no, gender; 

-- 7.3: How many males and how many females managers do we have in
-- employees database?



#############################
-- Task Eight: Join more than Two Tables in SQL
-- In this task, you will retrieve data from tables in the employees database,
-- by joining more than two Tables in SQL
#############################

###########
-- Join more than Two Tables in SQL

-- 8.1: Extract a list of all managers' first and last name, dept_no, hire date, to_date,
-- and department name


-- 8.2: What do you think will be the output of this?
SELECT e.first_name, e.last_name, m.dept_no, e.hire_date, m.to_date, d.dept_name
FROM departments d
JOIN dept_manager m 
ON d.dept_no = m.dept_no
JOIN employees e 
ON m.emp_no = e.emp_no;

-- 8.3: Retrieve the average salary for the different departments

-- Retrieve all data from departments table
SELECT * FROM departments

-- Retrieve all data from dept_emp table
SELECT * FROM dept_emp

-- Retrieve all data from salaries table
SELECT * FROM salaries

-- Solution to 8.3


-- 8.4 (Ex.): Retrieve the average salary for the different departments where the
-- average_salary is more than 60000


