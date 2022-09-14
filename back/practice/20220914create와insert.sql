use test;
select count(*) from jdbc_big_5;

create table jdbc_big_2 as select * from jdbc_big;
insert into jdbc_big_2 select * from jdbc_big;

create table jdbc_big_3 select * from jdbc_big_2;
insert into jdbc_big_3 select * from jdbc_big_2;

create table jdbc_big_4 as select * from jdbc_big_3;
insert into jdbc_big_4 select * from jdbc_big_3;

create table jdbc_big_5 as select * from jdbc_big_4;
insert into jdbc_big_5 select * from jdbc_big_4;

create table jdbc_big_6 as select * from jdbc_big_5;
insert into jdbc_big_6 select * from jdbc_big_5;


