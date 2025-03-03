USE [EXERCISE_ONE]
GO

SELECT [EmpID]
      ,[EmpFname]
      ,[EmpLname]
      ,[Department]
      ,[Project]
      ,[Address]
      ,[DOB]
      ,[Gender]
      ,[Salary]
  FROM [dbo].['Employee Info$']

GO


--Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.

SELECT UPPER(EmpFname)
AS EmpName
FROM [dbo].['Employee Info$']

--Write a query to fetch the number of employees working in the department ‘HR’.

SELECT COUNT(*) 
AS HR_Employees 
FROM [dbo].['Employee Info$']
WHERE Department = 'HR';


--Write a query to get the current date.

SELECT GETDATE();


--Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT SUBSTRING(EmpLname, 1, 4) 
AS ShortLname 
FROM [dbo].['Employee Info$']


--Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

SELECT LEFT (Address, LOCATE( '(',Address)- 1) 
AS PlaceName 
FROM [dbo].['Employee Info$']


--Write a query to create a new table that consists of data and structure copied from the other table.

SELECT *
INTO EmployeeInfo_Copy
FROM [dbo].['Employee Info$']


--Write q query to find all the employees whose salary is between 50000 to 100000.
--ALTER TABLE BY ADDING SALARY COLUMN

ALTER TABLE [dbo].['Employee Info$']
ADD Salary INT

ALTER TABLE [dbo].['Employee Info$']
ALTER COLUMN  [Salary] FLOAT


--UPDATE THE EMPLOYEE INFO WITH SALARY

UPDATE  [dbo].['Employee Info$']
SET  

SELECT *
FROM [dbo].['Employee Info$']

SELECT * 
FROM  [dbo].['Employee Info$']
WHERE Salary BETWEEN 50000 AND 100000;


--Write a query to find the names of employees that begin with ‘S’

SELECT * 
FROM [dbo].['Employee Info$']
WHERE EmpFname LIKE 'S%';


--Write a query to fetch top N records.

SELECT * 
FROM [dbo].['Employee Info$'] 
TOP [EmpID]


--Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

SELECT CONCAT(EmpFname, ' ', EmpLname) 
AS FullName 
FROM [dbo].['Employee Info$']


--Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1995 and are grouped according to gender

SELECT Gender, COUNT(*) 
FROM [dbo].['Employee Info$']
WHERE DateOfJoining= '02/05/1970' BETWEEN '02/05/1970', '31/12/1995' AND [DateOfJoining]('31/12/1995', '31/12/1995')
GROUP BY Gender;


--Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.

SELECT * 
FROM [dbo].['Employee Info$']
ORDER BY EmpFname DESC, Department ASC;


--Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

SELECT * 
FROM [dbo].['Employee Info$']
WHERE EmpLname LIKE '____A';


--Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT * 
FROM [dbo].['Employee Info$']
WHERE EmpFname NOT IN ('Sanjay', 'Sonia');


--Write a query to fetch details of employees with the address as “DELHI(DEL)”

SELECT * 
FROM [dbo].['Employee Info$']
WHERE Address = 'Delhi(DEL)';


--Write a query to fetch all employees who also hold the managerial position.

SELECT * 
FROM [dbo].['Employee position$']
WHERE [EmpPosition] LIKE '%Manager%';


--Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order

SELECT Department, COUNT(*) 
AS EmployeeCount
FROM [dbo].['Employee Info$']
GROUP BY Department
ORDER BY EmployeeCount ASC;


--Write a query to fecth Male employees in HR department

SELECT * 
FROM [dbo].['Employee Info$']
WHERE Gender = 'M' AND Department = 'HR';


--Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table

SELECT *
FROM [dbo].[EmployeeInfo_Copy]
JOIN  [dbo].['Employee Info$'] AND [dbo].['Employee position$']
WHERE [DateOfJoining] IS NOT NULL;


--Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table

(SELECT Salary FROM EmployeePosition ORDER BY Salary ASC LIMIT 2)
UNION
(SELECT Salary FROM EmployeePosition ORDER BY S
