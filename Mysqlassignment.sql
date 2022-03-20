drop database if exists company_db;
create database company_db;
use company_db;

create table SalesPeople(
Snum int primary key,
Sname varchar(20) unique,
City varchar(20),
Comm float
);

insert into SalesPeople values(1001, "Peel", "London", 0.12);
insert into SalesPeople values(1002, "Serres", "Sanjose", 0.13);
insert into SalesPeople values(1004, "Motika", "London", 0.11);
insert into SalesPeople values(1007, "Rifkin", "Barcelona", 0.15);
insert into SalesPeople values(1003, "Axelrod", "Newyork", 0.10);


create table Customers(
Cnum int primary key,
Cname varchar(20),
City varchar(20) not null,
Snum int,
foreign key(Snum) references SalesPeople(Snum)
);

insert into Customers values(2001, "Hoffman", "London", 1001);
insert into Customers values(2002, "Giovanni", "Rome", 1003);
insert into Customers values(2003, "Liu", "Sanjose", 1002);
insert into Customers values(2004, "Grass", "Berlin", 1002);
insert into Customers values(2006, "Clemens", "London", 1001);
insert into Customers values(2008, "Cisneros", "Sanjose", 1007);
insert into Customers values(2007, "Pereira", "Rome", 1004);


create table Orders(
Onum int primary key,
Amt float,
Odate date,
Cnum int,
Snum int,
foreign key(Cnum) references Customers(Cnum),
foreign key(Snum) references SalesPeople(Snum)
);

insert into Orders values(3001, 18.69, '1990-3-10', 2008, 1007);
insert into Orders values(3003, 767.19, '1990-3-10', 2001, 1001);
insert into Orders values(3002, 1900.10, '1990-3-10', 2007, 1004);
insert into Orders values(3005, 5160.45, '1990-3-10', 2003, 1002);
insert into Orders values(3006, 1098.16, '1990-3-10', 2008, 1007);
insert into Orders values(3009, 1713.23, '1990-4-10', 2002, 1003);
insert into Orders values(3007, 75.75, '2004-4-10', 2004, 1002);
insert into Orders values(3008, 4273.00, '2006-5-10', 2006, 1001);
insert into Orders values(3010, 1309.95, '1990-6-10', 2004, 1002);
insert into Orders values(3011, 9891.88, '1990-6-10', 2006, 1001);


  -- 1
  select count(*) from SalesPeople where Sname like 'a%' or 'A%';
  
  -- 2
  select Sname from SalesPeople where Snum in(select Snum from Orders where Amt>2000);
  -- 3
  select count(*) from SalesPeople where City='Newyork';
  -- 4
  select City,count(*) from SalesPeople group by City having City in('Paris','London');