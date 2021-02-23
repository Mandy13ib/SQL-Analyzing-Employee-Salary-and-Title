DROP TABLE employee;
-- select csv file to pull from
SELECT * FROM employee;

-- select where to get employee info from
SELECT * FROM employee;

--pull employee info from csv file
SELECT
	emp_no, first_name, last_name,sex
FROM employee;

SELECT * FROM salaries;

-- select where to get salary info from
SELECT * FROM salaries;

--pull salary info from csv file
SELECT
	emp_no, salary
FROM salaries;

-- join employee and salary tables
SELECT employee.emp_no, employee.first_name, employee.last_name, employee.sex, salaries.salary
FROM salaries
INNER JOIN employee ON employee.emp_no=salaries.emp_no

-- add hire date
SELECT 
first_name, last_name, hire_date
FROM employee
-- looking for dates in 1986
WHERE hire_date between date '01/01/1986' and '12/31/1986'

SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM titles;
-- join employee and salary tables
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
FROM employee
JOIN dept_manager ON employee.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no;

-- list the department for employees
SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM EMPLOYEE
JOIN dept_manager ON dept_manager.emp_no=employee.emp_no
JOIN departments ON dept_manager.dept_no=departments.dept_no;

-- Look for hercules
SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
WHERE first_name= 'Hercules' and last_name LIKE 'B%';

--INSERT INTO department employee table
CREATE TABLE dept_emp(
		emp_no INT,
	dept_no VARCHAR
	)
--list employees in sales department
CREATE TABLE dept_emp AS
SELECT 
	dept_emp.emp_no, employee.last_name, employee.first_name,departments.dept_name
FROM departments
INNER JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employee ON 
employee.emp_no = dept_emp.emp_no
WHERE dept_name= 'Sales' 

-- list the employees in sales and development departments
CREATE TABLE sales_and_Development_staff AS
SELECT
	employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM departments
INNER JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employee ON 
employee.emp_no = dept_emp.emp_no
WHERE dept_name IN ('Sales','Development');

-- descending order frequency counts of employee last name 
SELECT employee.last_name, COUNT(*) as frequency
FROM employee
GROUP BY last_name
ORDER BY COUNT(*) DESC;
