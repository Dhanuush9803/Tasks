--- Generate consecutive numbers for each record location-wise

SELECT 
  location,
  ROW_NUMBER() OVER (PARTITION BY location ORDER BY id) AS consecutive_number
FROM employee;


---  Derive a new table called "employee_updated" from the "employee" table with no duplicates

CREATE TABLE employee_updated AS
SELECT DISTINCT * FROM employee;


---  Retrieve all duplicate phone numbers from the "employee" table

SELECT phone_number, COUNT(*) AS count
FROM employee
GROUP BY phone_number
HAVING COUNT(*) > 1;


---  Show the difference between ROW_NUMBER and ROWID

SELECT 
  ROW_NUMBER() OVER (ORDER BY id) AS row_number,
  ROWID AS rowid,
  id,
  name
FROM employees;


---  the common table expressions (CTEs)
---- Case 1: Arrange the employees in increasing order of their salary

SELECT *
FROM employee
ORDER BY salary ASC;


---- Case 2: Arrange the employees based on the increasing order of their salary location wise

WITH sorted_employees AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary) AS row_num
  FROM employee
)
SELECT *
FROM sorted_employees;


---- Case 3: Pick the employee with the second-highest salary in each location

WITH ranked_employees AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary DESC) AS rank
  FROM employee
)
SELECT *
FROM ranked_employees
WHERE rank = 2;


---- Case 4: Pick the employee with the least salary in each location

WITH ranked_employees AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary) AS rank
  FROM employee
)
SELECT *
FROM ranked_employees
WHERE rank = 1;
