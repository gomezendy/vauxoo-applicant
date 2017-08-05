-- Your sql code in this file
-- NOTE: Please, don't add sentence to create database in this script file.
--       You can create database locally to test it.
--       Consider add ';' at end sentence.

-- Create table from employees.
CREATE TABLE employee
(
    id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL
);

-- Create table from employee departaments.
CREATE TABLE employee_departament
(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(90) NOT NULL,
    description TEXT NOT NULL
);

-- Alter table employee, add id_departament with type INT.
ALTER TABLE employee ADD id_departament INT;

-- Alter table employee, add foreign key from employee departament.
ALTER TABLE employee
ADD CONSTRAINT employee_departament_id_fk
FOREIGN KEY (id_departament) REFERENCES employee_departament (id);

-- Insert data from employee departaments.
INSERT INTO employee_departament (name, description) VALUES ('Human Resources', 'Departament of Human Resources');
INSERT INTO employee_departament (name, description) VALUES ('IT Architecture', 'Departament of IT Architecture');
INSERT INTO employee_departament (name, description) VALUES ('IT Systems', 'Departament of IT Systems');
INSERT INTO employee_departament (name, description) VALUES ('Business', 'Departament of Business');
INSERT INTO employee_departament (name, description) VALUES ('Security and Networking', 'Departament of Security and Networking');
INSERT INTO employee_departament (name, description) VALUES ('Project Management', 'Departament of Project Management');

-- Insert data from employees.
INSERT INTO employee (id, first_name, last_name, id_departament) VALUES (20051885, 'Endy', 'Gómez', 3);
INSERT INTO employee (id, first_name, last_name, id_departament) VALUES (19968993, 'Isamar', 'Martínez', 1);
INSERT INTO employee (id, first_name, last_name, id_departament) VALUES (13229331, 'Luis', 'Mejía', 2);
INSERT INTO employee (id, first_name, last_name, id_departament) VALUES (12244432, 'Alice', 'Vargas', 3);

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
    id SERIAL PRIMARY KEY NOT NULL,
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