create database Exercise2;
use Exercise2;
create table Product
(
Prod_No	varchar(5)	Primary key check(Prod_No like 'p%'),
Prod_Name	varchar(20)	default  'Charger',
price decimal(6,2)	Not Null,
Date_of_purchase date
);
desc Product;
insert into Product value ('P01',	'Phone battery'	,'2000.40'	,	'2022-11-17');
insert into Product value ('P02',	'Phone charger'	,'200.50'	,	'2022-11-17');
insert into Product value ('P03',	'samsung phone',	'20000'	,	'2022-11-17');
insert into Product value ('P06',	'samsung phone'	,'20000'	,	'2022-11-17');
insert into Product value ('P05',	'samsung charger', '20000'	,	'2022-11-17');
insert into Product value ('P04',	'samsung phone'	,'50000'		,'2022-11-17');
select*from Product;
alter table Product modify column price decimal(10,2)	Not Null;
select * from Product order by Prod_Name;
select * from Product order by  Prod_Name Desc ;
select * from Product order by price;
select * from Product order by price Desc ;
select * from Product order by price and Prod_No ;
select * from Product where Prod_Name like 'p%';
select * from Product where Prod_Name like 'S%e';
select * from Product where Prod_Name = 'samsung';
update Product set price=40000 where Prod_No ='P04';
select*from Product;
