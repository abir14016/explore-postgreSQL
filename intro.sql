-- ## creating a student TABLE

-- CREATE TABLE student (
--     student_id INT,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     cgpa NUMERIC(1,2)
-- )

-- rename a table NAME

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








--Department TABLE
--Each departmnet has multiple department
create table Department(
    deptID SERIAL PRIMARY KEY,
    deptName VARCHAR(20) NOT NULL
)

SELECT * FROM Department;

INSERT INTO Department VALUES(1,'CSE');
DELETE from Department WHERE deptID=1;



--Employee TABLE
--each employee belongs to a department
create table Employee(
    empID SERIAL PRIMARY KEY,
    empName VARCHAR(20) NOT NULL,
    departmentID INT,
    CONSTRAINT fk_constraint_dept
        FOREIGN KEY (departmentID)
        REFERENCES Department(deptID)
)

SELECT * FROM Employee;

INSERT INTO Employee VALUES(1,'Shamim', 1);
DELETE FROM Employee WHERE empID=1;


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
