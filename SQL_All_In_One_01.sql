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
-- 
