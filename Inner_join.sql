create database labExercise_21_part2;
use labExercise_21_part2;
create table Sailors
(
 sid integer primary key,
 Sname varchar(40),
 rating integer,
 age real
);
desc Sailors;
insert into Sailors values(101,'Danny',10,56.6);
insert into Sailors values(102,'Rutuja',8,16.6);
insert into Sailors values(103,'Sudhansh',7,46.6);
insert into Sailors values(104,'Harshal',9,26.6);
insert into Sailors values(105,'Amol',9,36.6);
insert into Sailors values(106,'Amit',9,36.6);
insert into Sailors values(107,'Rushi',9,36.6);
select * from Sailors;

create table Boats
(
 bid integer primary key,
 Bname varchar(40),
 color varchar(40)
);
desc Boats;
insert into Boats values(501,'boat01','blue');
insert into Boats values(502,'boat02','Red');
insert into Boats values(503,'boat03','Green');
insert into Boats values(504,'boat04','white');
insert into Boats values(505,'boat05','grey');
select * from Boats;


create table Reserves
(
  sid integer,
  bid integer,
  day date,
 constraint fk_sid  foreign Key(sid) references Sailors(sid),
  constraint fk_bid  foreign Key(bid) references Boats(bid)
);
desc Reserves;
insert into Reserves values(101,501,'2022-01-12');
insert into Reserves values(102,502,'2022-04-10');
insert into Reserves values(103,503,'2022-08-07');
insert into Reserves values(104,504,'2022-08-30');
insert into Reserves values(105,505,'2022-11-23');

select * from Reserves;


select sname from Sailors where rating >8;

/*Find the names of sailors who have reserved boat number 504.*/

select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where Reserves.bid=504;

/*Find the names of sailors who have reserved a Red boat.*/

select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where Reserves.bid=(select bid from Boats where color='Red');

/* Find the color of boats reserved by ‘Danny’.*/

select color from Boats Boats inner join Reserves on Reserves.bid=Boats.bid where Reserves.sid=(select sid from Sailors where Sname ='Danny');

/*Find the names of sailors who have reserved atleast one boat.*/

Select Sname from Sailors Sailors inner join Reserves on Reserves.sid = Sailors.sid where Reserves.bid= any(select bid from Boats where bid>=1 );

/*Find the names of sailors whose names begins and ends with ‘S’ and has atleast three characters.*/

select Sname from Sailors where Sname like '%s___%s';


/*Find the names of sailors who have reserved a ‘white’ or ‘red’ boat.*/

select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where Reserves.bid= any(select bid from Boats where color='Red' or color='white');

/*Find the names of sailors who have reserved a ‘blue’ but not a ‘red’ boat.*/

select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where Reserves.bid= any(select bid from Boats where color='blue' or color!='red');

/*Find the names of sailors who have reserved a ‘blue’ and a ‘red’ boat.*/

select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where Reserves.bid= any(select bid from Boats where color='blue' or color='red');

/*Find the sids of sailors who have a rating of 10 or have reserved boat number 501.*/
select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where  rating > 10 or Reserves.bid= any(select bid from Boats where bid=501);

/*Find the names of sailors who have not reserved a blue boat.*/

select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where Reserves.bid= any(select bid from Boats where color!='blue');

/*Find the names and sids of sailors whose rating is better than some sailor called akhil.*/

select Sname , sid from Sailors where rating > (Select rating from Sailors where Sname ='Rutuja');

/* Find the sailors with highest rating.*/


select Sname , rating from Sailors where rating = (select max(rating) from Sailors);

/*Find the names and sids of sailors who have reserved all boats.*/

select Sname from Sailors Sailors inner join Reserves on Reserves.sid= Sailors.sid where Reserves.bid= any(select bid from Boats );

/*Find the average age of all the sailors.*/

select avg(age ) from Sailors;

/*Find the average age of sailors with a rating of 10.*/


select avg(age) from Sailors where rating > 10;

/*Find the name and age of the oldest sailor.*/
Select Sname , age from Sailors where age = (select max(age) from Sailors);

/*Count the number of sailors.*/
select count(sid) from Sailors;

/*Count the number of different sailor names.*/
select count(Sname) from Sailors;

/*Find the names of sailors who are older than the oldest sailor with a rating of 10.*/
Select Sname , age from Sailors where age <(select max(age) from Sailors where rating >10);

/*20 Find the age of youngest sailor for each rating level.*/

select age , rating from Sailors group by rating having min(rating);

/*Find the age of youngest sailor who is eligible to vote for each rating level with at least two such sailors*/

select age , rating from Sailors group by rating having min(rating) = any(select rating from Sailors where age >18);

/*Find the average age of sailors for each rating level that has at least two sailors.*/


select avg(age) , rating from Sailors group by rating having min(rating) = any(select rating from Sailors);

/*Find those ratings for which the average age of sailors is the minimum of overall ratings.*/	
 
Select Sailors.rating From Sailors Group by Sailors.rating Having Avg(Sailors.age) <= ALL(Select Avg(Sailors.age) From Sailors  Group by Sailors.rating);

create or replace view display_Sailor as select Sname, day from sailors inner join reserves on sailors.sid=reserves.sid;

                                    


