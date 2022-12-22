create database Exercise1;
use Exercise1;
create table lms_member
(
MEMBER_ID varchar(5) primary key ,
MEMBER_NAME varchar(20) not null ,
CITY varchar(10),
DATE_REGISTER date,
DATE_EXPIRE	date not null,
MEMBERSHIP_STATUS varchar(10),
constraint che_DATE_REGISTER check(DATE_REGISTER >'2022-11-16'),
constraint uni_MEMBER_NAME unique(MEMBER_NAME)
);

	

alter table lms_member drop primary key;
alter table lms_member modify MEMBER_ID varchar(5);
alter table lms_member modify MEMBER_NAME varchar(20);
alter table lms_member drop constraint uni_MEMBER_NAME;
alter table lms_member modify DATE_EXPIRE date;
alter table lms_member drop constraint che_DATE_REGISTER;

	

alter table lms_member add constraint primary key(MEMBER_ID);
alter table lms_member modify MEMBER_NAME varchar(20) not null;
alter table lms_member add constraint uni_MEMBER_NAME unique(MEMBER_NAME);
alter table lms_member modify DATE_EXPIRE date not null;
alter table lms_member add constraint che_DATE_REGISTER check(DATE_REGISTER >'2022-11-16');

	
		
		
insert into lms_member values('LM01','Nikita','Delhi','2023-11-16','2023-12-02','Permanent');
insert into lms_member values(null,'Rohit','Mumbai',current_date(),'2022-12-02','Temporary');
insert into lms_member values('LM02','Rakesh','Pune',current_date(),'2024-12-02','Temporary');
insert into lms_member values('LM03','Deepa','USA','2023-11-17','2023-12-02','Permanent');
insert into lms_member values('LM04','Supriya','Ireland','2023-11-18','2023-12-02','Temporary');
insert into lms_member values('LM05','Silky','Delhi','2023-11-20',null,'Permanent');