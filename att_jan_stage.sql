select *
from attendance_report_feb_2025;

create table att_february_stage like attendance_report_feb_2025;

insert into att_february_stage
select * from attendance_report_feb_2025;

select *
from att_february_stage;

delete from att_february_stage
where employee like 'Attendance Report%'
		or employee like 'Generated At%';
        
ALTER TABLE att_february_stage RENAME COLUMN employee TO Employee;
ALTER TABLE att_february_stage RENAME COLUMN MyUnknownColumn__1 TO Department;
ALTER TABLE att_february_stage RENAME COLUMN MyUnknownColumn__2 TO Designation;
             
delete from att_february_stage
where Employee = "Employee";

select Department, group_concat(Employee separator ', ') employees
from att_february_stage
group by Department;


select * ,
row_number() over(partition by department order by Employee asc) row_num
from att_february_stage;

select *,
count(*) over(partition by Department) emp_count
from att_february_stage;

select Department, count(*) as employee_count,
rank() over(partition by count(*)) as department_rank
from att_february_stage
group by Department;

select *,
dense_rank() over(order by Employee_count) as department_rank
from 
(select Department,
count(*) over(partition by department) as Employee_count
from att_february_stage) as dep_with_count
group by Department;


SELECT distinct
    Department,
    Employee_count,
    dense_rank() over(order by  Employee_count) as drank,
    sum(TP) as Total_present,
    sum(TA) as Total_absent
FROM (
		select Department,
        COUNT(*) OVER (PARTITION BY Department) AS Employee_count,
		TP,
		TA
        from att_february_stage
	) as sunq
    group by Department;

























