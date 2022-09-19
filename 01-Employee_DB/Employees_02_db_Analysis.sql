CREATE TABLE Employees(
	emp_no int,
    birth_date date,
    first_name varchar,
    last_name varchar,
    gender  varchar,
    hire_date date,
PRIMARY KEY (emp_no)
);

SELECT * FROM "Employees"

-- 1. Create a view that holds the retirement eligibile employees.

CREATE VIEW retirement_info AS
SELECT emp_no, birth_date AS b, hire_date AS h, first_name AS f, last_name AS l FROM "Employees" AS e
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
AND hire_date BETWEEN '1985-01-01' AND '1988-12-31';

-- 2. Create a view that holds a list of all the current employees, include the employee number, first and last name. 

CREATE VIEW current_employees AS
SELECT i.emp_no, d.to_date, i.f, i.l FROM retirement_info AS i
JOIN "Department_Employee" as d
ON (i.emp_no = d.emp_no)
WHERE d.to_date = '9999-01-01'
ORDER BY i.emp_no;

SELECT * FROM current_employees;

-- 3. Get the average salary by title for the current employees.

SELECT t.Title, avg(s.salary) AS avgSalary FROM current_employees AS cm
JOIN "Title" AS t
ON cm.emp_no = t.emp_no
JOIN "Salaries" AS s
ON cm.emp_no = s.emp_no
GROUP BY t.Title
ORDER BY avgSalary


-- 4. Get the average salary by department for the current employees. 
SELECT d.dept_name, avg(s.salary) as avgSalary FROM current_employees AS cm
JOIN "Salaries" AS s
ON cm.emp_no = s.emp_no
JOIN "Department_Employee" AS de
ON de.emp_no = cm.emp_no
JOIN "Departments" d
ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY avgSalary ASC


-- 5. Compare the average salary by title for each department for the current employees.

SELECT dept_name, title, ROUND(AVG(salary),2) Avg_salary FROM current_employees c
JOIN "Title" t ON c.emp_no = t.emp_no
JOIN "Department_Employee" de ON c.emp_no = de.emp_no
JOIN "Salaries" s ON c.emp_no = s.emp_no
JOIN "Departments" d ON d.dept_no = de.dept_no
Group by 1,2
order by title, Avg_salary;

-- 6. Determine the number of current employees by title and grouped within departments. 
-- And, rank the results by title within each department. 

SELECT title, dept_name, count(de.emp_no) curnt_emp_count, dense_rank() over (partition by dept_name order by count(de.emp_no) desc) rnk 
FROM current_employees c
JOIN "Title" t ON c.emp_no = t.emp_no
JOIN "Department_Employee" de ON c.emp_no = de.emp_no
JOIN "Departments" d ON d.dept_no = de.dept_no
Group by 1,2;
