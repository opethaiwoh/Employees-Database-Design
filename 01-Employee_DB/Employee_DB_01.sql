CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM "Employees"

CREATE TABLE "Department_Manager" (
    "emp_no" int   NOT NULL,
    "dept_no" char   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

SELECT * FROM "Department_Manager"


CREATE TABLE "Department_Employee" (
    "emp_no" int   NOT NULL,
    "dept_no" char   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

SELECT * FROM "Department_Employee"


CREATE TABLE "Departments" (
    "dept_no" char   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

SELECT * FROM "Departments"

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" serial   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

SELECT * FROM "Salaries"

CREATE TABLE "Title" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

SELECT * FROM "Title"

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Title" ADD CONSTRAINT "fk_Title_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

