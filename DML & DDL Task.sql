1. How to insert multiple records in a table in sql ?

CREATE TABLE CUSTOMER(CUST_ID TINYINT, CUST_NAME VARCHAR(30),AGE TINYINT, MAIL_ID VARCHAR(100), PHONE_N0 BIGINT,ADDRESS VARCHAR(50), CUST_DATE DATE, IN_TIME TIMESTAMP, OUT_TIME TIMESTAMP, SOCIAL_MEDIA VARCHAR(50), PRIMARY KEY(CUST_ID));
INSERT INTO CUSTOMER VALUES(17, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 09:00:00', '2023-06-15 10:30:00', 'twitter'),
    (18, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 11:30:00', '2023-06-15 13:00:00', 'facebook'),
    (19, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 14:30:00', '2023-06-15 16:00:00', 'instagram'),
    (20, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 17:00:00', '2023-06-15 18:30:00', 'linkedin'),
    (21, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 19:00:00', '2023-06-15 20:30:00', 'youtube');
==============================================================================================================================================================================================================

2. How to add additional column in a table?		
show tables;
select * from  CUSTOMER
Alter table <tablename> add column <columnname> <datatype>
Alter table CUSTOMER add column Device char(100)
INSERT INTO CUSTOMER VALUES(17, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 09:00:00', '2023-06-15 10:30:00','mobile','twitter'),
=============================================================================================================================================================================================================

3. how to change the constraint in a table?		
drop table if exists CUSTOMER
CREATE TABLE CUSTOMER
(
  CUST_ID INT ,
  Cust_name VARCHAR(100),
  Cust_address varchar(100),
  City CHAR(50),
  State CHAR(50), 
  Email_ID VARCHAR(100),
  Date date,
  In_time TIMESTAMP,
  Out_time TIMESTAMP,
  Device char(100),
  Channel VARCHAR(50),
  constraint  check_date_quarter CHECK (Date >= '2023-01-01' AND Date <= '2023-06-30'),
  constraint check_time_variation CHECK (TIMESTAMPDIFF(HOUR, In_time, Out_time) BETWEEN 1 AND 2)
);
INSERT INTO CUSTOMER VALUES(17, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 09:00:00', '2023-06-15 10:30:00','mobile', 'twitter'),
    (18, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 11:30:00', '2023-06-15 13:00:00','mobile', 'facebook'),
    (19, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 14:30:00', '2023-06-15 16:00:00','laptop', 'instagram'),
    (20, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 17:00:00', '2023-06-15 18:30:00','laptop', 'linkedin'),
    (21, 'Manish', 28, 'Manish@gmail.com', '9876543210', '123 Street, City', '2023-06-15', '2023-06-15 19:00:00', '2023-06-15 20:30:00','mobile', 'youtube');

  a)--to drop
  Alter table CUSTOMER
  drop constraint  check_date_quarter CHECK (Date >= '2023-01-01' AND Date <= '2023-06-30'),
  b) --add new constarint
  Alter table CUSTOMER
   add constraint check_time_variation CHECK (TIMESTAMPDIFF(HOUR, In_time, Out_time) BETWEEN 1 AND 2)


 ================================================================================================================================================================================================================
  
  4. How to alter the column name in a table?		
 Alter table CUSTOMER rename column CUST_ID to CLIENT_ID
 select * from CUSTOMER
 
 ================================================================================================================================================================================================================

 5. How to change the table name in sql?

 Alter table CUSTOMER rename to CUSTOMER_TABLE

=================================================================================================================================================================================================================
 
 6. How to change a particular value inside a table		
 
 Update CUSTOMER set PHONE_N0 = '9994098941' where CUST_ID = 41;
 Update CUSTOMER set PHONE_N0 = '9994098941' where CUST_NAME = 'Manish';

=================================================================================================================================================================================================================  
 