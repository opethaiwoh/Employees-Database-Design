-- Create employees table
create table employees (
emp_no INT PRIMARY KEY NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(35) NOT NULL,
last_name VARCHAR(35) NOT NULL,
gender VARCHAR(1)NOT NULL,
hire_date DATE NOT NULL
);
