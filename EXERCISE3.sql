create database Exercise3;
use Exercise3;
create table employee
(
EMP_NO	int,
BRANCH_NO	varchar(5),
EMP_NAME	varchar(25),
DEPARTMENT	varchar(15),
MANAGER	int,
SALARY	int

);
insert into employee values(101,'B01','DHANANJAY MOHOKAR','HR',null,90000);
insert into employee values(102,'B01','HARSHAL KSHIRSAGAR','IT',101,60000);
insert into employee values(103,'B01','RAHUL GARG','Finance',101,50000);
insert into employee values(104,'B02','SUDHANSH HARKUT','IT',105,70000);
insert into employee values(105,'B02','KUNAL BOBADE','HR',null,90000);
insert into employee values(106,'B02','KSHITIJ SONOWANE','Sales',105,40000);
insert into employee values(107,'B03','AMOL MALI','IT',109,50000);
insert into employee values(108,'B03','AMIT TARO','Finance',109,60000);
insert into employee values(109,'B03','PRATHAMESH WADEKAR','HR',null,90000);
insert into employee values(110,'B03','RUPESH PAWAR','Sales',109,45000);
/*	Show all the records of table employee.*/
select*from employee;
/*SHOW NUMBER OF EMPLOYEES*/
select count(EMP_NO) from employee;
/*Count the manager from table employee.*/
select count(distinct Manager ) as "Number of MANAGERS" from employee ;
/*MAXIMUM SALARY */ 
select max(salary) from employee;
/*MINIMUM SALARY*/
select min(salary) from employee;
/*AVERAGE SALARY*/
select avg(salary) from employee;
/******MINIMUM SALARIES IN ALL BRANCHES******/
/*MINIMUM SALARY IN BRANCH B01*/
select min(salary)from employee where BRANCH_NO='B01';
/*MINIMUM SALARY IN BRANCH B02*/
select min(salary)from employee where BRANCH_NO='B02';
/*MINIMUM SALARY IN BRANCH B03*/
select min(salary)from employee where BRANCH_NO='B03';
/******MAXIMUM SALARIES IN ALL BRANCHES******/
/*MAXIMUM SALARY IN BRANCH B01*/
select max(salary)from employee where BRANCH_NO='B01';
/*MAXIMUM SALARY IN BRANCH B02*/
select max(salary)from employee where BRANCH_NO='B02';
/*MAXIMUM SALARY IN BRANCH B03*/
select max(salary)from employee where BRANCH_NO='B03';
/*****TOTAL SALARY IN A BRANCH******/
/*TOTAL SALARY IN B01*/
select SUM(salary)from employee where BRANCH_NO='B01';
/*TOTAL SALARY IN B02*/
select SUM(salary)from employee where BRANCH_NO='B02';
/*TOTAL SALARY IN B03*/
select SUM(salary)from employee where BRANCH_NO='B03';
/*DEPARTMENTS HAVING AVERAGE SALARY MORE THAN 20000*/
select DEPARTMENT from employee group by DEPARTMENT having avg(SALARY)>20000;
/*DEPARTMENTS HAVIN MORE THAN 2 EMPLOYEES*/
select DEPARTMENT from employee group by DEPARTMENT having count(DEPARTMENT)>2;
/*TOTAL NUMBERS OF EMPLOYEES IN EACH BRANCH*/
select DEPARTMENT, count(DEPARTMENT) as "Number of Employees" from employee group by DEPARTMENT having count(DEPARTMENT);
/*name of employee whose NAME starts with ‘S’ letter working in DEPARMENT BRANCH.*/
select* from employee where EMP_NAME Like 'S%';
/*name of employees whose average salary is greater than average salary.*/
select EMP_NAME from employee group by DEPARTMENT  having  avg(SALARY)>(select avg(SALARY) from employee);
/*is working in TESTING DEPARTMENT and working under MANAGER ‘101’ and fetching SALARY greater than 20000.*/
SELECT * from employee where DEPARTMENT ='IT' and MANAGER=101 and SALARY >20000;
/*number of employee who are working in BRANCH B2 and having SALARY> 20000.*/
SELECT count(EMP_NO) from employee where BRANCH_NO='B02' and SALARY>20000;
/**/
select DEPARTMENT, count(DEPARTMENT) as "Number of Employees" from employee where  DEPARTMENT='IT' group by DEPARTMENT having count(EMP_NO)>1;

