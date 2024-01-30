----------------------------------------------SQL Assignment------------------------------------------------


---Create the following Tables and insert the values accordingly and Perform the tasks mentioned below.

---Table 1
CREATE TABLE [EMPLOYEE TABLE](

EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(20)
PRIMARY KEY (EMPLOYEE_ID)
)
insert into [EMPLOYEE TABLE] values
(1,'Anika','Arora',100000, '2020-02-14 9:00','HR'),
(2,'Veena','Verma',80000, '2011-06-15 9:00','Admin'),
(3,'Vishal','Singhal',300000, '2020-02-16 9:00','HR'),
(4,'Sushanth','Singh',500000, '2020-02-17 9:00','Admin'),
(5,'Bhupal','Bhati',500000, '2011-06-18 9:00','Admin'),
(6,'Dheeraj','Diwan',200000, '2011-06-19 9:00','Account'),
(7,'Karan','Kumar',75000, '2020-01-14 9:00','Account'),
(8,'Chandrika','Chauhan',90000, '2011-04-15 9:00','Admin')

SELECT * FROM [EMPLOYEE TABLE]
---Table 2
CREATE TABLE [EMPLOYEE BONUS TABLE]
(
EMPLOYEE_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (EMPLOYEE_REF_ID) 
REFERENCES [EMPLOYEE TABLE](EMPLOYEE_ID))

INSERT INTO [EMPLOYEE BONUS TABLE] VALUES
(1,5000,'2020-02-16 0:00'),
(2,3000,'2011-06-16 0:00'),
(3,4000,'2020-02-16 0:00'),
(1,4500,'2020-02-16 0:00'),
(2,3500,'2011-06-16 0:00')
SELECT * FROM [EMPLOYEE BONUS TABLE]


------Table 3
CREATE TABLE [EMPLOYEE TITLE TABLE]
( EMPLOYEE_REF_ID INT,
EMPLYEE_TITLE VARCHAR(20),
AFFECTIVE_DATE DATETIME,
FOREIGN KEY (EMPLOYEE_REF_ID) 
REFERENCES [EMPLOYEE TABLE](EMPLOYEE_ID))

INSERT INTO [EMPLOYEE TITLE TABLE] VALUES
(1,'Manager','2016-02-20 0:00'),
(2,'Executive','2016-06-11 0:00'),
(8,'Executive','2016-06-11 0:00'),
(5,'Manager','2016-06-11 0:00'),
(4,'Asst. Manager','2016-06-11 0:00'),
(7,'Executive','2016-06-11 0:00'),
(6,'Lead','2016-06-11 0:00'),
(3,'Lead','2016-06-11 0:00')
SELECT * FROM [EMPLOYEE TITLE TABLE]

----Tasks To Be Performed

---1 Display the �FIRST_NAME� from Employee table using the alias name as Employee_name.
 --a space char should separate them.
EXCEPT
SELECT DISTINCT * FROM [EMPLOYEE TABLE]
FROM [DBO].[EMPLOYEE TABLE]
FROM [EMPLOYEE TABLE] AS ET
INNER JOIN [EMPLOYEE TABLE] ET2 ON ET.SALARY = ET2.SALARY AND ET.FIRST_NAME <> ET2.FIRST_NAME

---22 Display the second highest salary from a table.
GROUP BY DEPARTMENT HAVING COUNT(*)<4
GROUP BY DEPARTMENT

---26 Display the name of employees having the highest salary in each department.
WHERE SALARY IN(SELECT MAX(SALARY) AS SALARY FROM [EMPLOYEE TABLE] GROUP BY DEPARTMENT)

---27 Display the names of employees who earn the highest salary.

SELECT department,avg(SALARY) AS [Average Salary]
FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT

COALESCE((SELECT SUM(EBT.BONUS_AMOUNT) AS BONUS
FROM [EMPLOYEE BONUS TABLE] AS EBT
WHERE EBT.EMPLOYEE_REF_ID = ET.EMPLOYEE_ID), 0) [TOTAL_BONUS]
FROM [EMPLOYEE TABLE] AS ET