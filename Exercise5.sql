create database Company;
use Company;
create table Employee
(
EmpNo int,	
FName	varchar(20),
LName	varchar(20),
Salary	int,
Department varchar(20)
);
desc Employee;
insert into Employee values (1,	'Shilpa',	'Taneja',	70000	,'IT');
insert into Employee values (2,	'Deepa',	'Gupta',	200000,	'IT');
insert into Employee values (3,	'Nikita', 	'Sharma',	20000,	'Teaching');
insert into Employee values (4,'Rakesh',	'Antil'	,150000,	'HR');
insert into Employee values (5,	'Praveen',	'Khatri',	78000,	'HR');
insert into Employee values (6,	'Bhvnesh',	'Arora'	,120000,	'Accounts');
select*from Employee;
/*Write a query for displaying Name(First name and Last Name), their salary and  their department of those employees who gets salary more than the employee with ID 6.*/
select concat(FName,'',LName)as FullName,Salary,Department from Employee where Salary>(select Salary from Employee where EmpNo=6);
/*Write a query for displaying Name(First name and Last Name) of those employees who gets salary is not greater than the employee with ID 6.*/
select CONCAT(Fname,' ',Lname) as Fullname,salary ,department  from employee where salary < (select salary from employee where employee.Empno=6);
/*Write a query for displaying Name(First name and Last Name) of those employees who gets salary is more than the employee working in ‘HR’.*/
select CONCAT(FName,' ',LName) as FullName  from Employee where Salary > all(select Salary from Employee where Employee.Department='HR');
/*Write a query for displaying Name(First name and Last Name) of those employees who works in the same department as the employee with ID 4.*/
select CONCAT(FName,' ',LName) as FullName  from Employee where Department = all(select Department from Employee where Employee.EmpNo=4);
/*Write a query for displaying Name(First name and Last Name), salary, Department Name  of those employees who earns such amount which is smallest salary of any of department.*/
select CONCAT(FName,' ',LName) as FullName,Salary,Department  from Employee where Salary = any(select min(Salary) from Employee group by Department); 
/*Write a query for displaying Name(First name and Last Name), salary, Department Name  of those employees who earns such amount which is greatest salary of any of department.*/
select CONCAT(FName,' ',LName) as FullName,Salary,Department  from Employee where Salary = any(select max(Salary) from Employee group by Department); 
/*Write a query for displaying Name(First name and Last Name), salary for all the employees who earn more than average salary.*/
select CONCAT(FName,' ',LName) as FullName,Salary  from Employee where Salary > all(select avg(Salary) from Employee); 