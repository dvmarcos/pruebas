-- Funciones de Fecha
select sysdate from dual;

select sysdate - to_date('01-01-2012') from dual;

select sysdate + 1 from dual;

select add_months(sysdate, 1) from dual;

select months_between(sysdate, to_date('01-01-2012')) from dual;

select last_day(sysdate) from dual;

select next_day(sysdate, 2) from dual;

select extract(day from sysdate) from dual;

select round(sysdate, 'month') from dual;
select round(sysdate+20, 'month') from dual;

select trunc(sysdate, 'month') from dual;
select trunc(sysdate+20, 'month') from dual;

-- Funciones de conversión
select to_number('12')    from dual;
select to_number('12A')   from dual;
select to_number(' 12 ')  from dual;
select to_number('hola')  from dual;

select to_char(12, '999') from dual;
select to_char(1267, '999') from dual;
select to_char(12, '000') from dual;
select to_char(12, '000$') from dual;
select to_char(12, '000L') from dual;
select to_char(12.3, '000.0C') from dual;
select to_char(12.3, '000d00L') from dual;
select to_char(412.3, '0g000d00L') from dual;
select to_char(63412.3, '90g000d00L') from dual;
select to_char(2012, 'RN') from dual;
select to_char(2012, 'rn') from dual;

select to_char(sysdate) from dual;
select to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss') from dual;

select to_date('28-02-2012', 'dd-mm-yyyy hh24:mi:ss') from dual;
select to_date('28-02-2012', 'mm-dd-yyyy hh24:mi:ss') from dual; --error

select to_char(sysdate, 'j') from dual;

select to_char(sysdate, 'Month, ddth, YYYYsp') from dual;
select to_char(sysdate, 'fmMonth, ddth, YYYYsp') from dual;

-- Funciones varias
select greatest(sysdate, sysdate + 2) from dual;
select greatest(15, 82, 43, 3) from dual;

select least(sysdate, sysdate + 2) from dual;
select least(15, 82, 43, 3) from dual;

select nvl(null, 'valor Nulo') from dual;
select nvl('OK', 'valor Nulo') from dual;
select ename, comm 
  from emp;
select ename, nvl(comm, 0) 
  from emp;
  
select nvl2(null, 'OK', 'valor Nulo') from dual;
select nvl2(12, 'OK', 'valor Nulo') from dual;
select ename, nvl2(comm, to_char(comm), 'No tiene') 
  from emp;
  
select nullif(9, 9) from dual;
select nullif(9, 8) from dual;

select coalesce(NULL, NULL, 3, 8, NULL) from dual;

select bitand(8,12) from dual;

select vsize(15) from dual;
select vsize('casa') from dual;
select vsize(sysdate) from dual;

select user from dual;

select decode(2,
              1, 'valor 1',
              2, 'valor 2',
              3, 'valor 3',
              'valor por defecto') 
            from dual;

select nombre, decode(sexo,
                      'H', 'Hombre',
                      'M', 'Mujer',
                      'Desconocido')
      from templa;

select 
  case 2
         when 1 then 'valor 1'
         when 2 then 'valor 2'
         when 3 then 'valor 3'
          else 'valor por defecto'
  end
from dual;
select nombre, case sexo
                      when 'H' then 'Hombre'
                      when 'M' then 'Mujer'
                      else 'Desconocido'   
              end
      from templa;
select 
  case 
         when 2=1 then 'valor 1'
         when 2=2 then 'valor 2'
         when 2=3 then 'valor 3'
          else 'valor por defecto'
  end
from dual;
select nombre, case 
                      when Sexo = 'H' then 'Hombre'
                      when nombre like 'C%' then 'Hombre'
                      when Sexo = 'M' then 'Mujer'
                      else 'Desconocido'   
              end
      from templa;
