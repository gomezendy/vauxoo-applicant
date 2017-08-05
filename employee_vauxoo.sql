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