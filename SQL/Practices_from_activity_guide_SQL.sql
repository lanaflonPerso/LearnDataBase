--=====================================================================================================
--============================================================================== Practices for Lesson 1
--=====================================================================================================



--=====================================================================================================
--============================================================================== Practices for Lesson 2
--=====================================================================================================

-- 4.
describe departments;
select * from departments;

-- 5.
describe employees;
select * from employees;
-- 5.b
select employee_id, last_name, job_id, hire_date "STARTDATE" 
from employees;

-- 6.
select distinct job_id 
from employees;

-- 7.
select employee_id "Emp #", last_name "Employee", 
       job_id "Job", hire_date "Hire Date" 
from employees;

-- 8.
select last_name || ', ' || job_id "Employee and Title"
from employees;

9.
select employee_id || ',' ||
       first_name || ',' ||
       last_name || ',' ||
       email || ',' ||
       phone_number || ',' ||
       hire_date || ',' ||
       job_id || ',' ||
       salary || ',' ||
       commission_pct || ',' ||
       manager_id || ',' ||
       department_id "THE OUTPUT"
from employees;

--=====================================================================================================
--============================================================================== Practices for Lesson 3
--=====================================================================================================

-- 1.
select last_name, salary
from employees
where salary > 12000;

-- 2.
select last_name, department_id 
from employees
where employee_id = 176;

3.
select last_name, salary 
from employees 
where salary < 5000 or salary > 12000;

-- 4.
select last_name, job_id, hire_date
from employees
where last_name like'Matos' or last_name like 'Taylor'
order by hire_date desc;

-- 5. 
select last_name, department_id
from employees
where department_id = 20 or department_id = 50
order by last_name asc;

-- 6.
select last_name "Employee", salary "Monthly Salary"  
from employees 
where (salary between 5000 and 12000)
and (department_id = 20 or department_id = 50);

-- 7.
select last_name, hire_date
from employees
where to_char(hire_date, 'yyyy') = '2006'; 

-- 8.
select last_name, job_id
from employees
where manager_id is null;

-- 9.
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 desc, 3 desc;

-- 10.
select last_name, salary
from employees
where salary > &salary;

-- 11.
select employee_id, last_name, salary, department_id
from employees
where manager_id = &Manager_id
order by &sort_by;

-- 12.
select last_name 
from employees
where last_name like '__a%';

-- 13.
select last_name 
from employees
where last_name like '%a%' and last_name like '%e%';

-- 14.
SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7000);

-- 15.
select last_name "Employee", salary "Monthly Salary", commission_pct 
from employees 
where commission_pct = 0.2;

--=====================================================================================================
--============================================================================== Practices for Lesson 4
--=====================================================================================================

-- 1.
select sysdate "Date" from dual;

-- 2.
select employee_id, 
       last_name, 
       salary, 
       round(salary + ((salary / 100)*15.5)) "New Salary"
from employees;

-- 3.

-- 4.
select employee_id, 
       last_name, 
       salary, 
       round(salary + ((salary / 100)*15.5)) "New Salary",
       round(salary + ((salary / 100)*15.5)) - salary "Increase"
from employees;

-- 5.a
select INITCAP(last_name) "Name", length(last_name) "Length"
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like'M%';

-- 5.b
select INITCAP(last_name) "Name", length(last_name) "Length"
from employees
where last_name like '&START_LETTER%';

-- 5.c
select INITCAP(last_name) "Name", length(last_name) "Length"
from employees
where last_name like upper('&START_LETTER%');

-- 6.
select last_name, round(((sysdate - hire_date) / 30)) MONTHS_WORKED 
from employees
order by round(((sysdate - hire_date) / 30));

-- 7.
select last_name, lpad(salary, 15, '$') SALARY
from employees;

-- 8.
select last_name, rpad(' ', salary / 1000, '*') "EMPLOYEES_AND_THEIR_SALARIES"
from employees
order by salary desc;

-- 9.
select last_name, trunc(((sysdate - hire_date) / 7), 0) "TENURE"
from employees
where department_id = 90
order by TENURE desc;

--=====================================================================================================
--============================================================================== Practices for Lesson 5
--=====================================================================================================





--=====================================================================================================
--============================================================================== Practices for Lesson 6
--=====================================================================================================






--==========================================================================================================================================================
--=================================================================================================================================== Practices for Lesson 7
--==========================================================================================================================================================




--==========================================================================================================================================================
--=================================================================================================================================== Practices for Lesson 8
--==========================================================================================================================================================






--==========================================================================================================================================================
--=================================================================================================================================== Practices for Lesson 9
--==========================================================================================================================================================




--==========================================================================================================================================================
--================================================================================================================================== Practices for Lesson 10
--==========================================================================================================================================================




--==========================================================================================================================================================
--================================================================================================================================== Practices for Lesson 11
--==========================================================================================================================================================