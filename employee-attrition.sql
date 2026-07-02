CREATE DATABASE hr_analysis;
use hr_analysis;
select * from employee_attrition;

-- 1. total number of employees
select count(*) as total_employees
from employee_attrition;

-- 2. total employees who left the company
select count(*) as employees_left
from employee_attrition
where attrition = 'yes';

-- 3. attrition rate
select
round((count(case when attrition = 'yes' then 1 end) * 100.0) / count(*),2) as attrition_rate
from employee_attrition;

-- 4. employees in each department
select
department,
count(*) as total_employees
from employee_attrition
group by department
order by total_employees desc;

-- 5. attrition by department
select
department,
count(case when attrition = 'yes' then 1 end) as employees_left
from employee_attrition
group by department
order by employees_left desc;

-- 6. attrition by job role
select
job_role,
count(case when attrition = 'yes' then 1 end) as employees_left
from employee_attrition
group by job_role
order by employees_left desc;

-- 7. average monthly income by department
select
department,
round(avg(monthly_income),2) as average_salary
from employee_attrition
group by department
order by average_salary desc;

-- 8. gender distribution
select
gender,
count(*) as total_employees
from employee_attrition
group by gender;

-- 9. overtime analysis
select
overtime,
count(*) as total_employees,
count(case when attrition = 'yes' then 1 end) as employees_left
from employee_attrition
group by overtime;

-- 10. average years at company by department
select
department,
round(avg(years_at_company),2) as average_years
from employee_attrition
group by department
order by average_years desc;

-- 11. average job satisfaction by department
select
department,
round(avg(job_satisfaction),2) as average_satisfaction
from employee_attrition
group by department
order by average_satisfaction desc;

-- 12. performance rating
select
performance_rating,
count(*) as total_employees
from employee_attrition
group by performance_rating
order by performance_rating;

-- 13. top 10 highest paid employees
select
employee_id,
department,
job_role,
monthly_income
from employee_attrition
order by monthly_income desc
limit 10;

-- 14. rank employees by salary within each department
select
employee_id,
department,
job_role,
monthly_income,
rank() over(partition by department order by monthly_income desc) as salary_rank
from employee_attrition;

-- 15.average absenteeism by department
select
department,
round(avg(absenteeism),2) as avg_absenteeism
from employee_attrition
group by department
order by avg_absenteeism desc;

-- 16.average distance from home by attrition
select
attrition,
round(avg(distance_from_home),2) as avg_distance
from employee_attrition
group by attrition;

-- 17. average project count by department
select
department,
round(avg(project_count),2) as avg_projects
from employee_attrition
group by department
order by avg_projects desc;