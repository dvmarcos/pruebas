select avg(comm)
  from emp;

select sum(comm) / count(*)
  from emp;
  
select sum(comm) / count(comm)
  from emp;
  
select max(sal) 
  from emp;

-- No se pueden mezclar columnas agrupadas o otras no agrupadas  
select max(sal), ename
  from emp;
  
-- ejemplos agrupamientos
-- Numero de empleadas en cada departamento
Select deptno, count(*)
  from emp
  group by deptno;
  
Select count(*)
  from emp
  group by deptno;
  
Select count(*)
  from emp;
  
--Uso del HAVING
Select deptno, count(*)
  from emp
  group by deptno
  HAVING deptno=10;
  
-- Numero de empleados de los departamentos 10 y 30 en orden descendente de departamento.
Select deptno, count(*)
  from emp
  group by deptno
  HAVING (deptno=10) or (deptno=30)
  Order by deptno desc;

Select deptno, count(*)
  from emp
  group by deptno
  HAVING deptno IN(10, 30)
   Order by deptno desc;
   
Select deptno, count(*)
  from emp
  group by deptno
  HAVING deptno = ANY(10, 30)
   Order by deptno desc;
  