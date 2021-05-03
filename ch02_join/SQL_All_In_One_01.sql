-- SQL/DB ALL IN ONE 01
-- MAY 3, 2021
-- #01. INNER JOIN 

-- Ex01. Inner Join two different tables. 
-- A customer can have several payment records
-- A payment record must have customer_id. 

select * from customer; -- customer_id, first_name, last_name, email
select * from payment; -- amount, payment_date

SELECT
	  A.CUSTOMER_ID
	, A.FIRST_NAME
	, A.LAST_NAME
	, A.EMAIL
	, B.AMOUNT
	, B.PAYMENT_DATE
FROM
	CUSTOMER A 
INNER JOIN 
	PAYMENT B
ON 
	A.CUSTOMER_ID = B.CUSTOMER_ID 
	;
-- expansion
-- Get customer_id is '2'
SELECT
	  A.CUSTOMER_ID
	, A.FIRST_NAME
	, A.LAST_NAME
	, A.EMAIL
	, B.AMOUNT
	, B.PAYMENT_DATE
FROM
	CUSTOMER A 
INNER JOIN 
	PAYMENT B
ON 
	A.CUSTOMER_ID = B.CUSTOMER_ID 
where 
	A.customer_id = 2
	;

	
-- #Ex02. Inner Join with three tables
-- A Clerk process several payment process. 
-- A payment must have a clerk who processed
-- A customer can have several payment records
-- A payment detail must have a customer

select * from staff; -- first_name, last_name

SELECT
	  A.CUSTOMER_ID
	, A.FIRST_NAME
	, A.LAST_NAME
	, A.EMAIL
	, B.AMOUNT
	, B.PAYMENT_DATE
	, C.FIRST_NAME AS S_FIRST_NAME
	, C.LAST_NAME AS S_LAST_NAME
FROM
	CUSTOMER A 
INNER JOIN 
	PAYMENT B
ON 
	A.CUSTOMER_ID = B.CUSTOMER_ID
INNER JOIN 
	STAFF C
ON B.STAFF_ID = C.STAFF_ID 
	;
	

-- #02. OUTER JOIN
-- Ex#01. LEFT OUTER JOIN
SELECT
	  A.CUSTOMER_ID
	, A.FIRST_NAME
	, A.LAST_NAME
	, A.EMAIL
	, B.AMOUNT
	, B.PAYMENT_DATE
FROM
	CUSTOMER A 
LEFT JOIN 
	PAYMENT B
ON 
	A.CUSTOMER_ID = B.CUSTOMER_ID 
	;

-- Ex#02. LEFT ONLY
SELECT
	  A.CUSTOMER_ID
	, A.FIRST_NAME
	, A.LAST_NAME
	, A.EMAIL
	, B.AMOUNT
	, B.PAYMENT_DATE
FROM
	CUSTOMER A 
LEFT JOIN 
	PAYMENT B
ON 
	A.CUSTOMER_ID = B.CUSTOMER_ID 
WHERE B.PAYMENT_DATE IS NULL
	;
	
-- Viceversa for the right outer join and right only


-- #03. SELF JOIN 
CREATE TABLE EMPLOYEE
(
EMPLOYEE_ID INT PRIMARY KEY
, FIRST_NAME VARCHAR (255) NOT NULL
, LAST_NAME VARCHAR (255) NOT NULL
, MANAGER_ID INT
, FOREIGN KEY (MANAGER_ID)
REFERENCES EMPLOYEE (EMPLOYEE_ID)
ON DELETE CASCADE
);

INSERT INTO EMPLOYEE (
EMPLOYEE_ID
, FIRST_NAME
, LAST_NAME
, MANAGER_ID
)
VALUES
(1, 'Windy', 'Hays', NULL),
(2, 'Ava', 'Christensen', 1),
(3, 'Hassan', 'Conner', 1),
(4, 'Anna', 'Reeves', 2),
(5, 'Sau', 'Norman', 2),
(6, 'Kelsie', 'Hays', 3),
(7, 'Tory', 'Goff', 3),
(8, 'Salley', 'Lester', 3);

select * from employee;

-- Ex#01. Print each employee's boss and Top manager must not included in the result set. 

SELECT 
      E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE
	, M.FIRST_NAME || ' ' || M.LAST_NAME MANAGER
FROM 
	EMPLOYEE E
INNER JOIN 
	EMPLOYEE M
ON 
	M.EMPLOYEE_ID = E.MANAGER_ID 
ORDER BY 
	MANAGER DESC
	;

-- Ex#02. Indefinite Type Self join
SELECT 
      F1.TITLE
	, F2.TITLE
	, F1.LENGTH
FROM 
	FILM F1
INNER JOIN 
	FILM F2
ON 
	F1.FILM_ID <> F2.FILM_ID -- searching different movies
AND
	F1.LENGTH = F2.LENGTH -- but same lenghth.
	;



-- #04. FULL OUTER JOIN
CREATE TABLE
IF NOT EXISTS DEPARTMENTS
(
DEPARTMENT_ID SERIAL PRIMARY KEY
, DEPARTMENT_NAME VARCHAR (255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS EMPLOYEES
(
EMPLOYEE_ID SERIAL PRIMARY KEY
, EMPLOYEE_NAME VARCHAR (255)
, DEPARTMENT_ID INTEGER
);

INSERT INTO DEPARTMENTS
(DEPARTMENT_NAME)
VALUES
('Sales')
, ('Marketing')
, ('HR')
, ('IT')
, ('Production');

INSERT INTO EMPLOYEES
( EMPLOYEE_NAME
, DEPARTMENT_ID
)
values
('Bette Nicholson', 1),
('Christian Gable', 1),
('Joe Swank', 2),
('Fred Costner', 3),
('Sandra Kilmer', 4),
('Julia Mcqueen', NULL);

-- Ex#01 Full outer Join 
SELECT 
	  E.EMPLOYEE_NAME
	, D.DEPARTMENT_NAME
FROM 
	EMPLOYEES E
FULL OUTER JOIN 
	DEPARTMENTS D
ON 
	D.DEPARTMENT_ID = E.DEPARTMENT_ID
	;
	
-- Ex#02 Full Outer Join - Left Only
-- Full outer + Left Only = Left outer + Left Only
SELECT 
	  E.EMPLOYEE_NAME
	, D.DEPARTMENT_NAME
FROM 
	EMPLOYEES E
FULL OUTER JOIN 
	DEPARTMENTS D
ON 
	D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE
	D.DEPARTMENT_ID IS NULL
	;


-- #05. CROSS JOIN
-- CARTESIAN PRODUCT

CREATE TABLE CROSS_T1
(
LABEL CHAR(1) PRIMARY KEY
);

CREATE TABLE CROSS_T2
(
SCORE INT PRIMARY KEY
);

INSERT INTO CROSS_T1 (LABEL)
VALUES
('A'),
('B');

INSERT INTO CROSS_T2 (SCORE)
VALUES
(1),
(2),
(3);

-- #Ex01. Cross Join 
SELECT
	*
FROM
	CROSS_T1
CROSS JOIN
	CROSS_T2
	;