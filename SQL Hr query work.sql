
Use hr ;
-- 1. Retrieve all employee details
SELECT * FROM employees;

-- 2. Employees who joined after a specific date
SELECT * FROM employees WHERE hire_date > '1995-01-01';

-- 3. Total number of employees in each department
SELECT department_id, COUNT(*) AS total_employees
FROM employees GROUP BY department_id;

-- 4. Highest-paid employee
SELECT * FROM employees ORDER BY salary DESC LIMIT 1;

-- 5. Employees who report to a specific manager
SELECT * FROM employees WHERE manager_id = 103;

-- 6. Employees working in a specific department
SELECT * FROM employees WHERE department_id = 60;

-- 7. Employees with salary greater than a certain amount
SELECT * FROM employees WHERE salary > 10000;

-- 8. Average salary per department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees GROUP BY department_id;

-- 9. Employees with job titles containing “Manager”
SELECT e.* FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title LIKE '%Manager%';

-- 10. Departments with number of employees
SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 11. Employees working for more than five years
SELECT * FROM employees
WHERE hire_date < DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- 12. Employee details with job title and department
SELECT e.employee_id, e.first_name, e.last_name, j.job_title, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id;

-- 13. Identify duplicate employee records (by first and last name)
SELECT first_name, last_name, COUNT(*) AS duplicates
FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- 14. Employees earning within a salary range
SELECT * FROM employees
WHERE salary BETWEEN 5000 AND 10000;

-- 15. Employees with no assigned department
SELECT * FROM employees
WHERE department_id IS NULL;

-- 16. Employees ordered by hire date
SELECT * FROM employees
ORDER BY hire_date;

-- 17. Total salary expense per department
SELECT department_id, SUM(salary) AS total_salary_expense
FROM employees
GROUP BY department_id;

-- 18. Update an employee’s salary by percentage (example: +10% for employee_id = 105)
UPDATE employees
SET salary = salary * 1.10
WHERE employee_id = 105;

-- 19. Delete employees who left before a certain date (example: before 01-JAN-1995)
DELETE FROM employees
WHERE employee_id IN (
    SELECT employee_id 
    FROM job_history
    WHERE end_date < '1995-01-01'
);

-- 20. Employees with their manager’s name
SELECT e.employee_id, e.first_name AS employee_first, e.last_name AS employee_last,
       m.first_name AS manager_first, m.last_name AS manager_last
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
