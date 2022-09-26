create database housedata;

use housedata;

desc dongcode;

select *  from dongcode
where right(dongCode, 5) = '00000'
and left(dongcode, 2) = '11';