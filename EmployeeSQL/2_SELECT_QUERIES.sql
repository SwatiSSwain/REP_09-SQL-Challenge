--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	e.emp_no AS "employee number"
   ,e.last_name AS "last name"
   ,e.first_name AS "first name"
   ,e.sex
   ,s.salary
  FROM employee e
  JOIN salary s
   ON e.emp_no=s.emp_no
  ORDER BY e.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	e.first_name AS "first name"
   ,e.last_name AS "last name"
   ,e.hire_date AS "hire date"
  FROM employee e
   WHERE EXTRACT(YEAR FROM hire_date)='1986'
  ORDER BY e.hire_date;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
	d.dept_no AS "department number"
   ,d.dept_name AS "department name"
   ,e.emp_no AS "manager employee number"
   ,e.last_name AS "manager last name"
   ,e.first_name AS "manager first name"
  FROM department d
   JOIN dept_manager dm
   ON d.dept_no = dm.dept_no
   JOIN employee e
   ON e.emp_no=dm.emp_no
  ORDER BY d.dept_no
         , e.emp_no;
   
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
    e.emp_no AS "employee number"
   ,e.last_name AS "last name"
   ,e.first_name AS "first name"
   ,d.dept_name AS "department name"
  FROM department d
   JOIN dept_emp de
   ON d.dept_no = de.dept_no
   JOIN employee e
   ON e.emp_no=de.emp_no
  ORDER BY d.dept_no
         , e.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	e.first_name AS "first name"
   ,e.last_name AS "last name"
   ,e.sex
  FROM employee e
   WHERE UPPER(e.first_name) = 'HERCULES'
   AND UPPER(e.last_name) LIKE 'B%'
  ORDER BY e.last_name;
   
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
    e.emp_no AS "employee number"
   ,e.last_name AS "last name"
   ,e.first_name AS "first name"
   ,d.dept_name AS "department name"
  FROM department d
   JOIN dept_emp de
   ON d.dept_no = de.dept_no
   JOIN employee e
   ON e.emp_no=de.emp_no
  WHERE UPPER(d.dept_name) = 'SALES'
  ORDER BY e.emp_no;  

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
    e.emp_no AS "employee number"
   ,e.last_name AS "last name"
   ,e.first_name AS "first name"
   ,d.dept_name AS "department name"
  FROM department d
   JOIN dept_emp de
   ON d.dept_no = de.dept_no
   JOIN employee e
   ON e.emp_no=de.emp_no
  WHERE UPPER(d.dept_name) IN ('SALES', 'DEVELOPMENT')
  ORDER BY d.dept_name
         , e.emp_no;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
	  e.last_name
	 ,COUNT(e.last_name) AS "emp last name count"
	FROM employee e
	GROUP BY e.last_name
	ORDER BY COUNT(e.last_name) DESC
	        ,e.last_name;