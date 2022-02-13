-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OJaefs
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Physical

CREATE TABLE "Employee" (
    "employee_no" INT   NOT NULL,
    "title_id" VARCHAR(255)   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "Sex" varchar(2)   NOT NULL,
    "hire_date" var_char   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "Department" (
    "department_id" varchar(20)   NOT NULL,
    "department_name" varchar(20)   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" varchar(20)   NOT NULL,
    "title_name" varchar(20)   NOT NULL
);

CREATE TABLE "Employee_Department" (
    "employee_id" varchar(20)   NOT NULL,
    "department_id" varchar(20)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Deprtment_manager" (
    "dept_no" VARCHAR(20)   NOT NULL,
    "emp_no" integer   NOT NULL
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_title_id" FOREIGN KEY("title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Employee_Department" ADD CONSTRAINT "fk_Employee_Department_employee_id" FOREIGN KEY("employee_id")
REFERENCES "Employee" ("employee_no");

ALTER TABLE "Deprtment_manager" ADD CONSTRAINT "fk_Deprtment_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("department_id");

ALTER TABLE "Deprtment_manager" ADD CONSTRAINT "fk_Deprtment_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("employee_no");

