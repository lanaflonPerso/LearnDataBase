
select employee_id, first_name, job_id, department_id from employees where department_id = 90;


INSERT INTO employees VALUES (300, 'Jesus', 'Rodeiguez', 'jesusrodriguez@email', 5151238181, '07-JUN-19', 'AC_ACCOUNT', 20300, 0.5, 205, 110);
update employees set phone_number = 5151238181 where employee_id = 207;
update employees set first_name = 'Wil_liam' where employee_id = 207;
commit;



select first_name, salary * commission_pct from employees where first_name; 


select * from employees;