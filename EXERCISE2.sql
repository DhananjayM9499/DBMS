create database Exercise1;
use Exercise1;
create table Lms_members
(
MEMBER_ID	varchar(6)primary key,
MEMBER_NAME 	varchar(30)	unique not null,
CITY 		varchar(20)	,
DATE_REGISTER 	date
check (DATE_REGISTER >= '2022-11-16'),
DATE_EXPIRE	date not null,
MEMBERSHIP_STATUS varchar(20)
);
desc lms_members;


