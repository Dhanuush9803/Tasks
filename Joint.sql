###JOINS-----------------------------------------------------------------------------------------------------------------

---Write an SQL query to report the first name, last name, city, and state of each person in the Person table.
If the address of a personId is not present in the Address table, report null instead.---
									
CREATE TABLE PERSON(Id INT,Last_name varchar(100),First_name varchar(100));
CREATE TABLE Address(addressid int,personid int,city varchar(20),state varchar(20));

INSERT INTO PERSON 
VALUES
(99,'S','San'),
(100,'D','John'),
(101,'S','Mani'),
(102,'R','Raja'),
(103,'K','Sam');
INSERT INTO Address 
VALUES
(1000,99,'TUTICORIN','TAMILNADU'),
(1001,101,'TIRUPATI','ANDHRA PRADESH'),
(1002,103,'KOLLAM','KERALA'),
(1003,104,'SIRI','DELHI'),
(1004,105,'JAIPUR','RAJASTHAN');

SELECT P.First_name,P.Last_name,A.city,A.state,Id
FROM PERSON P
LEFT JOIN
Address A  ON P.id = A.personid;


----------------------------------------------------------------------------------------------------------------------------------------------------------------



---Find the second highest salary from the Employee table. If there is no second highest salary, return null ---					
					
CREATE TABLE EMPLOYEE(id int,salary int);
        
INSERT INTO EMPLOYEE
VALUES
(101,80000),
(102,75000),
(103,65000),
(105,98000),
(099,95000);
            
SELECT MAX(SALARY) AS 2_ND_Salary
FROM EMPLOYEE
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE);


----------------------------------------------------------------------------------------------------------------------------------------------------------------



---for the above employee table Find the nth highest salary from the Employee table. If there is no nth highest salary, return null.
The result format is in the following example.---					
					
SELECT DISTINCT e1.salary AS nth_highest_salary
FROM employee e1
WHERE 4 - 1 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employee e2
    WHERE e2.salary > e1.salary
);



----------------------------------------------------------------------------------------------------------------------------------------------------------------



---create table employee(empid int,name int,supervisor varchar(18),salary varchar(10));---

INSERT INTO EMPLOYEE 
VALUES
(33,'JEGAN','EMP33','45000'),
(21,'SAN','EMP21','70000'),
(22,'SAM','EMP22','95000'),
(23,'JONE','EMP23','85000'),
(24,'RAM','EMP24','98000');

create table bonus(id int,bonus int);

INSERT INTO BONUS 
VALUES
(25,40000),
(21,5000),
(33,8000),
(24,6000),
(22,700),
(23,500);

SELECT * FROM EMPLOYEE E
JOIN BONUS B ON E.EMPID=B.ID
WHERE BONUS<1000;


----------------------------------------------------------------------------------------------------------------------------------------------------------------



---Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.---

CREATE TABLE CUSTOMER (ID INT, NAME VARCHAR(20),REFEREEID INT);	
	
INSERT INTO CUSTOMER 
VALUES
(1, 'SHIVA', 2),
(2, 'RUDHRA', 1),
(3, 'LINGA', 2),
(4, 'MADHAV', 1),
(5, 'KRISH', 3),
(6, 'VISHNU', 3);

SELECT C.name
FROM CUSTOMER C
LEFT JOIN CUSTOMER R ON C.refereeid = r.Id
WHERE r.Id IS NULL OR r.Id <> 2;


------------------------------------------------------------------------------------------------------------------------------------------------------------


---Each row of this table contains the lengths of three line segments.Write an SQL query to report for every three line
segments whether they can form a triangle.---

CREATE TABLE TRIANGLE (X INT,Y INT,Z INT);

INSERT INTO TRIANGLE VALUES (1, 1, 10),(3, 4, 5),(6, 6, 6),(2, 4, 2);

SELECT t1.x,t1.y,t1.z,
      case
      WHEN T2.X IS NOT NULL AND T3.X IS NOT NULL THEN 'YES'
	  ELSE 'NO'
      END AS FORMS_TRIANGLE
FROM TRIANGLE T1
LEFT JOIN TRIANGLE T2 ON T1.x + T1.y > T2.z AND T1.x + T2.z > T1.y AND T1.y + T2.z > T1.x
LEFT JOIN TRIANGLE T3 ON T1.x + T1.z > T3.y AND T1.x + T3.y > T1.z AND T1.z + T3.y > T1.x;

---Find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.---
					
CREATE TABLE ActorDirector (actor_id int ,director_id int,timestamp int primary key);

INSERT INTO ActorDirector
VALUES
    (1, 101, 1001), 
    (2, 101, 1002),  
    (3, 102, 1003), 
    (1, 101, 1004),  
    (2, 101, 1005),
    (3, 102, 1006),
    (1, 101, 1007), 
    (2, 101, 1008),
    (3, 102, 1009); 
    		
SELECT AD1.actor_id, AD1.director_id
FROM ActorDirector AD1
JOIN ActorDirector AD2 ON AD1.actor_id = AD2.actor_id AND AD1.director_id = AD2.director_id
WHERE AD1.timestamp = AD2.timestamp
GROUP BY AD1.actor_id, AD1.director_id
HAVING count(AD1.actor_id AND AD2.actor_id) >= 3 AND count(AD1.director_id AND AD2.director_id )>= 3;


------------------------------------------------------------------------------------------------------------------------------------------------------------------


---turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to 
board. There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.
 Write an SQL query to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that
 the first person does not exceed the weight limit.---

CREATE TABLE Queue (id INT PRIMARY KEY,name VARCHAR(40),weight INT,turn INT);					
					
INSERT INTO Queue (id, name, weight, turn)
VALUES
    (1, 'Anu', 300, 1),
    (2, 'Boss', 500, 2),
    (3, 'Cavin', 150, 3),
    (4, 'David', 200, 4),
    (5, 'Elango', 100, 5),
    (6, 'Francis', 300, 6),
    (7, 'Grace', 200, 7),
    (8, 'Helen', 250, 8),
    (9, 'Dharsan', 400, 9);

SELECT Q1.name AS person_name, last_person.last_turn AS last_turn
FROM Queue Q1                    
JOIN (
    SELECT MAX(Q2.turn) AS last_turn
    FROM Queue Q2
    WHERE (SELECT SUM(Q3.weight) FROM Queue Q3 WHERE Q3.turn <= Q2.turn) <= 1000
) AS last_person
ON Q1.turn =last_turn;


---------------------------------------------------------------------------------------------


---Query to get the employee id, employee name and their manager name and manager id---		

CREATE TABLE Employee1 (
    EMP_ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Manager_ID INT
);

INSERT INTO Employee1
VALUES
    (1, 'Mark', 3),
    (2, 'Natasha', 4),
    (3, 'Chris', 2),
    (4, 'Robert', NULL),
    (5, 'Steve', 2);

SELECT 
    e.EMP_ID,
    e.Name AS EmployeeName,
    m.Name AS ManagerName,
    e.Manager_ID AS ManagerID
FROM Employee1 e
LEFT JOIN Employee1 m ON e.Manager_ID = m.EMP_ID;


--------------------------------------------------------------------------------------------------