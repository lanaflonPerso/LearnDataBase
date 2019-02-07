-- Este archivo contiene varias querys y comentarios sobre ellas mismas. 
-- Es probable que estos querys puede servir para alguien para repasar algunas 
-- cosas de SQLOracle. 
-- ATENCION estos querys y comentarios sobre querys pueden ser erróneas, es solo 
-- mis notas durante los estudios.
-- A este archivo se va agregar mas querys, durante los estudios.
-- Un saludo a todos. 
-- Espero que os sirve para algo.
-- TRL

--==========================================================================================================================================================
--====================================================================================================================================== General informarion
--==========================================================================================================================================================
--The Oracle server evaluates the clauses in the following order:
--      1. If the statement contains a WHERE clause, the server establishes the 
--         candidate rows.
--      2. The server identifies the groups that are specified in the 
--         GROUP BY clause.
--      3. The HAVING clause further restricts result groups that do not meet 
--         the group criteria in the HAVING clause.

--==========================================================================================================================================================
--==================================================================================================================================================== Alias
--==========================================================================================================================================================

-- alias = NAME 
select last_name as Name 
from employees;     

-- se permite poner un alias si usar palabra clave 'as'. Palabra clave 'as' no 
-- es obligatoria.
select last_name name 
from employees;

-- Si hace falta guardar registro de letras en alias, alias tiene que estar 
-- dentro de comillas dobles.
-- alias = Name
select last_name "Name" 
from employees;    

-- Si alias contiene espacio o varios espacios es obligatorio poner alias entre 
-- comillas dobles
select last_name "Name Employee" 
from employees;

-- Dentro de alias no se permite poner comillas simples
select last_name "Alias que lleva co'milla simple" 
from employees;                                                                 -- Error

--==========================================================================================================================================================
--============================================================================================================================================ Concatenation
--==========================================================================================================================================================
-- String || String
select first_name || last_name "Employee"  
from employees;

-- String || Literal || String
select first_name || ' ' || last_name "Employee" 
from employees;

select 123, first_name || ' ' || last_name "Employee" 
from employees;

select 123 || first_name || ' ' || last_name "Employee" 
from employees;

-- String || Number
select first_name || ' ' || salary "Employee and Salary" 
from employees;

-- String || Date(fecha)
select first_name || ' ' || hire_date "Employee and Start Date" 
from employees;

-- String || double or Null
-- Este output es interesante.
select first_name || ' ' || commission_pct "Employee and Commission", 
       commission_pct 
from employees;

--==========================================================================================================================================================
--========================================================================================================================== Operaciones aritmetics: + - * / 
--==========================================================================================================================================================
select last_name, salary, 12 * salary + 100 
from employees;

select last_name, salary, 12 * (salary + 100) 
from employees;

select last_name, salary, - salary + 100 
from employees;

-- Error division bu zero
select 5 / 0 from dual;                                                         -- Error  

select 0 / 8 from dual;

--==========================================================================================================================================================
--==================================================================================================================================================== WHERE
--==========================================================================================================================================================
select last_name, department_id 
from employees 
where last_name = 'King';

select last_name, department_id 
from employees 
where last_name = 'king';

select last_name, department_id 
from employees 
where last_name = 'KING';

select last_name, hire_date 
from employees 
where hire_date = '17-JUN-03';

select last_name, hire_date 
from employees 
where hire_date = '17-jun-03';

--==========================================================================================================================================================
--=============================================================================================================================================== Conditions
--==========================================================================================================================================================
--   <
--   >
--   <=
--   >=
--   =
--   <>
--   !=
--   ^=

--   <
select last_name, salary 
from employees 
where salary <  6000;

--   >
select last_name, salary 
from employees 
where salary >  6000;

--  <=
select last_name, salary 
from employees 
where salary <=  6000;

--  >=
select last_name, salary 
from employees 
where salary >=  6000;

--  <>
select last_name, salary 
from employees 
where salary <>  17000;

--  !=
select last_name, salary 
from employees 
where salary !=  17000;

--  ^=
select last_name, salary 
from employees 
where salary ^=  17000;

select last_name, hire_date 
from employees 
where hire_date <= '17-jun-03';

select last_name, hire_date 
from employees 
where hire_date >= '17-jun-03';

select last_name, hire_date 
from employees 
where hire_date > '17-jun-03';

-- ?????????????????
select last_name, department_id 
from employees 
where last_name < 'King';

select last_name, department_id 
from employees 
where last_name > 'King';

select last_name, department_id 
from employees 
where last_name <= 'King';

--==========================================================================================================================================================
--================================================================================================================================================== BETWEEN
--==========================================================================================================================================================
-- Van aparecer todos salary que se encuentren entere 10500 y 17000, incluso los 
-- salary que estan igual al 10500 y 17000 
select last_name, salary 
from employees 
where salary 
between 10500 
and 17000;

-- Asi a esta manera no nos va aparecer ningun resultado
select last_name, salary 
from employees 
where salary
between 17000 and 10500;

select last_name, salary 
from employees 
where salary 
between -10 and 1000000000000000000;

--==========================================================================================================================================================
--======================================================================================================================================================= IN
--==========================================================================================================================================================
select employee_id, last_name, salary, manager_id 
from employees 
where manager_id in(100, 101, 201);

--==========================================================================================================================================================
--===================================================================================================================================================== LIKE 
--==========================================================================================================================================================
select last_name from employees where last_name like 'K%';

select last_name from employees where last_name like '%s';

select last_name from employees where last_name like '______s';

select last_name from employees where last_name like '%ig%';

select last_name from employees where last_name like '_a%';

select last_name from employees where last_name like '%e_';

select last_name from employees where last_name like '_A%';

-- Se permite buscar los numeros tambien
select last_name, salary 
from employees 
where salary like '24%';

select last_name, salary 
from employees 
where salary like '4%';

-- Se permite buscar las fechas tambien
select last_name, hire_date 
from employees 
where hire_date like '17%';

select last_name, hire_date 
from employees
where hire_date like '___JUN%';

select last_name, hire_date 
from employees 
where hire_date like '_______04%';

-- No se permite buscar los canopos Nullos. Los campos nullos se buscan con 
-- palabras claves 'IS NULL' y 'IS NOT NULL'
select last_name, commission_pct 
from employees 
where commission_pst like 'Null';                                               -- Error

select last_name, commission_pct 
from employees 
where commission_pst like 'null';                                               -- Error

-- Interesante cosa, nos sale output casi de todos empleados.
select last_name 
from employees 
where last_name like '%_%';

-- screening экранирование
-- Screening, pero no me funcciona estos exemplos.
select first_name 
from employees 
where first_name like '%/_%'; escape '\';

select first_name 
from employees 
where first_name like '%/%%'; escape '\';

select first_name 
from employees 
where first_name like '%1_%'; escape '1';

--==========================================================================================================================================================
--===================================================================================================================================================== NULL 
--==========================================================================================================================================================
-- Campos rellenos con valor Null
select last_name, job_id, commission_pct from employees;

-- Campo com valor numerico multiplicar por null la resumen es Null
select last_name, salary * commission_pct from employees;

select last_name "Name", salary * nvl(commission_pct, 1) "Salary and Commission" 
from employees;

-- Campo com valor numerico sumar null la resumen es Null
select last_name, salary + commission_pct from employees;

-- Campo com valor numerico restar null la resumen es Null
select last_name, salary - commission_pct from employees;

-- Campo com valor numerico dividir por null la resumen es Null
select last_name, salary / commission_pct from employees;

-- Si campo que lleva valor null multiplicar por algun valor numerico, la resumen 
-- va ser Null. Ejamplo abajo.
select last_name, salary, commission_pct, 12 * salary as "Salary year", 
(12 * salary) * commission_pct as "Salary year and Commission"  from employees;

-- Si campo que lleva valor null concatenar con algun valor String, la resumen va 
-- ser String concatenado con espacio en blanco. Ejamplo abajo.
select last_name || ', ' || commission_pct || ',' from employees;

-- ------------------------------------------------------------------------------------------------------------------ substr() con campos NULL 
select last_name, substr(commission_pct, 1) from employees;
select last_name, substr(commission_pct, 1, 3) from employees;
-- Atencion
select last_name, substr(commission_pct, 5) from employees;

--==========================================================================================================================================================
--================================================================================================================================================== IS NULL 
--==========================================================================================================================================================
select first_name, commission_pct 
from employees 
where commission_pct is null;

-- No funcciona, output esta vacio.
select first_name, commission_pct 
from employees 
where commission_pct = null;    

select first_name, commission_pct 
from employees 
where commission_pct is not null;

--==========================================================================================================================================================
--================================================================================================================================================== Literal 
--==========================================================================================================================================================
select * from employees where hire_date = '17-JUN-03';

-- Da mismo resultado que con 'jun' en maysculas.
select * from employees where hire_date = '17-jun-03';

-- Hay que tener quidado con el formato de fecha que esta puesto por defecto.
select * from employees where hire_date = '17-06-03';

-- Este query no devolve nada, la primera letra de Nobre esta en incorrecto 
-- registro(esta en menyscula, 
-- a tiene que ser en mayscula)
select * from employees where last_name = 'king';

-- Este query si devuelve la respuesta.
select * from employees where last_name = 'King';

-- String || Literal || String
select first_name || ' ' || last_name "Employee" from employees;

-- Literal || String || String
select 123, first_name || ' ' || last_name "Employee" from employees;

-- Literal || String || String
select 123 || first_name || ' ' || last_name "Employee" from employees;

-- Comilla simple
select 'Nombre''Apellido' from dual;

select 'Nombre' 'Apellido' from dual;                                           -- Error

select 'Nombre' || 'Apellido' from dual;                                        -- Not Error

------------------------------------------------------------------------------------------------------------------
--                                                                                    Ekranirovanie s pomowchy q[ ]

--select 'Literal que lleva co'milla simple' from dual;                         -- Error

select q'[Literal que lleva co'milla simple]' from dual;                        -- Not Error

select q'[Li'te'ral que lle'va co'milla sim'ple]' from dual;                    -- Not Error

select q'(Literal que lleva co'milla simple)' from dual;   

select q'!Literal que lleva co'milla simple!' from dual;                        -- Not Error
  
select q'*Literal que lleva co'milla simple*' from dual;                        -- Not Error

select q'-Literal que lleva co'milla simple-' from dual;                        -- Not Error

select q'_Literal que lleva co'milla simple_' from dual;                        -- Not Error

select q'1Literal que lleva co'milla simple1' from dual;                        -- Not Error

--==========================================================================================================================================================
--================================================================================================================================================= DISTINCT 
--==========================================================================================================================================================
select distinct department_id from employees;

select first_name, distinct salary from employees;                              -- Error

select distinct first_name, salary from employees;  

select distinct salary, first_name from employees;

select distinct last_name, first_name from employees;

select count(distinct department_id) from employees;

--==========================================================================================================================================================
--============================================================================================================================================ DESC DESCRIBE 
--==========================================================================================================================================================
desc employees;

describe employees;

--==========================================================================================================================================================
--====================================================================================================================================================== AND 
--==========================================================================================================================================================
select employee_id, last_name, job_id, salary 
from employees 
where salary >= 10000 
and job_id 
like '%MAN%';

--==========================================================================================================================================================
--======================================================================================================================================================= OR 
--==========================================================================================================================================================
select employee_id, last_name, job_id, salary from employees 
where salary >= 10000 
or  job_id like '%MAN%';

--==========================================================================================================================================================
--====================================================================================================================================================== NOT 
--==========================================================================================================================================================
select first_name, commission_pct 
from employees
where commission_pct is not null;

select last_name, job_id 
from employees 
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_REP');

--==========================================================================================================================================================
--=================================================================================================================================== Operational Priorities 
--==========================================================================================================================================================
select last_name, job_id, salary from employees 
where job_id = 'SA_REP' 
or job_id = 'AD_PRES' 
and salary > 15000;

select last_name, job_id, salary from employees 
where (job_id = 'SA_REP' 
       or job_id = 'AD_PRES') 
and salary > 15000;

--==========================================================================================================================================================
--================================================================================================================================================= ORDER BY 
--==========================================================================================================================================================

-- Place the HAVING and GROUP BY clauses after the WHERE clause in a statement. 
-- The order of the GROUP BY and HAVING clauses following the WHERE clause is not 
-- important. You can have either the GROUP BY clause or the HAVING clause first 
-- as long as they follow the WHERE clause. Place the ORDER BY clause at the end.

-- ASC esta puesto por defecto
select last_name, job_id, department_id, hire_date 
from employees
order by hire_date; 
 
select last_name, job_id, department_id, hire_date 
from employees 
order by hire_date asc;

select last_name, job_id, department_id, hire_date 
from employees 
order by hire_date desc;

-- ORDER BY se pone al final de la query(expression)
select employee_id, last_name, job_id, salary
from employees 
where salary >= 10000 or  job_id like '%MAN%' 
order by salary;

--  ERRPR,  ORDER BY tiene que estar al final de la expression,
select last_name, salary
from employees 
where salary >=  6000 
order by salary and last_name like 'G%';                                        -- Error

-- Se permite ordenar reusltados por varias cosas. Ejemplo abajo. 
select last_name, job_id, salary, department_id 
from employees 
order by department_id, salary desc;

select last_name, job_id, salary, department_id from employees 
order by department_id desc, salary desc;

-- Se permite ordenar por campo que no se encuentra en select, por ejemplo job_id
select last_name, salary 
from employees 
order by job_id;

select last_name, job_id, salary 
from employees 
order by job_id;

-- Se permite usar alias con ORDER BY 
select last_name, job_id, department_id, hire_date StartDate 
from employees 
order by StartDate;

-- Y se permite no usasr alias
select last_name, job_id, department_id, hire_date StartDate 
from employees 
order by hire_date; 

-- Tambien se puede usar numero de columna en ORDER BY. Por ejemplo la columna 
-- hire_date se encuentra en puesto 4
select last_name, job_id, department_id, hire_date StartDate
from employees 
order by 4; 

select last_name, job_id, department_id, hire_date StartDate
from employees 
order by 3, 4;

-- Los values Nullos estan ultimos por defecto
select last_name, job_id, department_id, hire_date StartDate 
from employees 
order by department_id;

-- Los values Nullos estan ultimos
select last_name, job_id, department_id, hire_date StartDate 
from employees 
order by department_id nulls last;

-- Los values Nullos estan primeros
select last_name, job_id, department_id, hire_date StartDate 
from employees 
order by department_id nulls first;

--==========================================================================================================================================================
--==================================================================================================================================== Substitution Variable 
--==========================================================================================================================================================
-- En las variables de substitution los characters y fecha se ponen entre 
-- comillas simples

SELECT employee_id, last_name, salary, department_id
FROM employees 
WHERE employee_id = &employee_num ;

-- Si variable de substitucion se usa con character es obligatorio 
-- usar comillas simples
SELECT last_name, department_id, salary*12 
FROM employees 
WHERE job_id = '&job_title' ;

-- Si variable de substitucion se usa con fecha es obligatorio 
-- usar comillas simples
SELECT last_name, department_id, salary*12 
FROM employees 
WHERE hire_date > '&hire_date';

SELECT last_name, department_id, salary*12 
FROM employees 
WHERE hire_date > &hire_date;                                                   -- ERROR

SELECT employee_id, last_name, job_id, &column_name 
FROM employees 
WHERE &condition ORDER BY &order_column;

--==========================================================================================================================================================
--================================================================================================================================= Using the DEFINE Command 
--==========================================================================================================================================================
DEFINE employee_num = 200
SELECT employee_id, last_name, salary, department_id 
FROM employees 
WHERE employee_id = &employee_num ;
UNDEFINE employee_num
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre este ejemplo

--==========================================================================================================================================================
--================================================================================================================================= Using the VERIFY Command 
--==========================================================================================================================================================
SET VERIFY ON
SELECT employee_id, last_name, salary 
FROM employees 
WHERE employee_id = &employee_num;
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre este ejemplo

--==========================================================================================================================================================
--===================================================================================================================================== Single-Row Functions
--==========================================================================================================================================================
-- 'Single-row Functions' - funccionan por cada campo de columna que 
-- se indica en parametros de funccion
-- 'Functions Group' - funccionana por columna entera que se indica 
-- en parametros de funccion

-- Si usa funccion de 'Single-Row Functions' y funccion de 'Function Group' 
-- es obligatorio poner aquel parametro que se pasa al funccion 'single-row' 
-- tambien poner en GROUP BY
select upper(last_name), max(salary) from employees;                            -- ERROR

select upper(last_name), max(salary) 
from employees 
group by last_name;                                                             -- NOT ERROR

--==========================================================================================================================================================
--====================================================================================================================================== Funcciones de Chars
--==========================================================================================================================================================

------------------------------------------------------------------------------------------------------------------ LOWER()
select 'SQL Course', lower('SQL Course') from dual;
select last_name, lower(last_name) from employees;

------------------------------------------------------------------------------------------------------------------ UPPER()
select 'SQL Course', upper('SQL Course') from dual;
select last_name, upper(last_name), hire_date, 
       upper(to_char(hire_date, 'dd month yyy')) 
from employees;

------------------------------------------------------------------------------------------------------------------ INITCAP() 
select 'SQL COUrse', initcap('SQL COUrse') from dual;
select last_name, initcap(last_name) from employees;

------------------------------------------------------------------------------------------------------------------ CONCAT()
select concat('Hello ', 'World') from dual;

SELECT CONCAT(CONCAT(last_name, '''s job category is '), job_id) "Job" 
FROM employees 
WHERE SUBSTR(job_id, 4) = 'REP';

------------------------------------------------------------------------------------------------------------------ SUBSTR()
-- SUBSTR(literal, a, b)
-- 'literal' = es string desde donde se va sacrse substring
-- 'a' = la posicion por donde empesar, incluso la posicion 'a'
-- 'b' = cantidat de los chars que qieremos sacar
select substr('HelloWorld', 0, 1) from dual;
select substr('HelloWorld', 2, 1) from dual;
select substr('HelloWorld', 2, 5) from dual;
select substr('HelloWorld', 2, 6) from dual;

-- SUBSTR(literal, a)
-- 'literal' = es string desde donde se va sacrse substring
-- 'a' = la posicion por donde empesar (incluso la posicion 'a') hasta 
-- la final de literal  
select substr('HelloWorld', 5) from dual;
select substr('HelloWorld', 10) from dual;
select substr('HelloWorld', 11) from dual;

-- substr() con campos NULL 
select last_name, substr(commission_pct, 1) from employees;
select last_name, substr(commission_pct, 1, 3) from employees;
-- Atencion
select last_name, substr(commission_pct, 5) from employees;

-- substr() con los numero negativos en parametros
select substr('​abcdefghijklmnñopqrstuvwxyz', -1, 1) from dual;
select substr('​abcdefghijklmnñopqrstuvwxyz', -5, 5) from dual;
select substr('​abcdefghijklmnñopqrstuvwxyz', -5, 4) from dual;
select substr('​abcdefghijklmnñopqrstuvwxyz', -5, 3) from dual;
-- Atencion aqui
select substr('​abcdefghijklmnñopqrstuvwxyz', -5, 7) from dual;
select substr('​abcdefghijklmnñopqrstuvwxyz', -2, 5) from dual;
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre este ejemplo

SELECT employee_id, CONCAT(first_name, last_name) "NAME",
LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(last_name, -1, 1) = 'n';

------------------------------------------------------------------------------------------------------------------ LENGTH()
-- length(literal) con string
-- 'literal' = literal donde se va contar los chars
select length('HelloWorld') from dual;
select length('Hello World') from dual;
select last_name, length(last_name) from employees;



select hire_date, length(hire_date) from employees;



select commission_pct, length(commission_pct) from employees;

------------------------------------------------------------------------------------------------------------------ INSTR()
-- instr(a, b, c, d)
-- a = literal donde buscamos concidencias
-- b = literan que estamos buscando
-- c = posicion desde donde empesar la busqueda
-- d = que concidencia qieremos encontrar la primera o segunda o tresera o ...

select instr('HelloWorld', 'W') from dual;

select instr('HelloWorld', 'B') from dual;

select instr('HelloWorld', 'Wo') from dual;

select instr('HelloWorld', 'Wq') from dual;

select instr('Hello World', 'o W') from dual;
select instr('Hello World', 'oW') from dual;

select instr('HelloWorld', 'HelloWorld') from dual;

select instr('HelloWorld', '#HelloWorld') from dual;
select instr('HelloWorld', 'HelloWorld#') from dual;

select instr('#HelloWorld', 'HelloWorld') from dual;
select instr('HelloWorld#', 'HelloWorld') from dual;

select instr('HelloWorld', 'l', 1, 1) from dual;
select instr('HelloWorld', 'l', 1, 2) from dual;
select instr('HelloWorld', 'l', 1, 3) from dual;

select instr('HelloWorld', 'l', 3, 1) from dual;
select instr('HelloWorld', 'l', 3, 2) from dual;
select instr('HelloWorld', 'l', 3, 3) from dual;

select instr('HelloWorld', 'l', 4, 1) from dual;
select instr('HelloWorld', 'l', 4, 2) from dual;
select instr('HelloWorld', 'l', 4, 3) from dual;

select instr('HelloWorld', 'l', 5, 1) from dual;
select instr('HelloWorld', 'l', 5, 2) from dual;
select instr('HelloWorld', 'l', 5, 3) from dual;

select instr('fagrhrtjy*dkfeqwhjgnhgjdg*vfgerhthshd', '*', -10, 1) from dual;
select instr('012*34567*89', '*', -4, 1) from dual;
select instr('012*34567*89', '*', -3, 1) from dual;
select instr('012*34567*89', '*', -2, 1) from dual;
select instr('012*34567*89', '*', -2, 2) from dual;
select instr('012*34567*89', '*', -1, 1) from dual;
select instr('012*34567*89', '*', -1, 2) from dual;
------------------------------------------------------------------------------------------------------------------ LPAD()
select lpad('Hello', 12, '*'), length(lpad('Hello', 12, '*')) from dual;
select last_name, lpad(last_name, 10, '*') from employees;
-- Atencion aqui, se corta last_name por ejemplo Hartstein = Hartste
select last_name, lpad(last_name, 7, '*') from employees;
select last_name, lpad(last_name, 2, '*') from employees;

------------------------------------------------------------------------------------------------------------------ RPAD()
select rpad('Hello', 12, '*'), length(rpad('Hello', 12, '*')) from dual;
select last_name, rpad(last_name, 10, '*') from employees;
-- Atencion aqui, se corta last_name por ejemplo Hartstein = Hartste
select last_name, rpad(last_name, 7, '*') from employees;
select last_name, rpad(last_name, 2, '*') from employees;

------------------------------------------------------------------------------------------------------------------ TRIMP()
-- Atencion la funccion trim() solo permite quitra primer o ultimo char de 
-- literal, si este char existe en literal
select 'HelloWorld', trim('H' FROM 'HelloWorld') from dual;
select 'HelloWorld', trim('d' FROM 'HelloWorld') from dual;

select 'qqqqABqqqqCqqq', trim('q' FROM 'qqqqABqqqqCqqq') from dual;
-- trim() por defecto elimina todos espacios en blanco por adelante de 
-- literal y por detras de 
-- literal. Espacion en medio de literal se quedan sin eliminar.
select '   AB   C    ', trim('   AB   C    ') from dual;
select '*' || '   AB   C    ' || '*', '*' || trim('   AB   C    ') || '*' 
from dual;
-- Atencion asi no funcciona sale error
select 'HelloWorld', trim('H', 'HelloWorld') from dual;  

------------------------------------------------------------------------------------------------------------------ REPLACE()
 select 'JACK and JUE', replace('JACK and JUE', 'J', 'BL') from dual;
 

------------------------------------------------------------------------------------------------------------------ TO_CHAR()
select last_name, salary, to_char(salary, '999G99D00') from employees;

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre como 
-- to_char() funcciona con charcteres y con los numeros

------------------------------------------------------------------------------------------------------------------ TO_DATE() 
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre este funccion
 
--==========================================================================================================================================================
--==================================================================================================================================================== Fecha 
--==========================================================================================================================================================
-- dd = dia presentada como un numero
select to_char(sysdate, 'dd') from dual;
-- day = dia de la semana presentada como: lunes, martes, miercoles, ...
select to_char(sysdate, 'day') from dual;
-- Day = dia de la semana presentada como: Lunes, Martes, Miercoles, ...
select to_char(sysdate, 'Day') from dual;
-- d = dia de la semanna presentada como: 1, 2, 3, ...
-- Atencion aqui me devuelve algo raro
select to_char(sysdate, 'd') from dual;

-- mm
-- Month
-- month
-- mon

-- yyyy
-- yy

-- rr
-- rrrr

-- Example format RR
select last_name, to_char(hire_date, 'DD-Mon-YYYY') from employees 
where hire_date < to_date('01-Jan-99', 'DD-Mon-RR'); -- 1999
select last_name, to_char(hire_date, 'DD-Mon-YYYY') from employees
where hire_date < to_date('01-Jan-99', 'DD-Mon-YY'); -- 2099

-- deferencia entre formatos de ano yy rr
select to_char(to_date('01-Jan-99', 'DD-Mon-RR'), 'dd-mm-yyyy') from dual;       -- 1999  
select to_char(to_date('01-Jan-99', 'DD-Mon-yy'), 'dd-mm-yyyy') from dual;       -- 2099

select to_char(to_date('01-Jan-50', 'DD-Mon-RR'), 'dd-mm-yyyy') from dual;       -- 1950 
select to_char(to_date('01-Jan-50', 'DD-Mon-yy'), 'dd-mm-yyyy') from dual;       -- 2050

select to_char(to_date('01-Jan-49', 'DD-Mon-RR'), 'dd-mm-yyyy') from dual;       -- 2049 
select to_char(to_date('01-Jan-49', 'DD-Mon-yy'), 'dd-mm-yyyy') from dual;       -- 2049

-- fx
select last_name, hire_date from employees 
where hire_date > to_date('01 - 01 - 2008', 'dd-mm-yyyy');                      -- not error

select last_name, hire_date from employees 
where hire_date > to_date('01 - 01 - 2008', 'fxdd-mm-yyyy');                    -- error

select last_name, hire_date from employees 
where hire_date > to_date('01-01-2008', 'fxdd-mm-yyyy');                        -- not error

select last_name, hire_date from employees 
where hire_date > to_date('01-JAN-2008', 'fxdd-mm-yyyy');                       -- error

-- fm
SELECT hire_date, to_char(hire_date, 'DD Month YYYY') HIREDATE FROM employees;
SELECT hire_date, to_char(hire_date, 'fmDD Month YYYY') HIREDATE FROM employees;
SELECT hire_date, to_char(hire_date, 'DD MM YYYY') HIREDATE FROM employees;
SELECT hire_date, to_char(hire_date, 'fmDD MM YYYY') HIREDATE FROM employees;

------------------------------------------------------------------------------------------------------------------ spht
-- Ddspth
SELECT hire_date, 
       to_char(hire_date, 'Ddspth "of" Month YYYY HH:MI:SS AM') HIREDATE 
FROM employees;

-- dDspth
SELECT hire_date, 
       to_char(hire_date, 'dDspth "of" Month YYYY HH:MI:SS AM') HIREDATE 
FROM employees;                                                                 -- No funcciona

-- Monthspth    
SELECT hire_date, 
       to_char(hire_date, 'dd "of" Monthspth YYYY HH:MI:SS AM') HIREDATE 
FROM employees;                                                                 -- ERROR

-- Mmspth     
SELECT hire_date, 
       to_char(hire_date, 'dd "of" Mmspth YYYY HH:MI:SS AM') HIREDATE 
FROM employees;                                                                 -- NOT ERROR

-- YYYYspth 
SELECT hire_date, 
       to_char(hire_date, 'Dd"of" Month YYYYsppth HH:MI:SS AM') HIREDATE 
FROM employees;

------------------------------------------------------------------------------------------------------------------ sp
-- Ddsp
SELECT hire_date, 
       to_char(hire_date, 'Ddsp "of" Month YYYY HH:MI:SS AM') HIREDATE 
FROM employees;

-- dDsp --> No funcciona
SELECT hire_date, 
       to_char(hire_date, 'dDsp "of" Month YYYY HH:MI:SS AM') HIREDATE 
FROM employees;

-- Monthsp   
SELECT hire_date, 
       to_char(hire_date, 'dd "of" Monthsp YYYY HH:MI:SS AM') HIREDATE 
FROM employees;                                                                 --  ERROR

-- Mmsp     
SELECT hire_date, 
       to_char(hire_date, 'dd "of" Mmsp YYYY HH:MI:SS AM') HIREDATE 
FROM employees;                                                                 -- NOT ERROR

-- YYYYsp 
SELECT hire_date, 
       to_char(hire_date, 'Dd"of" Month YYYYsp HH:MI:SS AM') HIREDATE 
FROM employees;

-- fecha de servidor base datos
select sysdate from dual; 

-- Con estos dos ajustes se puede cambiar el formato 
-- de fecha: nls_lang, nls_date_format . 
-- La configuracion nls_date_format tiene mas potncia que nls_lang
-- Cambiar formato de fecha de la session;
alter session set nls_date_format = 'dd-mm-yyyy hh24:mi:ss' 

-- Es la fecha de mi conneccion (fecha de mi portatil con cual estou entrando 
-- al sevidor de base datos)
select CURRENT_DATE from dual;   

select to_char(sysdate, 'DD/MM/YYYY hh:mi:ss') from dual;
select to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss') from dual;

SELECT SESSIONTIMEZONE, CURRENT_DATE FROM DUAL;

SELECT SESSIONTIMEZONE, CURRENT_TIMESTAMP FROM DUAL;

select sysdate, to_char(sysdate + 7, 'DD-Mon-YYYY hh24:mi:ss') from dual;
select sysdate, to_char(sysdate - 7, 'DD-Mon-YYYY hh24:mi:ss') from dual;

-- Error Multiplication y division no se permiten con fechas
select sysdate, to_char(sysdate * 2, 'DD-Mon-YYYY hh24:mi:ss') from dual;       -- Error 
select sysdate, to_char(sysdate / 2, 'DD-Mon-YYYY hh24:mi:ss') from dual;       -- Error 

-- Menos dies horas desde la fecha actual
select to_char(sysdate, 'DD-Mon-YYYY hh24:mi:ss') , 
       to_char(sysdate - (10/24), 'DD-Mon-YYYY hh24:mi:ss') 
from dual;

-- Menos dies minutos desde la fecha actual
select to_char(sysdate, 'DD-Mon-YYYY hh24:mi:ss') , 
       to_char(sysdate - (10/24/60), 'DD-Mon-YYYY hh24:mi:ss') 
from dual;

-- Menos dies segundos desde la fecha actual
select to_char(sysdate, 'DD-Mon-YYYY hh24:mi:ss') , 
       to_char(sysdate - (10/24/60/60), 'DD-Mon-YYYY hh24:mi:ss') 
from dual;

select round(sysdate - hire_date), trunc(sysdate - hire_date) from employees;

-- Cuantas semanas cada empleado he trabajado en impresa
select last_name, round((sysdate - hire_date) / 7), (sysdate - hire_date) / 7 
from employees 
order by 2 desc;

select to_char(sysdate, 'hh:mi:ss') Time from dual;

select to_char(sysdate, 'hh:mi:ss " Hora de descanso"') Time from dual;

select to_char(sysdate, 'day/month/year') from dual;

SELECT last_name, hire_date, 
       to_char(hire_date, 'fmddspth "of" Month YYYY fmHH:MI:SS AM') HIREDATE 
FROM employees;

SELECT last_name, hire_date, 
       to_char(hire_date, 'fmdd "of" MMspth YYYY fmHH:MI:SS AM') HIREDATE 
FROM employees;

SELECT last_name, hire_date, 
       to_char(hire_date, 'fmdd "of" Month YYYYspth fmHH:MI:SS AM') HIREDATE 
FROM employees;

-- dd Dd DD mm Mm MM yyy Yyy YYy YYY


SELECT last_name, hire_date FROM employees WHERE hire_date < '01-FEB-2008';

select to_date('01-JAN-1999', 'dd mm yyyy') from dual;
select to_date('01-JAN-99', 'dd mm yy') from dual;
select to_date('01-JAN-99', 'dd mm rr') from dual;
select to_date('01-JAN-1999', 'dd mm rrrr') from dual;

select last_name, hire_date from employees where hire_date > '01-JAN-1999';
select last_name, hire_date from employees where hire_date > '01-JAN-99';

-- Distinct 
select distinct hire_date from employees;

--==========================================================================================================================================================
--====================================================================================================================================== Funcciones de Fecha 
--==========================================================================================================================================================

------------------------------------------------------------------------------------------------------------------ TO_CHAR()
select to_char(sysdate, 'd-dy-day') from dual;

SELECT last_name, hire_date, 
       to_char(hire_date, 'DD Month YYYY') HIREDATE 
FROM employees;

select to_char(sysdate, 'hh:mi:ss') Time from dual;

-- Error texto se pone en comillas dobles
select to_char(sysdate, 'hh:mi:ss Hora de descanso') "Time" from dual;          -- Error

-- Texto enter comillas dobles
select to_char(sysdate, 'hh:mi:ss " Hora de descanso"') "Time" from dual;       -- NOT ERROR

select to_char(sysdate, 'day/month/year') from dual;

select to_char(sysdate, 'dd-month-yyyy', 'nls_date_language=american') from dual;
select to_char(sysdate, 'dd-month-yyyy', 'nls_date_language=spanish') from dual;
select to_char(sysdate, 'dd-month-yyyy', 'nls_date_language=ukrainian') from dual;
select to_char(sysdate, 'dd-month-yyyy', 'nls_date_language=german') from dual;
select to_char(sysdate, 'dd-month-yyyy', 'nls_date_language=french') from dual;

------------------------------------------------------------------------------------------------------------------ to_date()
-- Si hacer calculo con esta manera sale Error por no concidir formato de fecha
select last_name, hire_date 
from employees 
where hire_date > '10-03-1999'; 

-- Funccion to_date() nos auda darle fecha con culaquier formato pero tenemos 
-- pasar al los parametros el formato de la fecha que pide base de datos
select last_name, hire_date 
from employees 
where hire_date > to_date('10-03-1999', 'dd-mm-yyyy');

-- no me funcciona 
select last_name, hire_date 
from employees 
where hire_date > to_date('10-03-1999', 'dd-mon-yyyy', 'nls_date_language=american');

------------------------------------------------------------------------------------------------------------------ months_between()
-- Cuantos meses cada empleado he trabajado en impresa
select last_name, months_between(sysdate, hire_date) 
from employees 
order by 2 desc;

------------------------------------------------------------------------------------------------------------------ add_months()
select sysdate, add_months(sysdate, 3) from dual;

------------------------------------------------------------------------------------------------------------------ next_day()
-- jueves que viene
select next_day(sysdate, 'thu') from dual;
-- jueves pasado
select next_day(sysdate, 'thu') from dual;

------------------------------------------------------------------------------------------------------------------ last_day()
-- devuelve ultimo dia de mes
select last_day(sysdate) from dual;
select last_day(sysdate + 2) from dual;

------------------------------------------------------------------------------------------------------------------ round()
-- round Year
select to_char(round(sysdate, 'Year'), 'dd-mm-yyyy hh24:mi:ss'), 
       to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss') 
from dual;

-- round Month
select to_char(round(sysdate, 'Month'), 'dd-mm-yyyy hh24:mi:ss'), 
       to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss') 
from dual;

-- round day
select to_char(round(sysdate, 'DD'), 'dd-mm-yyyy hh24:mi:ss'), 
       to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss')  
from dual;

-- Atencion aquei algo esta pasando raro, 
select to_char(round(sysdate, 'Day'), 'dd-mm-yyyy hh24:mi:ss'), 
       to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss') 
from dual;                                                                      -- Atencion 

-- round hours
select to_char(round(sysdate, 'HH'), 'dd-mm-yyyy hh:mi:ss'), 
       to_char(sysdate, 'dd-mm-yyyy hh:mi:ss') 
from dual;

-- round minutes
select to_char(round(sysdate, 'MI'), 'dd-mm-yyyy hh:mi:ss'), 
      to_char(sysdate, 'dd-mm-yyyy hh:mi:ss') 
from dual;

-- round segundos
-- Error, no permite usar funccion rounda con segundos
select to_char(round(sysdate, 'ss'), 'dd-mm-yyyy hh:mi:ss'), 
       to_char(sysdate, 'dd-mm-yyyy hh:mi:ss') 
from dual;                                                                      -- Error 

------------------------------------------------------------------------------------------------------------------ trunc()

------------------------------------------------------------------------------------------------------------------ substr() con fecha
select last_name, substr(hire_date, 1, 6) from employees;
select last_name, substr(hire_date, 4) from employees;

--==========================================================================================================================================================
--================================================================================================================================================== Numeros 
--==========================================================================================================================================================
-- nls_lang=american_america   coneste ajuste se puede cambiar el 
-- region de base datos

-- Distinct 
select distinct salary from employees;

--==========================================================================================================================================================
--==================================================================================================================================== Funcciones de Numeros 
--==========================================================================================================================================================

-- You can use the AVG, SUM, MIN, and MAX functions against the columns that 
-- can store numeric data.

-- 'nls_numeric_characters = '',.'''
select to_char(round((salary / 7), 2), '99G999D99', 'nls_numeric_characters = '',.''') "Formated Salary" 
from employees;

------------------------------------------------------------------------------------------------------------------ TO_CHAR()
-- G = 
-- D = 
select last_name, salary, to_char(salary, '999G99D00') from employees;

-- L = Con la letra 'L' es puede poner el simbolo de dinero. Simbolo de dinero 
-- depende de los ajuctes de ...
select last_name, salary, to_char(salary, '999G99D00L') from employees;

-- $ = Con simbolo '$' es puede poner el simbolo de dinero Dolar.
select last_name, salary, to_char(salary, '999G99D00$') from employees;

-- en comando cofig todas comillas son simples(no dobles)
select last_name, salary, 
      to_char(salary, '999G99D00$', 'nls_numeric_characters = ''. ''') 
from employees; 

select last_name, salary, 
       to_char(salary, '999G99D00$', 'nls_numeric_characters = '' .''') 
from employees;

select last_name, salary, 
       to_char(salary, '999G99D00$', 'nls_numeric_characters = ''.#''') 
from employees;

select last_name, salary, 
       to_char(salary, '999G99D00$', 'nls_numeric_characters = ''_*''') 
from employees;

select last_name, salary, to_char(salary, '999,99.00$') from employees;

-- Atencion Error  ?????????
select last_name, salary, to_char(salary, '999*99_00$') from employees;

------------------------------------------------------------------------------------------------------------------ to_number()
select to_number('34') from dual;

-- Fecha no se puede convertir en numero
select to_number(sysdate) from dual;

select last_name, salary from employees 
where salary > to_number('10 000.00', '999G999D00');

------------------------------------------------------------------------------------------------------------------ to_date()


------------------------------------------------------------------------------------------------------------------ ROUND()
SELECT ROUND(45.9235,2), ROUND(45.923,0), ROUND(45.923,-1), ROUND(445.923,-2), 
ROUND(455.923,-2),ROUND(455.923,-3), ROUND(45.9235), ROUND(45) FROM DUAL;

------------------------------------------------------------------------------------------------------------------ TRUNC()
SELECT TRUNC(45.923,2), TRUNC(45.923), TRUNC(45.923, 0), TRUNC(45.923,-1), 
       TRUNC(450.923,-2), TRUNC(45)  
FROM DUAL;

------------------------------------------------------------------------------------------------------------------ CEIL()
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre ceil()

------------------------------------------------------------------------------------------------------------------ FLOOR()
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre floor()

------------------------------------------------------------------------------------------------------------------ MOD()
SELECT employee_id as "Even Numbers", last_name 
FROM employees 
WHERE MOD(employee_id,2) = 0;

------------------------------------------------------------------------------------------------------------------ substr() con numeros
select substr(1234567, 1, 5) from dual;
select last_name, substr(salary, 1, 3) from employees;

------------------------------------------------------------------------------------------------------------------ length() con numeros
-- length(literal) con numeros
-- 'literal' = literal donde se va contar los numeros
select length(1234567) from dual;
select salary, length(salary) from employees;

--==========================================================================================================================================================
--========================================================================================================================================= Generic function 
--==========================================================================================================================================================

------------------------------------------------------------------------------------------------------------------ NVL()
select last_name, commission_pct, nvl(commission_pct, 0) from employees;

-- Atencion Error. El valor del campo commission_pct es numerico y nosotros 
-- queremos poner en campo commission_pct valor character.
select last_name, commission_pct, nvl(commission_pct, 'no comm') from employees; -- ERROR

-- Error de ariba se puede resolver por esta solucion, si es necesario.
select last_name, commission_pct, nvl(to_char(commission_pct), 'no comm') 
from employees;

select last_name, commission_pct, nvl(to_char(commission_pct, '0.99'), 'no comm') 
from employees;

select first_name, (salary * (1 + nvl(commission_pct, 0))) * 12 from employees;

------------------------------------------------------------------------------------------------------------------ NVL2()
select last_name, salary, commission_pct, 
       nvl2(commission_pct, 
             round((((salary/100)*commission_pct) + salary)), salary ) 
from employees;
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre esta funccion

select commission_pct, nvl2(commission_pct, 'commission * salary', 'salary') 
from employees;

select commission_pct, nvl2(commission_pct, (((salary/100)*commission_pct) + salary), salary) 
from employees;

------------------------------------------------------------------------------------------------------------------ nullif()
-- nullif(a, b)
-- a = primer value
-- b = segundo value
-- si value 'a' y value 'b' son iguales funccion devulve null, si values no 
-- son iguales funccion devuelve value 'a'
select first_name, length(first_name) "expr1", 
       last_name, length(last_name) "expr1", 
       nullif(length(first_name), length(last_name)) "result" 
from employees;

------------------------------------------------------------------------------------------------------------------ coalesce
-- coalesce(a, b, c)
-- a = primer value
-- b = segundo value
-- c = value que se devuelve si values 'a' y 'b' son ambos nullos
-- coalesce devuelve value 'c' si value 'a' y value 'b' son nullos
-- coalesce devuelve value 'a' si value 'a' no es igual al null y 
-- value 'b' es nullo
-- coalesce devuelve value 'b' si value 'b' no es igual al null y 
-- value 'a' es nullo
-- coalesce devuelve value 'b' si value 'b' no es igual al null y 
-- value 'a' no es igual a nullo.
select last_name, employee_id, manager_id, commission_pct, 
       coalesce(to_char(commission_pct), 
                to_char(manager_id), 'No commission and no manager') 
from employees;

--==========================================================================================================================================================
--======================================================================================================================================== Nesting Functions
--==========================================================================================================================================================

SELECT last_name, UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US')) 
FROM employees 
WHERE department_id = 60;


--==========================================================================================================================================================
--========================================================================================================================================== CASE Expression
--==========================================================================================================================================================
select last_name, department_id, salary, 
  case department_id when 110 then 'Bestia'
                     when 90 then 'Myu buenos'
                     when 20 then 'Buenos'
  else 'Mantas' end "Titulos"
from employees;
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar mas informacion sobre esta funccion

-- condition puede ser cualquiera 
select last_name, job_id, salary, 
  case job_id when 'IT_PROG' then 1.10 * salary
              when 'ST_CLERK' then 1.15 * salary
              when 'SA_REP' then 1.20 * salary
  else salary end "REVISE SALARY"
from employees;
-- mismo resultado
select last_name, job_id, salary, 
  case when job_id = 'IT_PROG' then 1.10 * salary
       when job_id = 'ST_CLERK' then 1.15 * salary
       when job_id = 'SA_REP' then 1.20 * salary
  else salary end "REVISE SALARY"
from employees;

--==========================================================================================================================================================
--======================================================================================================================================== DECODE Expression
--==========================================================================================================================================================
-- decode sravnevaet tolko na ravenstvo.
-- decode compara solo de igualidad, no se permite poner 
-- expressiones de <, <=, >, >= ...
select job_id, decode(job_id,
            'IT_PROG', 'Programador', 
            'AD_PRES', 'Presidente', 
            'NOT DEFINE') 
from employees; 

select last_name, job_id, salary, 
     decode(job_id, 'IT_PROG', 1.10 * salary,
                    'ST_CLERK', 1.15 * salary,
                    'SA_REP', 1.20 * salary,
                    salary) 
    "REVISE SALARY"
from employees;

select last_name, salary,trunc(salary / 2000, 0), 
     decode(trunc(salary / 2000, 0),
                    0, 0.00,
                    1, 0.09,
                    2, 0.20,
                    3, 0.30,
                    4, 0.40,
                    5, 0.42,
                    6, 0.44,
                    0.45) 
    "TAX_RATE"
from employees;

--==========================================================================================================================================================
--================================================================================================================================================= GROUP BY 
--==========================================================================================================================================================

-- Place the HAVING and GROUP BY clauses after the WHERE clause in a statement. 
-- The order of the GROUP BY and HAVING clauses following the WHERE clause is not 
-- important. You can have either the GROUP BY clause or the HAVING clause first 
-- as long as they follow the WHERE clause. Place the ORDER BY clause at the end.

-- You can substitute column with an expression in the SELECT statement.

------------------------------------------------------------------------------------------------------------------ 
--                                                      The GROUP BY column does not have to be in the SELECT list

-- Columna que se indica en GROUP BY, puede no estar indicada en SELECT
select avg(salary) from employees group by department_id;

------------------------------------------------------------------------------------------------------------------ 
--                                                                                      GROUP BY y Group Functions

-- You cannot use the WHERE clause to restrict groups.
SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) > 8000
GROUP BY department_id;                                                         -- ERROR

-- You use the HAVING clause to restrict groups.
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000;                                                         

-- Si usamos en select una funccion de agrupacion o varial funciones de 
-- agrupacion no es obligatorio poner GROUP BY
select sum(salary) from employees;
select max(salary), sum(salary) from employees;

-- You cannot use group functions in the WHERE clause.

-- Campo salary no es obligatorio poner en GROUP BY por rason que 
-- campo salary se usa con funcion de agrupacion.
select last_name, department_id, sum(salary) 
from employees 
group by department_id, last_name;

select department_id, sum(salary) from employees group by department_id;

------------------------------------------------------------------------------------------------------------------

-- If you include a group function in a SELECT clause, you cannot select 
-- individual column as well, unless the individual column appears in the 
-- GROUP BY clause. You receive an error message if you fail to include the 
-- column list in the GROUP BY clause.
select department_id, sum(salary) from employees;                               -- ERROR

-- NOT ERROR
select department_id, sum(salary) from employees group by department_id;

-- ERROR.Si usamos una columna y una funccion de agrupacion tenemos que indicar 
-- con que campos nos vamos agrupar, y los estos campos que se encuentran en 
-- select que no esten en funcciones de agrupacion
select last_name, department_id, sum(salary) from employees;                    -- ERROR

-- NOT ERROR
select last_name, department_id, sum(salary) 
from employees
group by department_id, last_name;                               

------------------------------------------------------------------------------------------------------------------ 
--                                                        All the columns in the SELECT list that are not in group 
--                                                        functions must be in the GROUP BY clause.

-- Any column or expression in the SELECT list that is not an aggregate function 
-- must be in the GROUP BY clause:

-- You must include the columns in the GROUP BY clause.

-- A GROUP BY clause must be added to count the last names for 
-- each department_id.
SELECT department_id, COUNT(last_name) FROM employees;                          -- ERROR

-- Either add job_id in the GROUP BY or remove the job_id column 
-- from the SELECT list.
SELECT department_id, job_id, COUNT(last_name)
FROM employees
GROUP BY department_id;                                                         -- ERROR

-- Atencion ERROR. Todos campos que se encuentran en select y 
-- cuales no se usan para agrupacion, es obligatorio poner en GROUP BY
select last_name, department_id
from employees 
group by department_id;                                                         -- ERROR

-- NOT ERROR
select last_name, department_id
from employees 
group by department_id, last_name;                                              -- NOT ERROR

------------------------------------------------------------------------------------------------------------------
--                                        Usar WHERE antes de GROUP BY para filtrar resultados antes de agrupacion

-- Using a WHERE clause, you can exclude rows before dividing them into groups.
select department_id 
from employees
where hire_date > '19-JAN-2008'
group by department_id;

select department_id 
from employees
group by department_id;

------------------------------------------------------------------------------------------------------------------
--                                                                                             GROUP BY y ORDER BY
select department_id, job_id, sum(salary) 
from employees
group by department_id, job_id 
order by 1;

------------------------------------------------------------------------------------------------------------------
--                                                                           No se permite usar alias con GROUP BY

-- You cannot use a column alias in the GROUP BY clause.
-- Atencion. No se permite agrupar por alias, hay que usar nombre de columna
select department_id "D", sum(salary) from employees group by D;                -- ERROR
select department_id "D", sum(salary) from employees group by department_id;

------------------------------------------------------------------------------------------------------------------
--                                                                       'Single-Row Functions' y 'Function Group' 

-- Si usa funccion de 'Single-Row Functions' y funccion de 'Function Group' 
-- es obligatorio poner aquel parametro 
-- que se pasa al funccion 'single-row' tambien poner en GROUP BY
select upper(last_name), max(salary) from employees;                            -- ERROR
select upper(last_name), max(salary) from employees group by last_name;         -- NOT ERROR

------------------------------------------------------------------------------------------------------------------
--                                                                                Grouping by More Than One Column

-- Usar GROUP BY con varios columnas
SELECT department_id, job_id, sum(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY job_id;id;

------------------------------------------------------------------------------------------------------------------
--                                                                   Using the GROUP BY Clause on Multiple Columns

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;

-- Note: The SUM function is applied to the salary column for all job IDs in the
-- result set in each DEPARTMENT_ID group. Also, note that the SA_REP row is 
-- not returned. The DEPARTMENT_ID for this row is NULL and, therefore, does 
-- not meet the WHERE condition.

--==========================================================================================================================================================
--=================================================================================================================================================== HAVING 
--==========================================================================================================================================================
-- The Oracle server performs the following steps when you use the HAVING clause:
--      1. Rows are grouped.
--      2. The group function is applied to the group.
--      3. The groups that match the criteria in the HAVING clause are displayed.

-- Note: The WHERE clause restricts rows, whereas the HAVING clause restricts groups.

-- Place the HAVING and GROUP BY clauses after the WHERE clause in a statement. 
-- The order of the GROUP BY and HAVING clauses following the WHERE clause is not 
-- important. You can have either the GROUP BY clause or the HAVING clause first 
-- as long as they follow the WHERE clause. Place the ORDER BY clause at the end.

------------------------------------------------------------------------------------------------------------------
--                                                                                         Using the HAVING Clause

select department_id, sum(salary) 
from employees 
group by department_id;

select department_id, sum(salary) 
from employees 
group by department_id 
having sum(salary) > 10000;

select department_id, max(salary) 
from employees 
group by department_id 
having max(salary) > 10000;

SELECT job_id, SUM(salary) PAYROLL
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY SUM(salary);

------------------------------------------------------------------------------------------------------------------

-- ATENCION ERROR.
select department_id, max(salary) 
from employees 
group by department_id 
having max(salary) > 10000 
order by salary;                                                                -- ATENCION ERROR

-- Aqui no tiene error
select department_id, max(salary) 
from employees 
group by department_id 
having max(salary) > 10000 
order by max(salary);

select department_id, max(salary) 
from employees 
group by department_id 
having max(salary) > 10000 
order by department_id;

-- Query de abajo esta incorrecto!!! Funcciona extrano
select department_id, max(salary) 
from employees 
group by department_id, salary 
having max(salary) > 10000 
order by salary;                                                                --ATENCION

-- Este example funccion bien, pero para performance este example malo.
select department_id, sum(salary) 
from employees 
group by department_id 
having department_id <> 50;

-- Mejor hacer de esta manera
select department_id, sum(salary) 
from employees 
where department_id <> 50 
group by department_id;

-- Queris con mismos resultados
select job_id, sum(salary) PAYROLL 
from employees 
where job_id not like '%REP%' 
group by job_id 
having sum(salary) > 13000 
order by sum(salary);

select job_id, sum(salary) PAYROLL 
from employees 
where job_id not like '%REP%' 
group by job_id 
having sum(salary) > 13000 
order by PAYROLL;

select job_id, sum(salary) PAYROLL 
from employees 
where job_id not like '%REP%' 
group by job_id 
having sum(salary) > 13000 
order by 2;

--==========================================================================================================================================================
--========================================================================================================================================== Functions Group
--==========================================================================================================================================================

-- Guidelines for using the group functions:
--• DISTINCT makes the function consider only nonduplicate values; ALL makes it
--  consider every value, including duplicates. The default is ALL and, 
--  therefore, does not need to be specified.
--• The data types for the functions with an expr argument may be CHAR, 
--  VARCHAR2,NUMBER, or DATE.
--• All group functions ignore null values. To substitute a value for null 
--  values, use the NVL, NVL2, COALESCE, CASE, or DECODE functions.

-- Group functions operate on sets of rows to give one result per group.

-- Unlike single-row functions, group functions operate on sets of rows to give
-- one result per group. These sets may comprise the entire table or the table 
-- that is split into groups.

-- All group functions ignore null values in the column.

-- You can use the AVG, SUM, MIN, and MAX functions against the columns that 
-- can store numeric data.


-- 'Single-row Functions' - funccionan por cada campo de columna que se 
-- indica en parametros de funccion

-- 'Functions Group' - funccionana por columna entera que se indica en 
-- parametros de funccion

-- Se recomienda (para entender todas cosas) antes de estudiar las funciones 
-- de agrupacion hay que estudiar GROUP BY

-- Note: The AVG, SUM, VARIANCE, and STDDEV functions can be used only with 
-- numeric data types. MAX and MIN cannot be used with LOB or LONG data types.

------------------------------------------------------------------------------------------------------------------

-- Si usamos en select una funccion de agrupacion o varias funciones de 
-- agrupacion no es obligatorio poner GROUP BY
select sum(salary) from employees;

SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees;

SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary), count(employee_id) 
FROM employees 
where job_id like '%REP%';

-- Atencion ERROR. Si en select se usa una columna y alguna funccion de 
-- agrupacion, es obligatorio usar GROUP BY
select last_name, max(salary) from employees;                                   -- Atencion ERROR

-- Aqui ya no nos sale ERROR
select last_name, max(salary) from employees group by salary, last_name;        -- NOT ERROR

-- Si usa funccion de 'Single-Row Functions' y funccion de 'Function Group' 
-- es obligatorio poner aquel parametro 
-- Que se pasa al funccion 'single-row' tambien poner en GROUP BY
select upper(last_name), max(salary) from employees;                            -- ERROR
select upper(last_name), max(salary) from employees group by last_name;         -- NOT ERROR

-- No se permite usar 'FUNCTIONS GROUP' en causula 'WHERE'. Example abajo
select department_id, avg(salary) 
from employees 
where avg(salaty) > 8000 
group by department_id;

------------------------------------------------------------------------------------------------------------------ AVG

-- Average value of 'n' elemnts, ignoring null values

-- Cuando se calcula avg, los campos que estan rellnos de nullos no se cuntan

-- You can use the AVG, SUM, MIN, and MAX functions against the columns that 
-- can store numeric data.

select avg(salary) from employees;

-- ERROR no permite value fecha
select avg(hire_date) from employees;                                           -- ERROR  

-- ERROR no permite value character
select avg(last_name) from employees;                                           -- ERROR  

-- AVG entre aquellas personas que tiene commission
select avg(commission_pct) from employees;

-- AVG entre todas personas de tabla, incluso aquella personas que no 
-- tienen puesta la commission
select avg(nvl(commission_pct,0)) from employees;

-- otro exemplo mas
select avg(commission_pct), 
       sum(commission_pct)/count(commission_pct), 
       sum(commission_pct)/count(*)  
from employees; 

------------------------------------------------------------------------------------------------------------------ COUNT

-- Number of rows, where expr evaluates to something other than null (count 
-- all selected rows using *, including duplicates and rows with nulls)

-- Devuelve cantidad de las filas(registros) en tabla
select count(*) from employees;

select count(*) from employees where department_id = 50;

select count(employee_id) from employees;

select count(hire_date) from employees;
select count(last_name) from employees;

-- ATENCION. Los campos nulos count() no cuenta
select count(commission_pct) from employees;

-- Para poder contar todos campos incluso nullos se puede hacer con esta manera
select count(nvl(commission_pct, 0)) from employees;

-- Distinct
select count(distinct department_id) from employees;

------------------------------------------------------------------------------------------------------------------ MAX

-- Maximum value of expr, ignoring null values

-- You can use the AVG, SUM, MIN, and MAX functions against the columns that 
-- can store numeric data.

-- You can use MIN and MAX for numeric, character, and date data types.

-- You can use the MAX and MIN functions for numeric, character, and date data types.

select max(salary) from employees;
select max(hire_date) from employees;
select max(last_name) from employees;

-- ATENCION. Los campos nulos MAX() no cuenta
select max(commission_pct) from employees;                                      -- ATENCION

-- Esto tiene poca importancia con funccion MAX(), para poder sacar todos campos 
-- de esta columna 
-- incluso campos nullos se puede hacer con esta manera
select max(nvl(commission_pct, 0)) from employees;

------------------------------------------------------------------------------------------------------------------ MIN

-- Minimum value of expr, ignoring null values

-- You can use the AVG, SUM, MIN, and MAX functions against the columns that 
-- can store numeric data.

-- You can use MIN and MAX for numeric, character, and date data types.

-- You can use the MAX and MIN functions for numeric, character, and date data types.

select min(salary) from employees;
select min(hire_date) from employees;
select min(last_name) from employees;

-- ATENCION. Los campos nulos MIN() no cuenta
select min(commission_pct) from employees;                                      -- ATENCION

-- ATENCION CON ESTA INFORMACION, PUEDE SER FALSA
-- Para poder resolver problema de campos nullos se puede resolve de 
-- esta manera. Pero es mucho depende de la tarea: 
--     1) Sacar minima comision de todos empleados que tiene comision puesta
--     2) Sacar minima comision de todos empleados que tiene comision puesta, 
--        y de aquellos que no tienen la comision puesta(Esta pregunta es 
--        muy logica commission = 0)
select min(nvl(commission_pct, 0)) from employees;

------------------------------------------------------------------------------------------------------------------ SUM

-- Sum values of n, ignoring null values

-- You can use the AVG, SUM, MIN, and MAX functions against the columns that 
-- can store numeric data.

select sum(salary) from employees;

select sum(last_name) from employees;   -- ERROR no permite value character
select sum(hire_date) from employees;   -- ERROR no permite value fecha

select sum(salary) from employees where department_id = 50;

select sum(commission_pct) from employees;

------------------------------------------------------------------------------------------------------------------ LISTAGG

-- Orders data within each group specified in the ORDER BY clause and then 
-- concatenates the values of the measure column


------------------------------------------------------------------------------------------------------------------ STDDEV

-- Standard deviation of n, ignoring null values

------------------------------------------------------------------------------------------------------------------ VARIANCE

-- Variance of n, ignoring null values


--==========================================================================================================================================================
--================================================================================================================================== Nesting Group Functions
--==========================================================================================================================================================
-- Group functions can be nested to a depth of two functions.

-- Display the maximum average salary
select max(avg(salary)) 
from employees 
group by department_id;

select avg(salary) 
from employees 
group by department_id;

------------------------------------------------------------------------------------------------------------------
--                                                       Group functions can be nested to a depth of two functions

select max(avg(salary)) 
from employees 
group by department_id; 

-- Cuidado aqui para no equivocarse en esta situacion que ocurre en 
-- ejemplo de abajo. No son 'Nesting Group Functions'.
-- Cuando una de las funcciones es 'Single Row Function' el conjunto de estas
-- funcciones no es 'Nesting Group Functions'. 
-- En este tipo de 'conjunto funcciones' se puede poner cualquier cantida 
-- de funciones.
select round(avg(to_number(salary))) from employees;                            -- ATENCION AQUI No son 'Nesting Group Functions'

select avg(to_number(salary)) from employees;                                   -- ATENCION AQUI No son 'Nesting Group Functions'

------------------------------------------------------------------------------------------------------------------ 
--                                                  That GROUP BY clause is mandatory when nesting group functions

select max(avg(salary)) 
from employees;                                                                 -- ERROR

select max(avg(salary)) 
from employees group by department_id;                                          -- NOT ERROR

-- Cuidado aqui para no equivocarse en esta situacion que ocurre en 
-- ejemplo de abajo. No son 'Nesting Group Functions'.
-- Cuando una de las funcciones es 'Single Row Function' el conjunto de estas
-- funcciones no es 'Nesting Group Functions'
-- En este tipo de 'conjunto funcciones' no es obligatorio poner GROUP BY
select round(avg(salary)) from employees;                                       -- ATENCION AQUI No son 'Nesting Group Functions' 
select avg(to_number(salary)) from employees;                                   -- ATENCION AQUI No son 'Nesting Group Functions' 
select round(avg(salary)) from employees group by department_id;                -- ATENCION AQUI No son 'Nesting Group Functions'
select avg(to_number(salary)) from employees group by department_id;            -- ATENCION AQUI No son 'Nesting Group Functions'

--==========================================================================================================================================================
--===================================================================================================================================================== JOIN
--==========================================================================================================================================================
-- Prefiksu yvelichevayt skorost
-- FK = PK


------------------------------------------------------------------------------------------------------------------ NATURAL JOIN
-- NATURAL JOIN usa todos campos iguales en ambas tablas para hacer conneccion 
-- entre las tablas

select department_id, department_name, location_id, city 
from departments 
natural join locations;

select department_id, department_name, location_id, city 
from departments 
natural join locations;

------------------------------------------------------------------------------------------------------------------ USING
-- Palabra clave USING se usa para asignar concretamente con que 
-- campo tenemos que hacer
-- Conneccion entre las tablas

-- Aqui se usa natural join, tenemos los resultados pero no aparecen 
-- todos employees.
-- En este caso query con natural join nos saca employees que tienen 
-- relacionado entre dos tablas con dos campos: 'manager_id' y 'department_id' 
select last_name, salary, department_name from departments natural join employees;

-- Para resolver esta problema se puede usar USING. Con USING se puede conectar 
-- las tablas con un campo solo
select last_name, salary, department_name 
from departments 
join employees 
using(department_id);

select employee_id, last_name,location_id, department_id 
from employees 
join departments 
using(department_id);

-- Campo que se usa con USING, no se permite usar con alias(no se si exactamente 
-- esta cosa se llama alias) en cual quier lugar de query
-- Exemplo abajo nos ensena que nosotros usamos campo location_id con 
-- USING(location_id) y en parte select nos ponemos 'd.location' con un alias. 
-- Y por eso nos da ERROR
select l.city, d.department_name, d.location_id 
from locations l 
join departments d 
using(location_id);

select locations.city, departments.department_name, departments.location_id 
from locations 
join departments 
using(location_id);

-- En este ejemplo nos sale misma ERROR, pero en este ejemplo campo location 
-- nos hemos puesto en WHERE con alias 'd.location_id'
select l.city, d.department_name 
from locations l 
join departments d 
using(location_id) 
where d.location_id = 1400;

select locations.city, departments.department_name
from locations 
join departments
using(location_id) 
where departments.location_id = 1400;

-- Aqui ya no tenemos esta ERROR que hemos tenido en dos ejemplos que estan 
-- mas ariba, porqu hemos quitado el alias de location_id
select l.city, d.department_name, location_id 
from locations l 
join departments d 
using(location_id);

select locations.city, departments.department_name, location_id 
from locations 
join departments 
using(location_id);

select l.city, d.department_name 
from locations l 
join departments d 
using(location_id) 
where location_id = 1400;

select locations.city, departments.department_name 
from locations 
join departments 
using(location_id) 
where location_id = 1400;

------------------------------------------------------------------------------------------------------------------ JOIN  ON
-- Palabra clave 'ON' se puede usar cuando campos de 
-- relacion('ForenKey' y 'PrimaryKey') tienen diferentes nombres de campos por 
-- exemplo 'e.department_id' y 'd.depar_id' 
select e.last_name, e.salary, d.department_name, d.department_id 
from departments d 
join employees e 
on (e.department_id = d.department_id);

select e.employee_id, e.last_name, e.department_id, d.department_id, 
       d.location_id 
from employees e 
join departments d 
on(e.department_id = d.department_id);

-- Coneccion con tres tablas usando 'ON'
select first_name ||' '|| last_name "Full Name", 
       department_name "Department", city 
from employees e 
join departments d 
on d.department_id = e.department_id 
join locations l 
on d.location_id = l.location_id;

-- Additional connection conditions
select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
from employees e join departments d 
on (e.department_id = d.department_id) 
and e.manager_id = 149;

select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
from employees e join departments d 
on (e.department_id = d.department_id) 
and e.manager_id = 149;

--==========================================================================================================================================================
--========================================================================================================================= Ne iavnoe pereobrasovanie dannux 
--==========================================================================================================================================================
select 1 + '3' from dual;

select 1 ||  ' algun cantidad de characteres ' || 45 from dual;

select * from employees where hire_date > '01-jan-2007';

-- Atencion aqui, hay que poner la fecha en formato que esta puesto en ajustes
select * from employees where hire_date > '01-01-2007';

--==========================================================================================================================================================
--================================================================================================================================================ Sub Qurys
--==========================================================================================================================================================
-- Sub Query se puede usar en qual quier parte de select
select (select sysdate from dual), (select current_date from dual) from dual;

------------------------------------------------------------------------------------------------------------------ Sub Querys que devolven un resultado
-- Aqui sub query devuelve un resultado. Y si sub query devuelve un reusltado 
-- se permite usar operadores: >, =>, <, =<, <>, =! ...
select last_name, department_id, job_id 
from employees
where employee_id = (select employee_id 
                     from employees
                     where last_name = 'King');
                     
select last_name, salary 
from employees
where manager_id = (select employee_id 
                     from employees
                     where last_name = 'King');

------------------------------------------------------------------------------------------------------------------ Sub Querys que devolven varios resultado
-- Sub query que devuelve varios resultados no se permite usar 
-- operacines: >, =>, <, =<, <>, =! ...

-- En sub query que devuelve varios resultados solo se permite usar los 
-- operdores: >, =>, <, =<, <>, =! ... con palabras claves 'ANY' y 'ALL'

-- Error. Segunda sub query devuelve varios resultados. Y con operador  '=' no 
-- se puede comparar un registro con varos ala vez.
select last_name, department_id, job_id
from employees
where department_id = (select department_id
                       from departments
                       where location_id = 1700);                               -- ERROR
                       
-- Con operadores: 'IN', 'ANY', 'ALL' se permite comparar un reusltado 
-- con varios resultados    
select last_name, department_id, job_id
from employees
where department_id IN (select department_id
                       from departments
                       where location_id = 1700);                               -- NOT ERROR

select last_name, department_id, job_id
from employees
where department_id = ANY (select department_id
                       from departments
                       where location_id = 1700);                               

select last_name, department_id, job_id
from employees
where department_id <= ALL (select department_id
                       from departments
                       where location_id = 1700);                               




--Este ejamplo no funccion
select(select sum(salary) from employees where department_id = 50),
      (select max(salary) from employees where department_id = 10) from dual;
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Buscar informacion

--==========================================================================================================================================================
--=================================================================================================================================================== Others
--==========================================================================================================================================================
-- Para sqlplus, hacer las linias mas anchas:     set linesize 2000
-- para repitir linia:      l

-- show parameter nls
-- alter system set 
-- alter session set nls_date_format='DD/MM/YYYY'  

sqlplus / as sysdba
alter user ora1 identified by ora1 account unlock;
alter user hr identified by hr account unlock;

conn / as sysdba;
select username from dba_users;
select username from dba_users order by 1;








