--1--
select dept, codtra, feching, nombre, apellido 
from templa where salar >200000 and feching > '01/01/1975';

--2--
select e.nombre,e.apellido,e.feching from templa e, tdepta d 
where d.numdirec =e.nuempl order by nuempl;
--3--

select count(nombre) num,fechnac from templa where fechnac= '15/09/25' group by fechnac ;

select * from templa e, templa b
where e.sexo != b.sexo
and e.fechnac=b.fechnac;

select * from templa e join templa b on(e.sexo!=b.sexo and e.fechnac=b.fechnac);

Select dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept, emp;
  
select count(*) from emp;
select count(*) from dept;

-- EQUI JOIN
Select dept.deptno, emp.deptno, dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept, emp
  where (dept.deptno = emp.deptno);
  
--NOT EQUI-JOIN
Select dept.deptno, emp.deptno, dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept, emp
  where (dept.deptno != emp.deptno);
  
-- RIGHT OUTER JOIN ( saca todos los campos de emp.deptno)
Select dept.deptno, emp.deptno, dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept, emp
  where (dept.deptno (+) = emp.deptno);
  
-- LEFT OUTER JOIN ( saca todos los campos de dept.deptno)
Select dept.deptno, emp.deptno, dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept, emp
  where (dept.deptno = emp.deptno (+));
  
--Usando alias en las tablas
Select a.deptno, b.deptno.deptno, a.dname as "Nombre Departamento", b.ename as "Nombre Empleado", b.job "Trabajo"
  from dept a, emp b
  where (a.deptno = b.deptno);
  
  
--ANSI 99
-- Mismo nombre de columna en las dos tablas
Select dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept natural JOIN emp;

-- distinto nombre de columna en las tablas  
Select dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept JOIN emp using (deptno, deptno);
  
-- La relación se establece de forma manual
Select dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept a JOIN emp b ON (a.deptno = b.deptno);
  
--OUTER JOIN SQL99
--FULL
Select dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept a 
    FULL OUTER JOIN emp b ON (a.deptno = b.deptno);

--LEFT
Select dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept a 
    LEFT OUTER JOIN emp b ON (a.deptno = b.deptno);
    
--RIGTH
Select dname as "Nombre Departamento", ename as "Nombre Empleado", job "Trabajo"
  from dept a 
    RIGHT OUTER JOIN emp b ON (a.deptno = b.deptno);
 
                                          
  
