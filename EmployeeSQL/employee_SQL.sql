
-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, first_name, s.emp_no, sex, s.salary FROM salaries_table s
JOIN employees_table e ON s.emp_no = e.emp_no
ORDER BY e.emp_no ASC;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees_table 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- SELECT e.emp_no, dm.dept_no, dt.dept_name, e.first_name, e.last_name
SELECT dm.dept_no, dt.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager_table dm
INNER JOIN employees_table e ON dm.emp_no = e.emp_no
INNER JOIN departments_table dt ON dt.dept_no = dm.dept_no 
ORDER BY dm.dept_no ASC, e.emp_no ASC;


-- List the  department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp_table de
INNER JOIN departments_table d ON
de.dept_no=d.dept_no
INNER JOIN employees_table e ON
de.emp_no=e.emp_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees_table
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp_table de
INNER JOIN departments_table d ON
de.dept_no=d.dept_no
INNER JOIN employees_table e ON
de.emp_no=e.emp_no
WHERE d.dept_name='Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp_table de
INNER JOIN departments_table d ON
de.dept_no=d.dept_no
INNER JOIN employees_table e ON
de.emp_no=e.emp_no
WHERE d.dept_name='Sales' OR
d.dept_name='Development'
ORDER BY d.dept_name ASC, e.last_name ASC; 

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(*) AS number_of_employees, last_name FROM employees_table
GROUP BY last_name
ORDER BY number_of_employees DESC;
