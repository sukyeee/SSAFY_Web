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
    
    
 