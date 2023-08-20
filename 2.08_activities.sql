# 2.08 Activity 1

#In this activity, we will be using the table `district` from the `bank` database and according to the description for the different columns:

USE bank;

SELECT A4, A9, A10, A11, A12  FROM district;

-- A4: no. of inhabitants

SELECT A2, A4, 
	RANK () OVER (ORDER BY A4 ASC) AS 'RANK_no. of inhabitants',
    ROW_NUMBER () OVER (ORDER BY A4 ASC) AS 'ROW_NUMBER_no. of inhabitants',
    DENSE_RANK () OVER (ORDER BY A4 ASC) AS 'DENSE_RANK_no. of inhabitants'
FROM district;

-- A9: no. of cities

SELECT A2, A3, A9 AS 'No. Cities', RANK () OVER (PARTITION BY A3 ORDER BY A9) FROM district;

SELECT A2, A9, 
RANK () OVER (ORDER BY A9 ASC) AS 'no. of no. of cities',
ROW_NUMBER () OVER (ORDER BY A9 ASC) AS 'no. of no. of cities',
DENSE_RANK () OVER (ORDER BY A9 ASC) AS 'no. of no. of cities'
FROM district;

-- A10: the ratio of urban inhabitants

SELECT A2, A10, 
	RANK () OVER (ORDER BY A10 ASC) AS 'RANK_urban ratio of urban inhabitants',
	ROW_NUMBER () OVER (ORDER BY A10 ASC) AS 'ROW_NUMBER_urban ratio of urban inhabitants',
	DENSE_RANK () OVER (ORDER BY A10 ASC) AS 'DENSE_RANK_urban ratio of urban inhabitants'
FROM district;

-- A11: average salary

SELECT A2, A11, 
	RANK () OVER (ORDER BY A11 ASC) AS 'RANK_urban average salary',
	ROW_NUMBER () OVER (ORDER BY A11 ASC) AS 'ROW_NUMBER_urban average salary',
	DENSE_RANK () OVER (ORDER BY A11 ASC) AS 'DENSE_RANK_urban average salary'
FROM district;

-- A12: the unemployment rate

-- 1. Rank districts by different variables.
-- 2. Do the same but group by `region`.

# 2.08 Activity 2

-- Use the transactions table in the `bank` database to find the Top 20 `account_id`s based on the `amount`.

SELECT account_id, amount ,
	DENSE_RANK () OVER (ORDER BY amount DESC) AS 'Rank_amount'
FROM trans
LIMIT 20;

SELECT account_id, amount ,
	RANK () OVER (ORDER BY amount DESC) AS 'Rank_amount'
FROM trans
LIMIT 20;

-- Illustrate the difference between `rank()` and `dense_rank()`.

# 2.08 Activity 3

-- 1. Get a rank of districts ordered by the number of customers.

SELECT D.A2, COUNT(client_id) AS 'Cont_clientes',
	RANK () OVER (ORDER BY COUNT(c.client_id) ASC) AS 'Rank_client'
FROM bank.client c
JOIN bank.district D ON c.district_id = d.A1
GROUP BY A2;

-- 2. Get a rank of regions ordered by the number of customers.
-- 3. Get the total amount borrowed by the district together with the average loan in that district.
-- 4. Get the number of accounts opened by district and year.

