select *
from attendance_report_jan_2025;

CREATE TABLE att_january_stage LIKE hrm_reports.attendance_report_feb_2025;

insert into att_january_stage
select *
from attendance_report_feb_2025;

select *
from att_january_stage;

delete from att_january_stage
where employee_name like 'Attendance Report%'
	or employee_name like 'Generated At%';
    
    
    
delete from att_january_stage
where name = 'Employee';

select name, length(name)
from att_january_stage;
    
select department, count(*) as employee_count
from att_january_stage
group by department;    
    
select department,
		avg((1 = 1) * ('2' = 'p')) avg_present_at_day1
from att_january_stage
group by department;     



select department, group_concat(name separator ', ') employees
from att_january_stage
group by department;

select name, department, designation,
				row_number() over(partition by department order by name) row_num
from att_january_stage;                 


select name, department, designation,
			count(*) over(partition by department order by name) as department_count
from att_january_stage;            

SELECT 
    department,
    COUNT(*) AS employee_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS department_rank
FROM att_january_stage
GROUP BY department;

select name, department, designation, count(*) over(partition by department) as emp_count
from att_january_stage;

select name, department, designation, emp_count,
dense_rank() over(order by emp_count desc) as department_rank
from(
select name, department, designation, count(*) over(partition by department) as emp_count
from att_january_stage) as sun;

select *
from att_january_stage;








    
