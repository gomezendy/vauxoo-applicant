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