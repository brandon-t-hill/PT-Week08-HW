-- I want to know how many employees with each title were born after 1965-01-01
select
  titles.title,
  count(*) as emp_count
from titles
inner join employees emp on titles.emp_no = emp.emp_no
where emp.birth_date > '1965-01-01'
group by title
order by emp_count desc;
-- I want to know the average salary per title
select 
  titles.title,
  avg( sal.salary) as avg_salary
from titles
inner join salaries sal on titles.emp_no = sal.emp_no
group by title
order by avg_salary desc;
-- How much money was spent on salary for the marketing department between the years 1990 and 1992?
select 
  d.dept_name,
  sum(s.salary) as total_salary
from departments d
inner join dept_emp de on de.dept_no = d.dept_no
inner join salaries s on s.emp_no = de.emp_no
where d.dept_no = 'd001' and
  (s.from_date between '1990-01-01' and '1992-12-31') and
  (s.to_date between '1990-01-01' and '1992-12-31')
group by d.dept_name;
