-- ## creating a student TABLE

-- CREATE TABLE student (
--     student_id INT,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     cgpa NUMERIC(1,2)
-- )

-- rename a table NAME

CREATE DATABASE teat4;

ALTER TABLE users2 RENAME to users;

--delete a TABLE
-- DROP TABLE learners;

--create table with CONSTRAINTS
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
    age INT DEFAULT 18
)

insert into users (user_id,user_name,email)
VALUES
(4,'sony4', 'sony4@gmail.com');

ALTER TABLE users
ADD COLUMN password VARCHAR(255) DEFAULT 'admin123' NOT NULL;

ALTER TABLE users
DROP COLUMN age;

ALTER TABLE users
ADD COLUMN demo INT;

ALTER TABLE users
    Alter COLUMN demo type TEXT;


ALTER TABLE users
    Alter COLUMN demo set DEFAULT 'Banladesh';

ALTER TABLE users
    Alter COLUMN demo drop DEFAULT;

ALTER Table users
RENAME COLUMN demo to country;

ALTER Table users
Alter COLUMN country set NOT NULL;
ALTER Table users
Alter COLUMN country drop NOT NULL;

ALTER Table users
ADD constraint unique_email UNIQUE(email);

ALTER Table users
Drop constraint unique_email;








--Departments table/relation
CREATE TABLE IF NOT EXISTS departments(
    deptID SERIAL PRIMARY KEY,
    deptName TEXT NOT NULL
)

--insert values into departments table/relation
INSERT INTO departments(deptname) 
VALUES
('IT'),
('HR'),
('Marketing'),
('Finance'),
('Sales');

--select all fields dfrom departments table/relation
SELECT * FROM departments;



--Employee TABLE
--each employee belongs to a department
create table IF NOT EXISTS employees(
    empID SERIAL PRIMARY KEY,
    empName TEXT NOT NULL,
    email TEXT NOT NULL,
    salary INT NOT NULL,
    joining_date DATE NOT NULL,
    deptID INT,
    CONSTRAINT fk_deptID
        FOREIGN KEY (deptID)
        REFERENCES departments(deptID)
)

--insert values into employees table/relation
INSERT INTO employees(empName, email,salary,joining_date, deptID) 
VALUES
('Shamim','shamim@gmail.com', 20000, '2023-08-25',1),
('Abir','abir@gmail.com', 90000, '2020-08-25',2),
('Rony','rony@gmail.com', 30000, '2022-08-25',3),
('Shakib','shakib@gmail.com', 70000, '2023-08-25',4),
('Salman','salman@gmail.com', 60000, '2023-08-25',5),
('Siraj','siraj@gmail.com', 40000, '2023-08-25',1);

--select all fields from employees table/relation
SELECT * FROM employees;
--select some columns
SELECT empid,empName,email, salary, joining_date, deptID from employees;

--conditional seect
select * FROM employees
WHERE salary>60000 and salary<100000;

SELECT * FROM employees
ORDER BY empname
ASC LIMIT 2 OFFSET 2;
SELECT * FROM employees
ORDER BY empname
DESC;

--heighst salary from employees table
SELECT * FROM employees
ORDER BY salary
DESC
LIMIT 1;

--3rd heighst salary from employees table
SELECT * FROM employees
ORDER BY salary
DESC
LIMIT 1
OFFSET 2;

--IN NOT IN, BETWEEN and LIKE
SELECT * FROM employees WHERE deptid IN (2,3);
SELECT * FROM employees WHERE deptid NOT IN (2,3);
SELECT  * FROM employees WHERE empid BETWEEN 1 AND 3;
SELECT  * FROM employees WHERE empname LIKE '%a%'; -- a in name
SELECT  * FROM employees WHERE empname LIKE 'a%'; -- a in first position in name
SELECT  * FROM employees WHERE empname LIKE '%a'; -- a in last position in name
SELECT  * FROM employees WHERE empname LIKE '_a%'; -- specific position (a in second position)
SELECT  * FROM employees WHERE empname LIKE '__a__'; 
SELECT  * FROM employees WHERE empname LIKE 'S%n'; 


--courses TABLE
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    published_date DATE
)

--Date format: YYYY-MM-DD

INSERT INTO 
    courses(course_name,description,published_date)
VALUES
('HTML','description for HTML', '2020-07-13'),
('CSS','description for CSS', '2020-07-13'),
('JS','description for JS', NULL),
('REACT',NULL, NULL)

UPDATE courses
set
course_name = 'JS for beginers',
description='Dummy text'
WHERE course_id=3

DELETE FROM courses
WHERE course_id=4

SELECT * FROM courses;



TRUNCATE TABLE users;



--for test4 DATABASE
--creating department table
CREATE TABLE department (
    deptId INT PRIMARY KEY,
    deptName VARCHAR(100)
);

--creating employees table
CREATE TABLE employees (
    employeeId INT PRIMARY KEY,
    fullName VARCHAR(100),
    deptId INT,
    jobRole VARCHAR(100),
    managerId INT,
    FOREIGN KEY (deptId) REFERENCES department(deptId)
);

--inserting data into department table
INSERT INTO department(deptId, deptName) 
VALUES
(1,'IT'),
(2,'HR'),
(3,'Marketing'),
(4,'Finance'),
(5,'Sales'),
(6,'Executive');

--inserting data into employees table
INSERT INTO 
    employees (employeeId, fullName,deptId, jobRole, managerId)
    VALUES
    (1, 'John Doe', 2, 'Frontend Developer', 5),
    (2, 'John Smith', 1, 'Backend Developer', 6),
    (3, 'Daniel', 2, 'Frontend Engineer', 5),
    (4, 'John Mata', 2, 'Support', 1),
    (5, 'Selena', 4, 'Support', 2),
    (6, 'Gomez', Null, 'Job Placement', 4),
    (7, 'Nila', 6, 'CEO', 3),
    (8, 'Jahan', 3, 'CEO', 7),
    (9, 'Dinesh', 5, 'Frontend Developer', 1),
    (10, 'Virat Kohli', 6, 'Frontend Driver', 8),
    (11, 'Rohit', 2, 'Puller', Null);

SELECT * FROM department;

SELECT * FROM employees;
SELECT * FROM departments;

--inner joining
SELECT *
FROM employees
INNER JOIN department On department.deptId = employees.deptId;

--left joining
SELECT *
FROM employees
LEFT JOIN department On department.deptId = employees.deptId;

--right joining
SELECT *
FROM employees
RIGHT JOIN department On department.deptId = employees.deptId;

--full joining
SELECT *
FROM employees
FULL JOIN department On department.deptId = employees.deptId;

--natural joining
SELECT *
FROM employees
NATURAL JOIN department;

--cross joining
SELECT *
FROM employees
CROSS JOIN department;

--aggregate function on database test2
SELECT AVG(salary) AS avgSalary FROM employees;
SELECT MIN(salary) AS minSalary FROM employees; 
SELECT MAX(salary) AS maxSalary FROM employees;
SELECT SUM(salary) AS sumOfSalary FROM employees;
SELECT deptid, AVG(salary) AS groupAvg FROM employees GROUP BY deptid;

SELECT d.deptname, AVG(salary), SUM(salary), MIN(salary), MAX(salary), COUNT(*) FROM employees e
FULL JOIN departments d ON e.deptid = d.deptid
GROUP BY d.deptname HAVING AVG(e.salary)>60000



--for database tasks
--task-1: Write an SQL query to retrieve the names and salaries of employees who work in the "HR" department.
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

SELECT * FROM employees;

INSERT INTO employees (emp_id, emp_name, department, salary)
VALUES
    (1, 'John Doe', 'HR', 50000.00),
    (2, 'Jane Smith', 'IT', 60000.00),
    (3, 'Michael Johnson', 'Finance', 55000.00),
    (4, 'Emily Brown', 'HR', 52000.00);

SELECT emp_name, salary FROM employees WHERE department = 'HR';


--Task-2: Write an SQL query to find the customer IDs and the average total amount of their orders. Display only those customers whose average total amount is greater than or equal to 250.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
    (101, 1, 200.00),
    (102, 2, 300.00),
    (103, 1, 150.00),
    (104, 3, 400.00),
    (105, 2, 250.00);

SELECT * FROM orders;

