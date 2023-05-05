CREATE DATABASE OLIVE_HOSPITAL;


CREATE TABLE marital_status(
   status_id INT PRIMARY KEY, 
   status_name VARCHAR(20)
);

CREATE TABLE state_(
    state_id INT PRIMARY KEY, 
    state_name VARCHAR(15)
);

CREATE TABLE types_(
    types_id INT PRIMARY KEY, 
    types_name VARCHAR(20)
);

CREATE TABLE re_occurence_status(
    re_occurence_id INT PRIMARY KEY,
    re_occurence_name VARCHAR(15)
);

CREATE TABLE patient_category(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(15)
);

 CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20),
	hod_id INT
	FOREIGN KEY(hod_id) REFERENCES employees(employee_id) ON DELETE SET NULL
);

CREATE TABLE employees(
    employee_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    gender VARCHAR(10),
    date_of_birth VARCHAR(12),
    contact VARCHAR(11),
    status_id INT,
    allergies VARCHAR(100),
    dept_id INT,
	super_id INT
);

ALTER TABLE employees
ADD FOREIGN KEY(dept_id)
REFERENCES department(dept_id)
ON DELETE SET NULL;

ALTER TABLE employees
ADD FOREIGN KEY(super_id)
REFERENCES employees(employee_id);

ALTER TABLE employees
ADD FOREIGN KEY(status_id)
REFERENCES marital_status(status_id);

CREATE TABLE patients(
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT, 
    status_id INT FOREIGN KEY REFERENCES marital_status,
    gender VARCHAR(10),
    weight_ DECIMAL (5,2),
    height DECIMAL (5,1),
    blood_group VARCHAR(7),
    genotype VARCHAR(15),
    contact VARCHAR(11),
    email VARCHAR(50),
    allergies VARCHAR(100),
    re_occurence_status_id INT FOREIGN KEY REFERENCES re_occurence_status,
    date_of_incidence DATE,
    relative_contact INT,
    relative_relationship VARCHAR(100),
    patient_category_id INT FOREIGN KEY REFERENCES patient_category,
    types_id INT FOREIGN KEY REFERENCES types_,
    state_id INT FOREIGN KEY REFERENCES state_,
    employee_id INT FOREIGN KEY REFERENCES employees,
    dept_id INT FOREIGN KEY REFERENCES department,
    report VARCHAR(1000)
);



--General Doctors
(INSERT INTO employees statement)
(INSERT INTO department statement)

UPDATE employees
SET dept_id =
WHERE employee_id = ;

(INSERT INTO employees statement)

--Surgical
(INSERT INTO employees statement)
(INSERT INTO department statement)

UPDATE employees
SET dept_id = 
WHERE employee_id = ;

(INSERT INTO employees statement)

--Para-Medics
(INSERT INTO employees statement)
(INSERT INTO department statement)

UPDATE employees
SET dept_id = 
WHERE employee_id = ;

(INSERT INTO employees statement)

INSERT INTO marital_status VALUES(1,'Married');
INSERT INTO marital_status VALUES(2,'Single');
INSERT INTO marital_status VALUES(3,'Separated');
INSERT INTO marital_status VALUES(4,'Divorced');
INSERT INTO marital_status VALUES(5,'Widowed');

INSERT INTO state_ VALUES(1,'Terminal');
INSERT INTO state_ VALUES(2,'Non-Terminal');

INSERT INTO types_ VALUES(1,'Communicable');
INSERT INTO types_ VALUES(2,'Non-Communicable');

INSERT INTO re_occurence_status VALUES(1,'Never');
INSERT INTO re_occurence_status VALUES(2,'Always');
INSERT INTO re_occurence_status VALUES(3,'Often');

INSERT INTO patient_category VALUES(1,'In-Patient');
INSERT INTO patient_category VALUES(2,'Out-Patient');


