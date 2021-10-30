create database calc_db
use calc_db
create table res (
id int primary key identity,
operand1 double precision,
operation varchar(50),
operand2 double precision,
result double precision)

select * from res