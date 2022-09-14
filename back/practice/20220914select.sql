select count(*) from jdbc_big_6 where col_2 not in ( '노수주', '표민상', '이철수' ); -- 16

select count(*) from jdbc_big_6 where col_2 like '표민상%'; -- 16

select * from jdbc_big_4 where col_2 = '노수주'; -- 2.5