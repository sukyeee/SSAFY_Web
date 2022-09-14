select c.customer_id, c.customer_nm
		 ,(select p.product_nm from product p  where p.product_id = co.product_id) product_nm
	from customer_order co, customer c
    where co.customer_id = c.customer_id;
    
select c.customer_id, c.customer_nm
	from customer_order co, customer c
    where co.customer_id = c.customer_id
    and co.product_id in ( select product_id from product  );
    
    select p.product_nm from product p