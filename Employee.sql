create database Employee;
use Employee;
create table employee
(
EmpId int(20),
EmpName varchar(20),
MobileNum int(11),
Salary float(7),
DepartmentName varchar(10)
);

insert into Employee.employee values(2422000,'Danny',7058392641,85000.56,'Developer');
insert into Employee.employee values(2422001,'Rutuja',26545222,65000.56,'Secretary');
insert into Employee.employee values(2422002,'Sudhansh',89754641,255000.56,'Manager');
insert into Employee.employee values(2422003,'Rahul',854945565,555000.56,'Accountant');
insert into Employee.employee values(2422004,'Harshal',46588797,65000.56,'Chaprasi');
delete from employee WHERE Salary = 25001;
alter table employee modify column MobileNum int(11);
insert into Employee.employee values(2422004,'Harshal',4658879722,65000.56,'Chaprasi');
select*from employee;
desc employee;