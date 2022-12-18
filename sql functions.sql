use employee;
select * from Employee;
select EmpName from Employee;
select upper(EmpName) from Employee;
select lower(EmpName) from Employee;
select length('dhananjay');
select length(EmpName) from Employee;
select * from Employee where length(EmpName)>5;
select trim('     welcome    ' );
select trim('z' from 'zzoraclezz');
select instr('WELCOMR','O');
/*                      STARTING POSITION 1 ENDING POSITION 3*/
SELECT substr('WELCOME',1,3);/*RETURNS VALUE FROM FIRST TO THIRD CHARACTER FROM FIRST*/
SELECT substring('WELCOME',1,5);/*RETURNS VALUE FROM FIRST TO FIFTH CHAR STARTING FROM FIRST*/
SELECT substr('WELCOME',3,5);
SELECT substr(EmpName,1,3) from Employee;
select concat(EmpName, "->" ,EmpId )fullinfo from Employee;
select abs(40);/*removes negative value*/
select sqrt(100);/*gives square root of the given number*/
select mod(10,3); /*gives remainder of the data*/ 

select truncate(40.1234,3);/*gives 3 values after a decimal*/
select truncate(6879,-1);/*converts number of digits to zero*/
select truncate(6879,-2);
select truncate(6879,-3);
select greatest(100,200,222,333,555);
select least(100,200,222,333,555);
select current_date();
select curdate();
select current_time();
select curtime();

select sysdate(); /*gives system date*/

