create database 21nov;
use 21nov;

create table first
(
ID int,
name varchar(20)

);
drop table first;
insert into first(ID,name) values(1,'sandeep');
insert into first(ID,name) values(2,'ayushi');
insert into first(ID,name) values(4,'mike');
select * from first;

create table second
(
ID int,
name varchar(20)

);
insert into second values(1,'sandeep');
insert into second values(3,'dev');
insert into second values(4,'franky');
select * from second;
select * from first UNION select * from second;
select ID from first UNION select ID from second;


/*column name same but lets create it with different data types and it works */

create table demo1
(
ID int
);

insert into demo1(ID) values('1');
insert into demo1(ID) values('2');

create table demo2
(
ID varchar (2)
);

insert into demo1(ID) values('1');
insert into demo1(ID) values('3');

select ID from demo1 UNION select ID from demo2;





create table demo3
(
ID int

);

insert into demo3(ID) values(1);
insert into demo3(ID) values(2);


create table demo4
(
ID varchar(20),
name varchar(20)
);

insert into demo3(ID) values('1');
insert into demo3(ID) values('3');
insert into demo4(ID,name) values('1','sandeep');
insert into demo4(ID,name) values('3','ayushi');

select * from demo3 union select * from demo4;
select ID from demo3 union select ID from demo4;

select * from first;
select * from second;

select * from first intersect select * from second;

select * from first minus select * from second;