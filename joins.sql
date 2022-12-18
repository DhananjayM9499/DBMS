create database LABExercise22;
use LABExercise22;

create table sailors (
sid int primary key,
sname varchar(20),
raiting int,
age int
);

create table boats (
bid int primary key,
bname varchar(20),
color varchar(10)
);


create table reserves (
sid int,
bid int,
day date,
constraint fk1 foreign key(sid) references sailors(sid),
constraint fk2 foreign key(bid) references boats(bid)
);
insert into sailors values(1,'sam',9,46),(2,'Pooja',6,34),(3,'pinki',6,25);
insert into boats values (101,'Cruise','black'),(104,'Skyjet','brown'),(103,'Houseboat','Yellow');
insert into reserves values(1,101,curdate()),(2,104,'2022/05/06'),(3,103,'2021/11/21');

select SName from sailors inner join reserves on reserves.sid = sailors.sid where reserves.bid=104;
create or replace view display_info1 as select sid, reserve_date from sailors innerjoin reserves on sailors.sid=reserves.sid;
