#SELECT STATEMENT
SELECT 
    first_name, last_name
FROM
    employees;
# Select the information from the “dept_no” column of the “departments” table.
SELECT 
    dept_no
FROM
    departments;    
# Select all data from the “departments” table.
SELECT 
    *
FROM
    departments;   
    
#WHERE CALUSE
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
# AND OPERATOR
#Retrieve a list with all female employees whose first name is Kellie
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';    
#OR OPERATOR
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
#Operator Precedence        
#Retrieve a list with all female employees whose first name is either Kellie or Aruna. 
SELECT 
    *
FROM
    employees
WHERE
    (gender = 'F')
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
#IN - NOT IN OPERATOR
#Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');        
#Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');    
#LIKE - NOT LIKE 
#Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; 
#specify that the name can be succeeded by any sequence of characters.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
#Retrieve a list with all employees who have been hired in the year 2000.
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');    
#Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');    
#WILDCARD CHARACTERS
#Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');    
#Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');   
#BETWEEN - AND 
#Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
#Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;    
#Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';    
#IS NOT NULL - IS NULL
#Select the names of all departments whose department number value is not null.
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;    
#OTHER COMPARISION OPERATORS
#Retrieve a list with data about all female employees who were hired in the year 2000 or after.    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND (gender = 'F');
#Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;        
    
# SELECT DISTINCT    
#Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT
    hire_date
FROM
    employees; 
#AGGREGATE 
#How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;
#How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
SELECT COUNT(*)
FROM
    dept_manager; 
#ORDER BY
#Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;    
#Aliases (AS)
#Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
#The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
#Lastly, sort the output by the first column.
SELECT 
    salary, COUNT(emp_no) AS “emps_with_same_salary”
FROM
    SALARIES
WHERE
    salary > 80000
GROUP BY (SALARY)
ORDER BY salary;
#HAVING CLAUSE
#Select all employees whose average salary is higher than $120,000 per annum.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;
#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > 2000
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;
#LIMIT
#Select the first 100 rows from the ‘dept_emp’ table. 
SELECT 
    *
FROM
    dept_emp
LIMIT 100;
#INSERT STATEMENT
INSERT INTO employees

VALUES

(

    999903,

    '1977-09-14',

    'Johnathan',

    'Creek',

    'M',

    '1999-01-01'

);
INSERT INTO employees

VALUES

(

    999901,

    '1986-04-21',

    'John',

    'Smith',

    'M',

    '2011-01-01'

);
#Select ten records from the “titles” table to get a better idea about its content.
SELECT 
    *
FROM
    titles
LIMIT 10;   
#Then, in the same table, insert information about employee number 999903. 
#State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997. 
INSERT INTO titles
(
emp_no,
title,
from_date
)
VALUES
(
999903,
"Senior_Engineer",
"1997-01-10"
);
SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10  ;
#Insert information about the individual with employee number 999903 into the “dept_emp” table. 
#He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.
INSERT INTO dept_emp 
(
emp_no,
dept_no,
from_date,
to_date
)
VALUES
(
999903,
5,
"1997-01-10",
"9999-01-01");
SELECT

    *

FROM

    dept_emp

ORDER BY emp_no DESC

LIMIT 10;
#CREATE TABLE
#COPYING DATA FROM ONE TABLE ANOTHER
CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(255) NOT NULL
) SELECT * FROM
    departments;
#Create a new department called “Business Analysis”. Register it under number ‘d010’.
INSERT INTO departments
(
dept_no,
dept_name
)
VALUES
(
"d010",
"Business Analysis");  
SELECT *
FROM departments;
#UPDATE STATEMENT
UPDATE employees
SET 
first_name =" Stella",
last_name = " Parkinson",
birth_date = " 1990-12-31",
gender= "F"
WHERE 
emp_no = 999901;
SELECT *
FROM employees
WHERE 
emp_no = 999901;
#Change the “Business Analysis” department name to “Data Analysis”.
UPDATE departments 
SET 
    dept_name = 'Data_Analysis'
WHERE
    dept_no = 'd010';  
SELECT 
    *
FROM
    departments;
#DELETE STATEMENT
USE employees;
COMMIT;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;    
DELETE 
FROM 
	employees 
WHERE
    emp_no = 999903; 
ROLLBACK; 
#Remove the department number 10 record from the “departments” table.
DELETE FROM departments

WHERE

    dept_no = 'd010';  
#AGGREGRATE FUNCTION IN DETAILS
#How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    departments;
#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
#Which is the lowest employee number in the database?
SELECT 
    MIN(emp_no)
FROM
    employees;    
# Which is the highest employee number in the database?
SELECT 
    MAX(emp_no)
FROM
    employees; 
#What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
#Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.    
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
#----------------------------------------------------------    
#COALESCE and IFNULL
SELECT 
    *
FROM
    departments_dup;   
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;    
INSERT INTO departments_dup (dept_no) VALUES( "d010") ,("d011");   
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no DESC;
ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no DESC;
COMMIT;
SELECT 
    dept_no,
    IFNULL(dept_name,
            ' Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    dept_no, dept_name, COALESCE(dept_manager, dept_name, "N/A")as dept_manager
FROM
    departments_dup;
#Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number 
#(‘dept_no’) as ‘dept_info’.If ‘dept_no’ does not have a value, use ‘dept_name’.   
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no,dept_name) AS 'dept_info'
FROM
    departments_dup;

#Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function to the values 
#from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, 
#and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.    
SELECT 
   IFNULL(dept_no,"N/A") as dept_no,
   IFNULL(dept_name,'Department name not provided') AS dept_name,
   COALESCE(dept_no, dept_name) AS dept_info
    FROM
    departments_dup;
#JOINS
#use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
ALTER TABLE departments_dup
DROP dept_manager;
# use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.
ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4)NULL,
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );
INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 
#-----------------------------------------------------------------------------------------------
#JOINS
SELECT 
    *
FROM
    dept_manager_dup;

SELECT 
    *
FROM
    departments_dup;   
#INNER JOIN 
#Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    dept_manager m
        JOIN
    employees e ON m.emp_no = e.emp_no;
#DUPLICATE RECORDS
INSERT INTO dept_manager_dup
VALUES
(
"110228","d003","1992-03-21","9999-01-01"
);
INSERT INTO departments_dup
VALUES
(
"d009","Customer_Service");
SELECT* FROM departments_dup
ORDER BY dept_no;    
SELECT* FROM dept_manager_dup
ORDER BY dept_no;

SELECT m.dept_no, m.emp_no,d.dept_name
FROM departments_dup d 
JOIN 
dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY dept_no;
#LEFT JOIN   
DELETE FROM dept_manager_dup
WHERE emp_no= "110228";
DELETE FROM departments_dup
WHERE dept_no="d009";

INSERT INTO dept_manager_dup
VALUES
(
"110228","d003","1992-03-21","9999-01-01"
);
INSERT INTO departments_dup
VALUES
(
"d009","Customer_Service");
#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
#See if the output contains a manager with that name.  
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    last_name = 'Markovitch'
ORDER BY d.dept_no DESC,emp_no; 

#Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
#Use the old type of join syntax to obtain the result.
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e,
    dept_manager d
WHERE
    e.emp_no = d.emp_no;
#setting the global environment
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');    
#---------------------------------------------------------------------------------------
#JOIN AND WHERE CLAUSE TOGETHER
#Select the first and last name, the hire date, and the job title of all employees whose 
#first name is “Margareta” and have the last name “Markovitch”.
SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        LEFT JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = "Margareta" AND last_name = 'Markovitch'

ORDER BY e.emp_no;
#-----------------------------------------------------------------------------------
#CROSS JOIN
#Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
SELECT m.*,d.*
FROM dept_manager m
CROSS JOIN 
departments d
WHERE d.dept_no = "d009";
#Return a list with the first 10 employees with all the departments they can be assigned to.
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_no;
#-----------------------------------------------------------------------------------------
#JOIN MORE THAN TWO TABLES
#Select all managers’ first and last name, hire date, job title, start date, and department name.
SELECT e.first_name,e.last_name,e.hire_date,t.title,t.from_date,d.dept_name
FROM dept_manager dm
LEFT JOIN 
		departments d  ON d.dept_no = dm.dept_no
JOIN         
		employees e ON e.emp_no = dm.emp_no
JOIN 
	titles t ON e.emp_no = t.emp_no
WHERE t.title = "Manager"    
ORDER BY dm.emp_no;    
#How many male and how many female managers do we have in the ‘employees’ database?
SELECT 
    e.gender, COUNT(e.gender) AS count
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
GROUP BY gender;
#------------------------------------------------------------------------------------
#UNION AND UNION ALL
DROP TABLE IF EXISTS employee_dup;
CREATE TABLE employees_dup 
(
emp_no INT(11),
birth_date DATE,
first_name VARCHAR (14),
last_name VARCHAR(14),
gender enum ("M","F"),
hire_date date
);
INSERT INTO employees_dup
SELECT e.*
FROM employees e 
LIMIT 20;
# CREATING DUPLICATE ROWS
INSERT INTO employees_dup  VALUES
(
"10001","1953-09-02","Georgi","Facello","M","1986-06-26"
);

SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no DESC;
#-----------------------------------------------------------------------------
#SUBQURIES
SELECT e.first_name,e.last_name 
FROM employees e 
WHERE 
e.emp_no IN (SELECT d.emp_no
FROM dept_manager d);

#Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
SELECT 
    dm.*
FROM
    dept_manager dm
WHERE
    dm.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            e.hire_date>'1990-01-01' AND  e.hire_date<'1995-01-01');
#Select the entire information for all employees whose job title is “Assistant Engineer”. 
SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            e.emp_no = t.emp_no
                AND t.title = 'Assistant Engineer');
#---------------------------------------------------------------------------------------------
#SELECT AND FROM SUBQURIES
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS Emp_ID,
            MIN(d.dept_no) AS Dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS Manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS Emp_ID,
            MIN(d.dept_no) AS Dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS Manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;  
#-----------------------------------------------------------------------------    
# CREATING TABLES FOR SELF JOINS    
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager
(
emp_no INT (11) NOT NULL,
dept_no CHAR(4) NULL,
manager_no INT (11) NOT NULL);
INSERT INTO emp_manager SELECT u.*
FROM (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
SELECT *FROM emp_manager;
#----------------------------------------------------------------
#SELF JOINS
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e1.emp_no = e2.manager_no
GROUP BY e1.emp_no;
#-----------------------------------------------
#VIEWS
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
#Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

CREATE OR REPLACE VIEW v_average_salary_manager AS 
SELECT ROUND(AVG(s.salary))
FROM salaries s
JOIN 
titles t ON t.emp_no=s.emp_no
WHERE t.title = "MANAGER";
#-----------------------------------------------------------
#STORED ROUTINES
USE employees;
DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
		SELECT* FROM employees
        LIMIT 1000;
END$$
DELIMITER ;  
# INVOKING THE PROCEDURE CREATED
CALL employees.select_employees();

#Create a procedure that will provide the average salary of all employees. Then, call the procedure.
USE employees;
DROP PROCEDURE IF EXISTS average_salary;
DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
	SELECT avg(salary) 
    FROM salaries;
END $$
DELIMITER ;    
#CALLING THE PROCEDURE
CALL employees.average_salary();
#PROCEDURE WITH PARAMETER
DROP PROCEDURE IF EXISTS emp_name;
DELIMITER $$
CREATE PROCEDURE emp_name(IN p_emp_no INTEGER)
BEGIN
	SELECT e.first_name,e.last_name,s.salary,s.from_date,s.to_date
    FROM employees e
    JOIN salaries s ON e.emp_no= s.emp_no
    WHERE e.emp_no= p_emp_no;
    
END$$
DELIMITER ;

#IN and OUT Parameter
DROP PROCEDURE IF EXISTS avg_emp_salary_out;
DELIMITER $$
CREATE PROCEDURE avg_emp_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
	SELECT AVG(s.salary)
    INTO p_avg_salary     #always use into when there was out
    FROM employees e
    JOIN 
    salaries s ON e.emp_no=s.emp_no
    WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;   

#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
DROP PROCEDURE IF EXISTS emp_info;
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name VARCHAR(255),in p_last_name VARCHAR(255), out p_emp_no INTEGER)
BEGIN
SELECT e.emp_no
INTO p_emp_no FROM employees e
WHERE e.first_name=p_first_name and e.last_name=p_last_name ;
END $$
DELIMITER ;
#VARIABLE CREATION
SET @v_avg_salary=0;
CALL employees.avg_emp_salary_out(11300,@v_avg_salary);
SELECT @v_avg_salary;
#Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.
#Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
#Finally, select the obtained output.
SET @v_emp_no=0;
CALL employees.emp_info("Aruna","Journel",@v_emp_no);
SELECT @v_emp_no;
#------------------------------------------------------------------------------------------------
#USER DEFINED FUNCTION
DROP FUNCTION f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER)RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT 
	AVG(salary)
INTO v_avg_salary FROM 
		employees e
        JOIN 
salaries s ON e.emp_no= s.emp_no
WHERE 
	e.emp_no= p_emp_no;
RETURN v_avg_salary;
END $$
DELIMITER ;
#HOW USE THE FUNCTION
#WE CANNOT CALL A FUNCTION. WE CAN ONLY SELECT IT.
SELECT f_emp_avg_salary(11300);
#Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
#and returns the salary from the newest contract of that employee.
DROP FUNCTION f_emp_info;
DELIMITER $$
CREATE FUNCTION f_emp_info(p_firstname VARCHAR(255),p_lastname VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_max_from_date date;
DECLARE v_salary DECIMAL(10,2);
SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_firstname
        AND e.last_name = p_lastname;
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_firstname
        AND e.last_name = p_lastname
        AND s.from_date = v_max_from_date;
RETURN v_salary;
END$$
DELIMITER ;
#Calling the function
SELECT f_emp_info('Aruna', 'Journel') as emp_info;
#-------------------------
#INDEXES
SELECT hire_date FROM employees
WHERE hire_date >"2000-01-01";
CREATE INDEX i_hire_date
ON employees(hire_date);
#DROPPING THE INDEX
ALTER TABLE employees
DROP INDEX i_hire_date;

#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
#Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
SELECT * FROM salaries 
WHERE salary> 89000;

CREATE INDEX i_salary
ON salaries(salary);
#---------------------------------------------------------------------------------------------
#CASE STATEMENT
SELECT emp_no,first_name,last_name,
CASE gender
WHEN "M" THEN "MALE"
ELSE "FEMALE"
END AS "Gender"
FROM employees;
#Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all 
#employees with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, 
#according to the data provided in the dept_manager table, or a regular employee.
SELECT e.emp_no,e.first_name,e.last_name, 
CASE 
WHEN dm.emp_no IS NOT NULL THEN "Manager"
else "Regular Employee"
END AS "Employee Type"
FROM employees e
JOIN 
dept_manager dm ON e.emp_no= dm.emp_no
WHERE 
e.emp_no>109990;
#-----------------------------------------------------------------------





















































