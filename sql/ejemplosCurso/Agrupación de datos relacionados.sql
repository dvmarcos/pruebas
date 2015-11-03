--Agrupación de datos relacionados

-- ROLLUP
-- Obtiene los totales de la función de agrupamiento
select deptno, count(*)
   from emp
   group by deptno;

select deptno, count(*)
   from emp
   group by rollup (deptno);

select deptno, job, count(*)
   from emp
   group by (deptno, job)
   order by deptno;

select deptno, job, count(*)
   from emp
   group by rollup (deptno, job);  



   
--CUBE
select deptno, count(*)
   from emp
   group by deptno
   order by deptno;
   
select deptno, count(*)
   from emp
   group by cube (deptno);

select deptno, count(*), grouping(deptno)
   from emp
   group by cube (deptno);
   
select deptno, job, count(*)
   from emp
   group by cube (deptno, job);
   
select deptno, job, count(*), grouping(deptno), grouping(job) 
   from emp
   group by cube (deptno, job);
---   
select deptno, sum(sal)
   from emp
   group by deptno;

select deptno, sum(sal)
   from emp
   group by cube (deptno);

select deptno, job, sum(sal)
   from emp
   group by cube (deptno, job);
   
select deptno, job, sum(sal), grouping(deptno),grouping(job)
   from emp
   group by cube (deptno, job);


--PIVOT (Girar)
SELECT dept, sexo, sum(salar)
from templa
GROUP  BY dept, sexo
order by dept, sexo;

SELECT * 
  from (select dept, sexo, salar 
          from templa) t1
  Pivot (
    sum(salar)    -- Resultado central de la matriz
    for sexo      -- Selección de columna
    in ('H' as "Hombre",'M' as "Mujer")  -- Lista de valores por lo que filtraremos
    )
  order by dept;  -- Columna inicial para la ordenación
  
SELECT * 
  from (select dept, sexo, salar 
          from templa) t1
  Pivot (
    sum(salar) suma, min(salar) minimo    
    for sexo      
    in ('H','M')  
    )
  order by dept;  

SELECT * 
  from (select dept, sexo, salar 
          from templa) t1
  Pivot (
    sum(salar)    
    for sexo      
    in (select sexo from templa)  
    )
  order by dept;  
