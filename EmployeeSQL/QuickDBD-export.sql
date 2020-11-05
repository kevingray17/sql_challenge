-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/kcYlVc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "titles_table" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles_table" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees_table" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees_table" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments_table" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments_table" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager_table" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_manager_table" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_emp_table" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp_table" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "salaries_table" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries_table" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "employees_table" ADD CONSTRAINT "fk_employees_table_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles_table" ("title_id");

ALTER TABLE "dept_manager_table" ADD CONSTRAINT "fk_dept_manager_table_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_table" ("emp_no");

ALTER TABLE "dept_manager_table" ADD CONSTRAINT "fk_dept_manager_table_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments_table" ("dept_no");

ALTER TABLE "dept_emp_table" ADD CONSTRAINT "fk_dept_emp_table_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_table" ("emp_no");

ALTER TABLE "dept_emp_table" ADD CONSTRAINT "fk_dept_emp_table_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments_table" ("dept_no");

ALTER TABLE "salaries_table" ADD CONSTRAINT "fk_salaries_table_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_table" ("emp_no");

