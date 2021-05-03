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
