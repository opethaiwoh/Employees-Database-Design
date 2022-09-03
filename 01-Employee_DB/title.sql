-- Create department employee table
create table dept_emp (
emp_no INT NOT NULL,
dept_no VARCHAR(8) NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
);
SELECT * From dept_emp;