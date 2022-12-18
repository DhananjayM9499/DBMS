create database Vote;
use Vote;
create table VoteCasting
(
Id int not null,
Name varchar(20),
Age int,
check (Age>=18)

);
insert into Vote.VoteCasting values(2455,'Dhananjay',17);
select*from VoteCasting;