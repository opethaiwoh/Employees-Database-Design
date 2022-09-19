-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    emp_no int   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    gender varchar(10)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM "Employees"

CREATE TABLE "Title" (
    title_id serial   NOT NULL,
    emp_no int   NOT NULL,
    title varchar(50)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

SELECT * FROM "Title"

CREATE TABLE "Departments" (
    dept_no varchar(50)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

SELECT * FROM "Departments"


CREATE TABLE "Department_Employee" (
    id serial   NOT NULL,
    emp_no int   NOT NULL,
    dept_no varchar(50)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        id
     )
);

SELECT * FROM "Department_Employee"


CREATE TABLE "Department_Manager" (
    id serial   NOT NULL,
    emp_no int   NOT NULL,
    dept_no varchar(50)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        id
     )
);

SELECT * FROM "Department_Manager"


CREATE TABLE "Salaries" (
    salary_id serial   NOT NULL,
    emp_no int   NOT NULL,
    salary varchar(50)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        salary_id
     )
);

SELECT * FROM "Salaries"

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

