select 'Pedro' from dual;

select 'Pedro' Nombre from dual;

select 'Pedro' as Nombre from dual;

select * from emp;

select job from emp;
select job Trabajo from emp;
select job as Trabajo from emp;

select 12 + 3 from dual;
select 12 + 3 suma from dual;

select empno from emp;
select emp.empno from emp;
select a.empno from emp a;
select a.empno PK
  from emp a;
  
Select ename, sal + comm total, sal salario, comm comisión
  from emp;
  
select DISTINCT deptno
  from emp;
select ALL deptno
  from emp;
  
select * 
  from emp
  where deptno = 10;
  
select * 
  from emp
  where ename like '%S';  

select * 
  from emp
  where ename like '%$%%' ESCAPE '$'; 

select * 
  from emp
  where ename like '%/%%' ESCAPE '/';

--No se recupera la fila deseada
select * 
  from emp
  where ename like '%/%' ESCAPE '/';
  
--Empleado del departamento 10 y 20
SELECT * 
  from emp
  where deptno in (10, 20);
  
Select * 
  from emp
  where deptno = any (10, 20);

--Empleados que no esten el departamento 10 y 20
SELECT * 
  from emp
  where deptno not in (10, 20);
  
Select * 
  from emp
  where deptno != all (10, 20);
  
-- Variadas uso de any y all
/*
Seleccionar numero de departamento que sean 10 y 20 a la vez => ¡IMPOSIBLE! 
Salida vacia.
*/
Select * 
  from emp
  where deptno = all (10, 20);
  
Select * 
  from emp
  where deptno >= all (10, 20);

Select * 
  from emp
  where deptno <= all (10, 20);
-- ANY 
Select * 
  from emp
  where deptno = any (10, 20);

Select * 
  from emp
  where deptno != any (10, 20);
  
Select * 
  from emp
  where deptno >= any (10, 20);

Select * 
  from emp
  where deptno <= any (10, 20);
  
--ORDENACION
select * from emp
order by ename;

select * from emp
order by ename desc;

select ename, sal + comm, sal, comm
  from emp
  order by 2, ename;
  
select ename, sal + comm, sal, comm
  from emp
  order by comm;