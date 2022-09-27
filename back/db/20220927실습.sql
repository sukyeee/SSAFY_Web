use test;
select *
	from customer
    where exists ( select customer_id from customer_order );
    
select c.*
	from customer C
    where exists ( select o.customer_id from customer_order o where c.customer_id = o.customer_id);

    select o.customer_id from customer c, customer_order o where c.customer_id = o.customer_id;
    
    select * from customer;
    select * from customer_order;
    
    select customer_nm
    from customer
    where customer_id not in ( select customer_id from customer_order);
    
    select c.customer_nm
    from customer c
    where not exists ( select o.customer_id from customer_order o where c.customer_id = o.customer_id);
    
    
    
CREATE TABLE test.blacklist (
  customer_id INT NULL,
  customer_nm VARCHAR(45) NULL);
  
insert into blacklist values (2, '이길동');
insert into blacklist values (null, '박길동');


select * from test.blacklist;

select * from customer;

select * 
	from customer
	where customer_id not in ( select customer_id from blacklist where customer_id);

-- is not null 조건 붙이면 exists처럼 나옴 
select * 
	from customer
	where customer_id not in ( select customer_id from blacklist where customer_id is not null);



select c.* 
	from customer c 
	where not exists ( select b.customer_id from blacklist b where c.customer_id  = b.customer_id );





