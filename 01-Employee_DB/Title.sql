CREATE TABLE Title(
	emp_no int,
    title varchar,
	from_date date,
	to_date date,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Title;