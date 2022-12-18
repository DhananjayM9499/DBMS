create database 25Nov2022Part02;
use 25Nov2022Part02;

-----------------------------------------------------------------------------------
-- Usage of date format in MySql (Default format is yyyy-mm-dd
create table Demo_Product
(
Prod_No varchar(20) primary key,
Prod_Name varchar(20),
price int Not Null,
date_of_purchase date unique not null,
date_of_sale datetime unique not null
);

insert into Demo_Product values('P01','Phone battery',2000,'2022-11-17',now());
insert into Demo_Product values('P04','samsung phone',4000,current_date(),now());
select * from Demo_Product;

delimiter //
create procedure GetAllPRoducts()
begin
select*from Demo_product;
end //
delimiter ;
call GetAllProducts();