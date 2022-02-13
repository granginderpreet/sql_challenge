-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OJaefs
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Physical
DROP TABLE if exists "Employee" CASCADE;
DROP TABLE if exists  "Department" CASCADE;
DROP TABLE if exists "Titles" CASCADE;
DROP TABLE if exists "Employee_Department" CASCADE ;
DROP TABLE if exists "Salaries" CASCADE;
DROP TABLE IF exists "Department_manager" CASCADE;

CREATE TABLE "Employee" (
    "employee_no" INT   NOT NULL,
    "title_id" VARCHAR(255)   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "Sex" varchar(2)   NOT NULL,
    "hire_date" varchar(25)   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "Department" (
    "department_id" varchar(20)   NOT NULL,
    "department_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar(20)   NOT NULL,
    "title_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employee_Department" (
    "employee_id" int  NOT NULL,
    "department_id" varchar(20)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Department_manager" (
    "dept_no" VARCHAR(20)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_Department_manager" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_title_id" FOREIGN KEY("title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Employee_Department" ADD CONSTRAINT "fk_Employee_Department_employee_id" FOREIGN KEY("employee_id")
REFERENCES "Employee" ("employee_no");

ALTER TABLE "Department_manager" ADD CONSTRAINT "fk_Department_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("department_id");

ALTER TABLE "Department_manager" ADD CONSTRAINT "fk_Department_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("employee_no");

Select * from "Employee" as e;

SELECT * from "Salaries" as s;

SELECT *  from "Department" as d;

SELECT * from "Department_manager" as dm;

SELECT * from "Employee_Department" as ed;

SELECT *  from "Titles" as t;

SELECT e.employee_no , 
e.last_name, 
e.first_name,
e."Sex",
s.salary
FROM "Employee" as e
left join "Salaries" as s on 
s.emp_no = e.employee_no ;

SELECT "Employee".employee_no , 
"Employee".first_name,
"Employee".last_name, 
"Employee".hire_date 
FROM "Employee" 
where "Employee".hire_date like '%/1986'

#3: department number, department name, the manager's employee number, last name, first name.
																			
select dm.dept_no, d.department_name, e.employee_no , 
e.last_name,
e.first_name
from "Department_manager" as dm 
left join "Department" as d on 
dm.dept_no=d.department_id 
left join 
"Employee" as e 
on dm.emp_no=e.employee_no


#4
#employee number, last name, first name, and department name.
select e.employee_no, e.last_name, e.first_name, d.department_name
from "Employee" as e  left join "Employee_Department" as ed on e.employee_no=ed.employee_id
left join "Department" as d on 
ed.department_id=d.department_id


#5
#List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e."Sex"
from "Employee" as e  where e.first_name ='Hercules' and  e.last_name like 'B%'

#6: List all employees in the Sales department, including their employee number, last name, first name, and department name.
select  e.last_name, e.first_name,e.employee_no, d.department_name
from "Employee" as e  left join "Employee_Department" as ed on e.employee_no=ed.employee_id 
left join "Department" as d on 
ed.department_id=d.department_id where 
d.department_name like 'Sales'


#7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select  e.last_name, e.first_name,e.employee_no, d.department_name
from "Employee" as e  left join "Employee_Department" as ed on e.employee_no=ed.employee_id 
left join "Department" as d on 
ed.department_id=d.department_id where 
d.department_name like 'Sales' or d.department_name like 'Development'

#8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select  e.last_name, count(e.last_name) as Frequency 
from "Employee" as e
group by e.last_name
order by count(e.last_name) DESC


-- WHERE actor_id IN
-- (
--   SELECT actor_id
--   FROM film_actor
--   WHERE film_id IN
--   (
--     SELECT film_id
--     FROM film
--     WHERE title ='ALTER VICTORY'
--   )
-- );
