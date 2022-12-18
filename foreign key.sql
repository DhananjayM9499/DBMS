create database Nov152022;
use Nov152022;
create table PRODUCT
(
Product_No int(10),
Product_name varchar(10),
Product_cost int not null,
primary key(Product_No)
);
insert into Nov152022.PRODUCT values(1,'Sugar',250);
insert into Nov152022.PRODUCT values(2,'Aata',264);

create table Bill
(
Bill_No int(10)primary key,
Product_No int(10) references PRODUCT(Product_No)
);
insert into Bill values(1,1);
insert into Bill values(2,2);
select*from Bill;

create table defaultdemo
(
ID int Not Null,
Name varchar(20) default('Sandwich'),
Age int
);
insert into defaultdemo values(1,'Shilpa',14);
insert into defaultdemo values(1,default,14);
select * from defaultdemo;

