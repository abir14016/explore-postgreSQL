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

SELECT customer_id, AVG(total_amount) AS avg_total FROM orders
GROUP BY customer_id HAVING AVG(total_amount)>=250;


--Task-3: Write an SQL query to retrieve the student name, course name, and credits for all enrolled courses.

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

SELECT * FROM students;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

SELECT * FROM courses;

INSERT INTO students (student_id, student_name, age, gender)
VALUES
    (1, 'Alice', 22, 'Female'),
    (2, 'Bob', 21, 'Male'),
    (3, 'Charlie', 23, 'Male');

INSERT INTO courses (course_id, course_name, credits)
VALUES
    (101, 'Mathematics', 3),
    (102, 'History', 4),
    (103, 'Physics', 3);

-- Enrollment table with student-course relationships
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

SELECT * FROM enrollment;

INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
    (1, 1, 101),
    (2, 1, 102),
    (3, 2, 103),
    (4, 3, 101);

SELECT s.student_name, cr.course_name, cr.credits
FROM students s
JOIN enrollment e on e.student_id=s.student_id
JOIN courses cr ON cr.course_id=e.course_id

--Task-4: Write an SQL query to retrieve the department name and the average salary of employees working in each department. Sort the results by the average salary in descending order.

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

SELECT * from employees;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

SELECT * from departments;

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2)
);

SELECT * from salaries;

INSERT INTO employees (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO salaries (emp_id, salary)
VALUES
    (1, 50000.00),
    (2, 60000.00),
    (3, 55000.00),
    (4, 52000.00);

SELECT d.department_name, AVG(s.salary)
FROM employees e
JOIN salaries s ON s.emp_id = e.emp_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY AVG(salary) ASC;

--Task-5: Write an SQL query to find the total sales amount for each month, along with the number of orders in that month.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-01-05', 200.00),
    (102, 2, '2023-01-06', 300.00),
    (103, 1, '2023-02-10', 150.00),
    (104, 3, '2023-02-15', 400.00),
    (105, 2, '2023-03-20', 250.00);

SELECT to_char(order_date, 'Month'), SUM(total_amount), COUNT(*)
FROM orders
GROUP BY to_char(order_date, 'Month')


--sub query
SELECT * FROM employees WHERE emp_slary = (
    SELECT MAX(emp_slary) FROM employees
);

SELECT * FROM employees WHERE emp_slary IN (
    SELECT emp_slary FROM employees WHERE emp_name LIKE '%a%'
);

SELECT * FROM employees WHERE emp_slary>(
    SELECT AVG(emp_slary) from employees
);

SELECT emp_name, (
    SELECT AVG(emp_slary) FROM employees
) FROM employees;

SELECT dept_id, avg_salary FROM (
    SELECT emp_department as dept_id, avg(emp_slary) as avg_salary FROM employees GROUP BY dept_id
) as tempTable


--view
CREATE VIEW first_view
AS
SELECT emp_department FROM employees;

SELECT emp_department, COUNT(*) FROM first_view GROUP BY emp_department;

--procedure
CREATE PROCEDURE deactivate_unpaid_accounts()
LANGUAGE SQL
AS  $$
    UPDATE accounts set account = false WHERE balance =0
$$

CALL deactive_unpaid_accounts();

--function
CREATE FUNCTION account_type_count(account_type text) RETURNS INTEGER
LANGUAGE SQL
AS  $$
    DECLARE account_count INT;
    BEGIN
        SELECT COUNT(*) into account_count from accounts WHERE accounts.account_type = $1;
        RETURN account_count;
    END
$$

--trigger
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    base_price float8 NOT NULL,
    final_price float8
);

INSERT INTO products (title, base_price)
VALUES
('mango', 80);

CREATE OR REPLACE TRIGGER add_tax_trigger
AFTER
INSERT ON products
FOR EACH ROW
EXECUTE FUNCTION update_final_price();

CREATE OR REPLACE FUNCTION update_final_price()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
    NEW.final_price := NEW.base_price * 1.05;
    RETURN NEW;
END;
$$;


--indexing
SELECT * FROM employees;
EXPLAIN ANALYZE SELECT * from employees;

CREATE INDEX name_idx ON employees(empName)