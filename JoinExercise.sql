create database Exercise4;
use Exercise4;
create table PERSON 
(
Driver_Id varchar(20)primary key,
Driver_name varchar(20),
Address varchar(20)
); 
desc PERSON;

 create table CAR 
 (
 Reg_No varchar(20)primary key,
 Model varchar(20),
 YearOP int
 );
 DESC CAR;
create table ACCIDENT 
(
report_number int primary key,
DateOA date,
location varchar(20)
);
DESC ACCIDENT;
create table OWNS 
(
Driver_Id varchar(20),
Reg_no varchar(20),
primary key(Driver_Id,Reg_No),
foreign key(Driver_Id)
references PERSON(Driver_Id),
foreign key(Reg_No)
references CAR(Reg_No)
);
DESC OWNS;
CREATE TABLE PARTICIPATED 
(Driver_Id varchar(20) ,
Reg_No varchar(20),
 report_Number int,
 Damage_Amount int
 );
 DESC PARTICIPATED;
 insert into PERSON values('101','Dhananjay','Pune');
 insert into PERSON values('102','Sudhansh','Amravati');
 insert into PERSON values('103','Harshal','Pachora');
 insert into PERSON values('104','Amit','Sambhajinagar');
 insert into PERSON values('105','Amol','Chalisgao');
 select*from PERSON;
 
insert into CAR values('MH12VB1999','TATA',2012);
insert into CAR values('MH27SH2000','HYUNDAI',2015);
insert into CAR values('MH19HS3110','SUZUKI',2019);
insert into CAR values('MH20AT2001','MAHINDRA',2014);
insert into CAR values('MH44Am2020','HONDA',2011);
select *from CAR;

insert into ACCIDENT values(5001,'2008-11-15','MUMBAI');
insert into ACCIDENT values(5002,'2005-01-25','AKOLA');
insert into ACCIDENT values(5003,'2002-03-08','SHEGAO');
insert into ACCIDENT values(5004,'2010-06-12','CHALISGAO');
insert into ACCIDENT values(5005,'2009-05-29','BEED');
select * from ACCIDENT;

insert into OWNS values(101,'MH12VB1999');
insert into OWNS values(102,'MH27SH2000');
insert into OWNS values(103,'MH19HS3110');
insert into OWNS values(104,'MH20AT2001');
insert into OWNS values(105,'MH44AM2020');
select * from OWNS;


insert into PARTICIPATED values(101,'MH12VB1999',5002,20000);
insert into PARTICIPATED values(102,'MH27SH2000',5006,25000);
insert into PARTICIPATED values(103,'MH19HS3110',5001,35000);
insert into PARTICIPATED values(101,'MH20AT2001',5004,15000);
insert into PARTICIPATED values(104,'MH44AM2020',5005,60000);
insert into PARTICIPATED values(102,'MH21DT2025',5003,39000);
select * from PARTICIPATED;
/*•	Find the total number of people who owned cars that were involved in accidents in 2008-2010.*/
select count(Driver_Id) from PARTICIPATED inner join accident on participated.report_Number=accident.report_number where accident.DateOA between '2008-01-01' and '2010-12-31';
/**/
select count(report_Number),model from participated inner join CAR on participated.Reg_No=CAR.Reg_No
where CAR.Model = 'Mahindra';



/**************************************************************************************************************************************************************************/

create table customer
(
CustID int primary key,
Cname varchar(40) not null,
City varchar(30) not null
);

create table order1
(
OrderID int primary key,
OrderDate date not null,
CustID int,
OrderAmount int not null,
foreign key(CustID) references customer(CustID)
);

create table item
(
ItemNumber int primary key,
UnitPrice int not null
);

create table warehouse
(
WarehouseNo int not null,
City varchar(30) not null
);

create table orderItem
(
OrderID int,
ItemNumber int,
quantity int,
foreign key(OrderID) references order1(OrderID),
foreign key(ItemNumber) references item(ItemNumber)
);

create table shipment
(
OrderID int,
WarehouseNo int,
shipDate date not null,
foreign key(OrderID) references order1(OrderID)
);
create table order_item1
(
OrdersId int ,
foreign key(OrdersId)
references
order1(OrderId) on delete cascade  ,
ItemNumber int ,
foreign key(ItemNumber)
references
orderItem(ItemNumber) on delete set null,
item_quntity int
);


insert into customer values(1,'Person1','City1');
insert into customer values(2,'Person2','City2');

insert into order1 values(1,'2022-05-09',1,80000);
insert into order1 values(2,'2022-05-02',2,40000);

insert into item values(1,80000);
insert into item values(2,40000);

insert into warehouse values (100,'City3');
insert into warehouse values (101,'City4');

insert into orderItem values (1,1,10);
insert into orderItem values (2,2,20);

insert into shipment values (1,100,'2022-06-09');
insert into shipment values (1,100,'2022-06-09');

select Cname, count(OrderID) as NO_OF_ORDERS, avg(OrderAmount) as AVG_ORDER_AMT from customer inner join order1
on customer.custID=order1.custID group by Cname;

select orderID, city from shipment inner join warehouse on shipment.warehouseNo=warehouse.warehouseNo
where warehouse.City='City3' group by orderID;
create procedure GetOrder



/*********************************************************************************************************/
/****************************Third one*********************************/




