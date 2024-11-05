--1
CREATE DATABASE lab6;

--2
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    streeet_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY ,
    department_name VARCHAR(50) UNIQUE ,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);


INSERT INTO locations(streeet_address, postal_code, city, state_province)
VALUES ('Tolebi', '1HS5', 'Almaty', 'province1'),
       ('Gogol', 'fdb8', 'Almaty', 'province4'),
       ('Street', 'xwsms3', 'Astana', 'province2');

INSERT INTO departments(department_name, budget, location_id)
VALUES ('Dep1', 10000, 1),
       ('Dep2', 20000, 3),
       ('Dep3', 35000, 2);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES ('Sasha', 'Shabalina', 'a_shabalina', '877777777', 1000000, 1),
       ('Lila', 'Smith', 'lilasm', '873737', 800000, 2),
       ('Nina', 'Li', 'liii', '848747', 3000000, 2);


--3
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

--4
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = 80 OR d.department_id = 40;

--5
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--6
SELECT d.department_name
FROM departments d
LEFT JOIN employees ON d.department_id = employees.department_id;

--7
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
