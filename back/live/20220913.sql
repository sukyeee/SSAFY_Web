create database ssafydb;

use ssafydb;

select sum(salary), sum(salary * commission_pct), avg(salary)
from employees;


select @@sql_mode;
SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES,ONLY_FULL_GROUP_BY'; 

-- 이 아래꺼 복습하기!  
select  e.employee_id, e.first_name, d.department_name, j.job_title,
		date_format(jh.start_date, '%y.%m.%d'), date_format(jh.end_date, '%y.%m.%d')
from employees e join job_history jh
on e.employee_id = jh.employee_id
join departments d
on jh.department_id = d.department_id
join jobs j
on jh.job_id = j.job_id
where e.employee_id = 101

union

select  e.employee_id, e.first_name, d.department_name, j.job_title, 
		(select date_format(date_add(max(end_date), Interval 1 day ), '%y.%m.%d') from job_history where employee_id = 101), null
from employees e join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id
where e.employee_id = 101;


-- 두 번째 조건  
-- 현재 이력 중심  

select date_format(date_add(max(end_date), Interval 1 day ), '%y.%m.%d') from job_history where employee_id = 101;


