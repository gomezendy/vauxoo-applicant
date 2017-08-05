-- Your sql code in this file
-- NOTE: Please, don't add sentence to create database in this script file.
--       You can create database locally to test it.
--       Consider add ';' at end sentence.

-- Create table from employees.
CREATE TABLE employee
(
    id INTEGER PRIMARY KEY NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL
);

-- Create table from employee Departments.
CREATE TABLE employee_department
(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(90) NOT NULL,
    description TEXT NOT NULL
);

-- Alter table employee, add id_department with type INTEGER.
ALTER TABLE employee ADD id_department INTEGER;

-- Alter table employee, add foreign key from employee Department.
ALTER TABLE employee
    ADD CONSTRAINT employee_department_id_fk
    FOREIGN KEY (id_department) REFERENCES employee_department (id);

-- Insert data from employee Departments.
INSERT INTO employee_department (name, description) VALUES ('Human Resources', 'Department of Human Resources');
INSERT INTO employee_department (name, description) VALUES ('IT Architecture', 'Department of IT Architecture');
INSERT INTO employee_department (name, description) VALUES ('IT Systems', 'Department of IT Systems');
INSERT INTO employee_department (name, description) VALUES ('Business', 'Department of Business');
INSERT INTO employee_department (name, description) VALUES ('Security and Networking', 'Department of Security and Networking');
INSERT INTO employee_department (name, description) VALUES ('Project Management', 'Department of Project Management');

-- Insert data from employees.
INSERT INTO employee (id, first_name, last_name, id_department) VALUES (20051885, 'Endy', 'Gómez', 3);
INSERT INTO employee (id, first_name, last_name, id_department) VALUES (19968993, 'Isamar', 'Martínez', 1);
INSERT INTO employee (id, first_name, last_name, id_department) VALUES (13229331, 'Luis', 'Mejía', 2);
INSERT INTO employee (id, first_name, last_name, id_department) VALUES (12244432, 'Alice', 'Vargas', 3);

-- Create table from employees hobby.
CREATE TABLE employee_hobby
(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(45) NOT NULL,
    description TEXT
);

-- Insert data from employees hobby.
INSERT INTO employee_hobby (name, description) VALUES ('Basketball', 'Sport in free days');
INSERT INTO employee_hobby (name, description) VALUES ('Make to music', 'Make to music in free time');
INSERT INTO employee_hobby (name, description) VALUES ('Photography', 'Photography in free days');

-- Create pivot table from employees and their hobbies. Many to Many.
CREATE TABLE employees_hobbies
(
    id_employee INTEGER REFERENCES employee (id),
    id_employee_hobby INTEGER REFERENCES employee_hobby (id)
);

-- Insert data from employees and their hobbies.
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (20051885, 1);
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (20051885, 2);
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (19968993, 3);
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (19968993, 1);
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (13229331, 3);
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (13229331, 1);
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (12244432, 2);
INSERT INTO employees_hobbies (id_employee, id_employee_hobby) VALUES (12244432, 1);

-- Alter table from employees, add column boss.
ALTER TABLE employee ADD COLUMN id_boss INTEGER;

-- Alter table from employees, add constraint foreign key.
ALTER TABLE employee ADD CONSTRAINT employee_boss_id_fk
    FOREIGN KEY (id_boss)
    REFERENCES employee (id);

-- Update table from employees, add id boss from employee.
UPDATE employee
    SET id_boss = 19968993
    WHERE id = 20051885;
UPDATE employee
    SET id_boss = 20051885
    WHERE id IN(13229331, 12244432);