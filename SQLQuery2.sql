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
    weight_ DECIMAL (10,1),
    height DECIMAL (10,1),
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
INSERT INTO employees VALUES(01,'Cynthia','Morgan','female','2001-12-02','08189176543',1,'None',NULL,NULL);

INSERT INTO department VALUES(100,'General Doctors',01);

UPDATE employees
SET dept_id =100
WHERE employee_id =01;

INSERT INTO employees VALUES(02,'Adewuyi','African','male','1999-04-12','08115564380',1,'Peanuts',100,01);
INSERT INTO employees VALUES(03,'Angel','Kitchens','female','1978-11-04','0705467820',1,'None',100,01);
INSERT INTO employees VALUES(04,'Amanda','Cole','female','1970-01-01','08023478599',1,'Egg',100,01);
INSERT INTO employees VALUES(011,'Caleb','Morris','male','1997-02-02','08026732409',1,'Lime',100,01);
INSERT INTO employees VALUES(012,'Dannie','Johnson','female','2000-12-14','09143256088',4,'Nuts',100,01);

--Surgical
INSERT INTO employees VALUES(06,'Cynthia','Germain','female','2001-04-20','09152540000',2,'None',NULL,NULL);

INSERT INTO department VALUES(101,'Surgical',06);

UPDATE employees
SET dept_id = 101
WHERE employee_id =06;

INSERT INTO employees VALUES(07,'Jude','Oba','male','2001-06-25','08184045677',1,'None',101,06);
INSERT INTO employees VALUES(08,'Morgan','Aiden','female','2000-06-13','07034567211',2,'Nuts',101,06);
INSERT INTO employees VALUES(018,'Amanda','Crose','female','1978-11-10','09134222000',3,'Dust',101,06);
INSERT INTO employees VALUES(019,'Albert','De-Rio','male','1998-08-04','08056678866',3,'Lime',101,06);
INSERT INTO employees VALUES(020,'Osas','Abraham','male','1994-10-18','08113200900',2,'Nuts',101,06);

--Para-Medics
INSERT INTO employees VALUES(09,'Amaka','George','female','2000-11-29','09142425942',2,'None',NULL,NULL);

INSERT INTO department VALUES(102, 'Para-Medics',09);

UPDATE employees
SET dept_id = 102
WHERE employee_id =09;

INSERT INTO employees VALUES(010,'Cyril','Johnson','male','1999-05-23','08189323564',2,'None',102,09);
INSERT INTO employees VALUES(013,'Sabrella','Monet','female','1978-12-25','09023075092',1,'None',102,09);
INSERT INTO employees VALUES(014,'Ini','Obong','male','1997-07-24','08142375644',1,'None',102,09);
INSERT INTO employees VALUES(015,'Adam','Kabir','male','1971-10-21','08167856433',1,'None',102,09);
INSERT INTO employees VALUES(016,'Joshua','Colt','male','1972-11-01','09045678901',1,'Lemons',102,09);
INSERT INTO employees VALUES(017,'Ajayi','Crowther','male','2000-05-23','08192927864',1,'None',102,09);


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

INSERT INTO patients VALUES(015,'Jake','Wright',33,2,'male',12.4,6.2,'B+ve','AB','0912330000','longas@gmail.com','Corn',2,'2012-04-12','0816754545','Sister',2,1,1,017,100,'Accident');
INSERT INTO patients VALUES(062,'Lance','Willy',40,1,'male',12.4,6.2,'B+ve','AB','0912765438','mangoas@gmail.com','Air',2,'2012-04-12','0816754545','Sister',2,1,1,017,100,'Shot');
INSERT INTO patients VALUES(091,'John','Dohn',20,3,'male',12.4,6.2,'B+ve','AB','0912334987','liveras@gmail.com','Cornflakes',2,'2012-04-12','0816754545','Sister',2,1,1,017,100,'Car');
INSERT INTO patients VALUES(046,'Cornell','Curry',41,2,'female',12.4,6.2,'B+ve','AB','0912337654','moonas@gmail.com','Cornflakes',2,'2012-04-12','0816754545','Sister',2,1,1,017,100,'Fight');

SELECT first_name, last_name
FROM employees
WHERE dept_id =100;


SELECT employees.employee_id, employees.first_name, department.dept_name
FROM employees
JOIN department
ON employees.employee_id =department.hod_id;
 
 CREATE VIEW
 employee_id AS
 SELECT employee_id,last_name
 FROM employees
 WHERE employee_id >= 7;

 SELECT * FROM employee_id
 WHERE employee_id >=7;

 SELECT CONCAT(last_name, '  ', first_name) AS 'FULL_NAME'
 FROM employees
 ORDER BY last_name ASC;

 SELECT * FROM employees 
 WHERE first_name like '%w%';

 SELECT * FROM employees
 WHERE allergies = 'lime';

 SELECT * FROM employees
 WHERE first_name like '____b';

 SELECT COUNT (*) FROM employees
 WHERE status_id = 1;

 select * from marital_status