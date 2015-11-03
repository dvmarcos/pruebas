-- Expresiones regulares

-- Recuperar las filas de los trabajos con dos 'A'
select * 
  from emp
  where REGEXP_LIKE(job, '^[AC]');

select * 
  from emp
  where REGEXP_LIKE(upper(job), '^[AC]');

select * 
  from emp
  where REGEXP_LIKE(job, '^[ACac]');
-- Retorna una cadena dentro de otra
SELECT REGEXP_SUBSTR('El patio de mi casa es particular', 'El') from dual;
SELECT REGEXP_SUBSTR('El patio de mi casa es particular', 'El', 2) from dual;
SELECT REGEXP_SUBSTR('El patio de mi casa es particular', 'pa', 5) from dual;
SELECT REGEXP_SUBSTR('El patio de mi casa es particular', 'pa', 5, 2) from dual;
SELECT REGEXP_SUBSTR('El patio de mi casa es particularpa', 'pa', 5, 2) from dual;
SELECT REGEXP_SUBSTR('El patio de mi casa es particularPa', 'pa', 5, 2) from dual;
SELECT REGEXP_SUBSTR('El patio de mi casa es particularPa', 'pa', 5, 2, 'i') from dual;

-- Retorna la posición de una cadena dentro de otra
SELECT REGEXP_INSTR('El patio de mi casa es particular', 'El') from dual;
SELECT REGEXP_INSTR('El patio de mi casa es particular', 'El', 2) from dual;
SELECT REGEXP_INSTR('El patio de mi casa es particular', 'pa', 5) from dual;
SELECT REGEXP_INSTR('El patio de mi casa es particular', 'pa', 5, 2) from dual;
SELECT REGEXP_INSTR('El patio de mi casa es particularpa', 'pa', 5, 2) from dual;
SELECT REGEXP_INSTR('El patio de mi casa es particularPa', 'pa', 5, 2) from dual;
SELECT REGEXP_INSTR('El patio de mi casa es particularPa', 'pa', 5, 2, 0,'i') from dual; 
SELECT REGEXP_INSTR('El patio de mi casa es particularPa', 'pa', 5, 2, 1,'i') from dual; 

-- Reemplaza una cadena de caracteres por otra
SELECT REGEXP_REPLACE('El patio de mi casa es particular', 'El', 'LA') from dual;
SELECT REGEXP_REPLACE('El patio de mi casa es particular', 'El', 'LA', 2) from dual;
SELECT REGEXP_REPLACE('El patio de mi El casa es particular', 'El', 'LA', 2) from dual;
SELECT REGEXP_REPLACE('El patio de mi casa es particular', 'pa', 'LA', 5) from dual;
SELECT REGEXP_REPLACE('El patio de mi casa es particular', 'pa', 'LA', 5, 2) from dual;
SELECT REGEXP_REPLACE('El patio de mi casa es particularpa', 'pa', 'LA', 5, 2) from dual;
SELECT REGEXP_REPLACE('El patio de mi casa es particularPa', 'pa', 'LA', 5, 2) from dual;
SELECT REGEXP_REPLACE('El patio de mi casa es particularPa', 'pa', 'LA', 5, 2, 'i') from dual;