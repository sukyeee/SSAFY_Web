use world;

select name, concat(left(name, 2), lpad('*', char_length(name)-4, '*'), right(name, 2))
from country;

select distinct(replace(region, ' ', '_')) region from country order by length(Region) desc;

select name, surfacearea, population, round(surfacearea/population, 3) '1인당 점유면적'
from country
where population >= 100000000
order by surfacearea/population;

select curdate() "오늘", datediff( curdate(), '2022-01-01' ) "올해 지난날", date_add( curdate(), interval 100 day ) "100일 후";

-- insert data 할 경우, 관리 컬럼 ( 입력일시, 입력자ID, 변경일시, 변경자ID )

-- if - else => case when end
select name, continent, LifeExpectancy,
		case when LifeExpectancy > 80 then '장수국가'
			 when LifeExpectancy > 60 then '일반국가'
             else '단명국가'
		end '구분'
from country
where LifeExpectancy is not null
and continent = 'asia'
order by LifeExpectancy;


select name, gnp, gnpold, ifnull(gnp-gnpold, '신규') 'gnp 향상'
 from country
 order by name;
 
 -- 0 월 1 화 ....4 금 5 토 6 일
 select weekday('2023-05-05'), if( weekday('2023-05-05') > 4, '불행', '행복' );
 
 -- 알아두기 !! 
 -- count(*) null 상관없이 count   
 -- count( col ) : col 이 null 인 것 제외하고 count
 select count(*), count( IndepYear ) from country;
 
 select count(*) from country where IndepYear is not null;
 
 select sum( LifeExpectancy ), round(avg( LifeExpectancy ), 2), max( LifeExpectancy ), min(LifeExpectancy)
 from country;
 
 select Continent, count(code) '국가 수', sum( population ) '인구 합'
 from country
 group by Continent
 order by count(code) desc;
 
 select continent, sum( SurfaceArea ) '표면적 합'
 from country
 group by Continent
 order by sum( SurfaceArea ) desc
 limit 3;
 
-- 9번은 문제가 잘못된듯! ( 이미지 ) 
 select continent, sum(gnp)
 from country
 where Population >= 50000000
 group by continent
 order by sum(gnp) desc;
 
-- 10번 
select continent, sum(gnp)
from country
where Population >= 50000000
group by continent
having sum(gnp) >= 5000000;

select a.continent, a.sum_gnp
from
( select continent, sum(gnp) sum_gnp
from country
where Population >= 50000000
group by continent ) a
where a.sum_gnp >= 5000000;

 
-- 11번
 select indepyear, count(IndepYear)
 from country
 group by IndepYear
 having count(IndepYear) >= 10;
 
-- 12번 
 -- window, mysql over()    over() : 전체,   over(partition by 나눌칼럼)  
 select continent, name, gnp,
	avg(gnp) over(), avg(gnp) over(partition by Continent)
	from country;
 
 
 
 
 
 
 
 
 -- 8-3 
 
 
-- 8-3 1번 
 -- 표준 SQL
 select co.code, co.Name
	from country co join city ci on co.code = ci.countrycode
    where ci.name = 'kabul';
 -- select count(*) from city;  더 많은 개수를 출력함.
   -- 위는 아래와 같음 
 
 select co.code, co.Name
	from country co, city ci
	where co.code = ci.CountryCode
    and ci.Name = 'kabul';
    
    
    
-- 2번
 
-- countrylanguage 의 countrycode language 복합키
select co.name, cl.Language, cl.Percentage
	from country co join countrylanguage cl on co.code = cl.countrycode
    where cl.IsOfficial = 'T' and Percentage = 100
    order by co.name;
    -- 위는 아래와 같음 
 
    select co.name, cl.Language, cl.Percentage
	from country co, countrylanguage cl 
    where co.code = cl.countrycode and
	cl.IsOfficial = 'T' and Percentage = 100
    order by co.name;
    
    
select ci.name, cl.Language, co.Name
	from city ci join countrylanguage cl using ( countrycode )
				 join country co on ci.countrycode = co.code
	where ci.name = 'amsterdam' 
    and cl.isofficial  = 'T';
    
-- 위는 아래와 같음 
 
select ci.name, cl.Language, co.Name
	from city ci, countrylanguage cl, country co
	where  ci.CountryCode = cl.CountryCode
    and ci.CountryCode = co.Code
	and ci.name = 'amsterdam' 
    and cl.isofficial  = 'T';
    
-- 29220914
 
-- 4번 
select co.name, ci.id,  ci.name "수도", ci.population "수도인구"
	from country co join city ci
    on co.capital = ci.id
    where co.name like 'united%';


-- united로 시작하는 모든 나라의 모든 도시 정보.... 
-- country 1개당 도시가 여러개기 때문에 여러개 나옴. 
select co.name, ci.id,  ci.name "수도", ci.population "수도인구"
	from country co join city ci
    on co.code = ci.countryCode
    where co.name like 'united%';
	-- and ci.capital_yn = 'Y'
 
-- 5번 
 select co.name, ci.id,  ifnull(ci.name , '수도없음') '수도' , ifnull(ci.population, '수도없음')  '수도인구'
	from country co left outer join city ci -- outer은 빼도 됨 
    on co.capital = ci.id -- 오른쪽이 null 이어도 나온다.
    where co.name like 'united%';
 
 -- 6번
select count(*)
	from countrylanguage
    where isofficial = 'T' and
    percentage > (  select max(percentage)
					from countrylanguage where countrycode='che' and isofficial='T'
				  );

 -- 위의 subquery에 이렇게 써도 됨  
 select max(cl.percentage)
	from country co join countrylanguage cl
    on co.code = cl.countrycode
	where co.code = 'che';


 select count( distinct(countrycode) ) '국가수'
	from countrylanguage
    where isofficial = 'T' and
    percentage > (  select max(percentage)
					from countrylanguage where countrycode='che' and isofficial='T'
				  );


-- 6 join
 select count( distinct(countrycode) ) '국가수'
	from countrylanguage, 
    ( select max(percentage) max
		from countrylanguage 
        where countrycode='che' 
        and isofficial='T' ) m
    where isofficial = 'T' 
    and percentage > m.max;
    
    
    
-- 7 subquery 
select language
	from  countrylanguage
    where isofficial = 'T'
    and countrycode = 
    ( select code 
		from country 
		where name = 'south korea'
	);

-- 7 - subquery & inline view
select language
	from countrylanguage,   ( select code 
		from country 
		where name = 'south korea'
	) sk
    where countrycode = sk.code
		and isofficial = 'T';


-- 7 join
select cl.language
	from country co join countrylanguage cl
    on co.code = cl.countrycode
    where co.name = 'south korea' and cl.isofficial = 'T';

-- 7 no subquery - just join
select cl.language
	from countrylanguage cl, country c
    where cl.countrycode = c.code
		and cl.isofficial='T'
        and c.name = 'south korea';
        



-- 8 내가 푼것 
select ci.name, ci.countrycode, count(ci.countrycode)
from city ci, ( 
	select *
	from country
    where name like 'bo%'
    ) bo
    where bo.code = ci.CountryCode
    group by ci.countrycode;
    
-- 8 join 내가 푼것 
select ci.name, ci.countrycode, count(ci.countrycode)
from city ci join country co
on ci.countrycode = co.code
 and co.name like 'bo%'
group by ci.countrycode;



-- 8 - subquery - ansi sql ( 표준 sql )
-- select countrycode, count(countrycode) from city group by countrycode;
-- select countrycode "code" , count(countrycode) cnt from city group by "code";  -- group by 상수로 이해, 1개만 출력 
set profiling = 1;
select c.name, c.code, t.cnt
	from country c join (
    	select countrycode 'code', count(countrycode) cnt from city group by countrycode
    ) t
	using( code )
    where c.name like 'bo%';
show profile;

-- 8 - subquery - non ansi sql
set profiling = 1;
select c.name, c.code, t.cnt
	from country c join (
    	select countrycode 'code', count(countrycode) cnt from city group by countrycode
    ) t
	where c.code = t.code
    and c.name like 'bo%';
show profile;

-- 8 - normal join
set profiling = 1;
select c.name, c.code, count(ci.id)
	from country c, city ci
    where c.code = ci.countrycode
    and c.name like 'bo%'
    group by c.code;  -- c.name도 가능 
show profile;


-- 9 subquery ansi sql
select c.name, c.code, ifnull(t.cnt, '단독')
	from country c left join (
    	select countrycode 'code', count(countrycode) cnt from city group by countrycode
    ) t
	using( code )
    where c.name like 'bo%';

-- 9 normal join
select c.name, c.code, case when ci.id is null then '단독' else count(ci.id) end '도시개수' 
	from country c left join city ci
    on c.code = ci.countrycode
    where c.name like 'bo%'
    group by c.code;  


-- 10 subquery
select countryCode, name, population
	from city
    where population = (
    select max(population) from city -- 가장 많은 인구 수를 계산하는 query와 그것을 가진 도시의 정보를 출력하는 것은 별개
    );
    -- 가장 많은 인구 수를 가진 city가 여러개 일 수도 있다는 전제 

-- 가장 많은 인구수를 가진 city가 1개라는 전제가 있다면 
select countryCode, name, population
	from city
    order by population desc
    limit 1;


-- 11번 : 내가 푼 것
select co.name, ci.countrycode, ci.name, ci.population
	from city ci, country co
    where ci.population = (select min(population)
	from city
 )
 and ci.countrycode = co.code;
    

-- 11 subquery
select co.name, co.code, t.name, t.population
	from country co, (select countrycode, name, population
						from city
						where population = ( select min(population) from city ) ) t
	where co.code = t.countrycode;
 


-- 12 KOR의 seoul보다 인구가 많은 도시들 출력
-- 12 내가 푼 것
select countrycode, name, population
	from city
where population > 
(select population
	from city
where countrycode='KOR'
and name = 'seoul');
   

-- 12 subquery
-- select population from city where countrycode='KOR' and name='seoul';
select countrycode, name, population
	from city
where population > 
(select population
	from city
where countrycode='KOR'
and name = 'seoul');
   
-- 12 join
select ci1.countrycode, ci1.name, ci1.population -- 결국 ci1의 결과를 출력
	from city ci1  join city ci2
where ci2.countrycode = 'KOR' and ci2.name = 'seoul'  
and ci1.population > ci2.population; -- 결국 ci2는 조건을 형성하는데 사용

select ci2.countrycode, ci2.name, ci2.population -- 
	from city ci1  join city ci2
where ci1.countrycode = 'KOR' and ci1.name = 'seoul'  
and ci2.population > ci1.population; --


-- 13 내가 쓴 답
select cl.countrycode, cl.language
	from city ci join countrylanguage cl
    on ci.countrycode = cl.CountryCode
    and ci.name = 'San Miguel'
    and cl.isofficial = 'T';

-- 13 내가 쓴 답
select countrycode, language
	from countrylanguage
    where countrycode = any ( 
		select countrycode
        from city
        where name = 'San Miguel'
    )
    and isofficial = 'T';


-- 13 subquery
select countrycode, language
	from countrylanguage
	where countrycode in ( 
		select countrycode
        from city
        where name = 'San Miguel'
    )
     and isofficial = 'T';

-- 13 normal join
select cl.countrycode, cl.language
	from city ci, countrylanguage cl
    where ci.countrycode = cl.CountryCode
    and ci.name = 'San Miguel'
    and cl.isofficial = 'T';
    
    
-- 14 국가 코드와 해당 국가의 최대 인구수를 출력. 국가 코드로 정렬
select countrycode, max(population)
	from city
    group by countrycode
	order by countrycode;
    
    
-- 15 이렇게 하면 안되나 ?
select countrycode, name, max(population)
from city
group by countrycode
order by countrycode;

-- 15   왜 오류 ?
select CountryCode, name, Population
from city
where (CountryCode, Population) in ( select CountryCode, name, max(Population)
									from city
									group by CountryCode )
order by CountryCode;
    
    
-- 15 - join subquery - inline view
select ci.CountryCode, ci.name, ci.Population
from city ci,  ( select CountryCode, name, max(Population) mp
									from city
									group by CountryCode ) mc
where ci.CountryCode = mc.CountryCode
and ci.Population = mc.mp
order by CountryCode;
    
    
    
-- 16 - 국가 이름과 함께 국가 별로 가장 인구가 많은 도시의 정보 출력
select co.Code, co.name, t.name, t.population
	from country co left join ( 
								select ci.CountryCode, ci.name, ci.Population
								from city ci,  ( select CountryCode, name, max(Population) mp
												 from city
												 group by CountryCode ) mc
								where ci.CountryCode = mc.CountryCode
								and ci.Population = mc.mp
								order by CountryCode
							  ) t
	on co.code = t.CountryCode;
    
    
-- 17. read only wrapper view
	create or replace view summary 
    as
    select co.Code, co.name "co_name", t.name "ci_name", t.population
	from country co left join ( 
								select ci.CountryCode, ci.name, ci.Population
								from city ci,  ( select CountryCode, name, max(Population) mp
												 from city
												 group by CountryCode ) mc
								where ci.CountryCode = mc.CountryCode
								and ci.Population = mc.mp
								order by CountryCode
							  ) t
	on co.code = t.CountryCode;
    
    -- select * from world.summary; 로 위의 view뷰 조회 가능 
    
    -- 18
    select * from world.summary where code='KOR';
    
    
    
    
    
    
    

    
    