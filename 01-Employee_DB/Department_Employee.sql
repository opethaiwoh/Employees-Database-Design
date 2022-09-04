CREATE TABLE Department_Employee(
	emp_no int,
    dept_no char,
	from_date date,
	to_date date,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Department_Employee