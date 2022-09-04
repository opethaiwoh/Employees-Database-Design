CREATE TABLE Salaries(
	emp_no int,
    salary serial,
	from_date date,
	to_date date,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
SELECT * FROM Salaries;