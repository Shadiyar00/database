--Запрос 1
SELECT * FROM countries WHERE name = 'string';
CREATE INDEX idx_countries_names ON countries(name);

--Запрос 2
SELECT * FROM employees WHERE name = 'string' AND surname = 'string';
CREATE INDEX idx_employees_surn_name ON employees(name, surname);

--Запрос 3
SELECT * FROM employees WHERE salary < value1 AND salary > value2;
CREATE UNIQUE INDEX idx_employees_salary ON employees(salary);

--Запрос 4
SELECT * FROM employees WHERE substring(name FROM 1 for 4) = 'abcd';
CREATE INDEX idx_employees_subnames ON employees ((substring(name FROM 1 FOR 4)));

--Запрос 5 с JOIN
SELECT *
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > value2 AND e.salary < value2;

--Индексы для JOIN
CREATE INDEX idx_employee_dep_id ON employees(department_id);
CREATE INDEX idx_dep_dep_id ON departments(department_id);
CREATE INDEX idx_dep_budget ON departments(budget);
CREATE INDEX idx_employee_salary ON employees(salary);
