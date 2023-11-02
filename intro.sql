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










INSERT INTO Employee VALUES(1,'Shamim', 1);



TRUNCATE TABLE users;
