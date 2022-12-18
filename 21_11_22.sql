create database 21Nov2022Part02;
use 21Nov2022Part02;

-----------------------------------------------------------------------------------
-- Usage of date format in MySql (Default format is yyyy-mm-dd
create table Demo_Product
(
Prod_No varchar(20) primary key,
Prod_Name varchar(20),
price int Not Null,
date_of_purchase date unique not null,
date_of_sale datetime unique not null
);

insert into Demo_Product values('P01','Phone battery',2000,'2022-11-17',now());
insert into Demo_Product values('P04','samsung phone',4000,current_date(),now());
select * from Demo_Product;
-- syntax for changing the format 
-- SELECT DATE_FORMAT(column_name, '%m/%d/%Y %H:%i') FROM tablename
SELECT DATE_FORMAT(date_of_purchase, '%m/%d/%Y %H:%i') FROM Demo_Product;
SELECT DATE_FORMAT(date_of_sale, '%m/%d/%Y %H:%i') FROM Demo_Product;
select * from Demo_Product;

select extract(month from date_of_purchase) month_extracted,
extract(day from date_of_purchase) day_extracted,
extract(year from date_of_purchase) year_extracted,
extract(HOUR from date_of_sale) hour_extracted,
extract(MINUTE from date_of_sale) minute_extracted,
extract(SECOND from date_of_sale) second_extracted
 from Demo_Product;

-- To copy the structure of a table in another table
CREATE TABLE new_Demo_Product LIKE Demo_Product;
select * from new_Demo_Product;

-- To copy the structure of a table in another table belonging to other database
CREATE TABLE new_Demo_Product LIKE databasename.Demo_Product;

-- To copy the data and structure of a table in another table
CREATE TABLE new_data_Demo_Product select* from  Demo_Product;
select * from new_data_Demo_Product;

-- To print the current date and today's date and time
select current_date();
select now();

-- How to use auto_increment and what is the purpose?
CREATE TABLE employees (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
INSERT INTO employees(first_name,last_name)
VALUES('John','Doe'),
      ('Mary','Jane'),
      ('Deepa','Gupat');
  select * from employees;   
INSERT INTO employees(first_name,last_name)VALUES('Nikita','Sharma');
INSERT INTO employees(emp_no,first_name,last_name)VALUES(10,'Nikita','Sharma');
INSERT INTO employees(first_name,last_name)VALUES('Rakesh','Antil');  
INSERT INTO employees(emp_no,first_name,last_name)VALUES(10,'Nikita','Sharma');
INSERT INTO employees(emp_no,first_name,last_name)VALUES(9,'Nikita','Sharma');
INSERT INTO employees(first_name,last_name)VALUES('Nikita','Sharma');
DELETE FROM employees WHERE emp_no = 10;
INSERT INTO employees(emp_no,first_name,last_name)VALUES(10,'Jack','Lee');
insert into employees values(0,'shilpa','taneja');
select * from employees;
/* Because the storage engine of the employees table is InnoDB, 
it does not reuse the deleted sequence number. The new row has emp_no  3.*/

/* useful points
Type integer
Default Value 1
Minimum Value 1
Maximum Value 65535
 Setting the value of either of these two variables to 0 causes its value to be set to 1 instead
 . Attempting to set the value of either of these two variables to an 
 integer greater than 65,535 or less than 0 causes its value to be set to 65,535 */


CREATE TABLE employees1 (
	emp_no3 INT unique AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
insert into employees1 values(null,'shilpa','taneja');
insert into employees1 values(5,'shilpa','taneja');
insert into employees1(first_name,last_name) values('deepa','gupta');
insert into employees1 values(0,'shilpa','taneja');
insert into employees1(first_name,last_name) values('deepa','gupta');
insert into employees1 values(null,'shilpa','taneja');

select * from employees1;
ALTER TABLE employees1 AUTO_INCREMENT = 100;
insert into employees1 values(0,'deepa','gupta');
select * from employees1;


 SET @@auto_increment_offset=5; -- 9+5=14
 CREATE TABLE autoinc2
    (col INT NOT NULL AUTO_INCREMENT PRIMARY KEY); -- null is always ignored and value automatically will be +1 of last value if offset=1(by default)
    INSERT INTO autoinc2 VALUES ();
    SELECT col FROM autoinc2;
    SHOW VARIABLES LIKE 'auto_inc%';
CREATE TABLE employees2 (
	first_name VARCHAR(50)  AUTO_INCREMENT);

-- auto_increment feature can be used only once in a table
CREATE TABLE employees3 (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
 	emp_no3 INT unique AUTO_INCREMENT
);

-- auto_increment feature can be used with float/double/demial but it will treat the values as of integer type
CREATE TABLE employees4 (
 	emp_no3 float unique AUTO_INCREMENT
);
INSERT INTO employees4 VALUES(1);
INSERT INTO employees4 VALUES(2.0);
INSERT INTO employees4 VALUES();
select * from employees4;


create table Demo_Subquery
 ( empno int,
 fname varchar(10),
 lname varchar(10),
 salary int,
 departments varchar(20)
 );