-- 1. Employees earning more than their department average
SELECT e.employee_id,
       e.employee_name,
       e.salary,
       e.department_id
FROM employees e
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);


-- 2. Find departments with no employees
SELECT d.department_id,
       d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;


-- 3. Find the 2nd highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);


-- 4. Employees who never made a sale
SELECT e.employee_id,
       e.employee_name
FROM employees e
LEFT JOIN sales s
ON e.employee_id = s.employee_id
WHERE s.sale_id IS NULL;


-- 5. Department with the highest total salary
SELECT department_id,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 1;