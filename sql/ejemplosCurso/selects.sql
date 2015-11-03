select * from templa where salar between 1500000 and 4000000;
select distinct salar from templa;
select * from templa order by dept, nuempl;
select salar,codtra from templa where codtra like '6%';
select nombre,apellido,feching from templa where dept='E11';
select nuempl,nombre,apellido,tlfn from templa where (dept like 'D%' or dept like 'E%') and sexo ='M';
select apellido,dept,salar/12 "salario mensual" from templa where dept ='A00' or  dept='B01' or dept ='C01' or dept='D01' order by dept, salar desc;
-- otra opcion 
select apellido,dept,salar/12 "salario mensual" from templa where dept  in ('A00', 'B01','C01','D01') order by dept,salar desc;

select * from templa where (dept ='D11' or dept ='E11') and (apellido like 'S%');
--otra forma
select * from templa where dept in ('D11','E11') and (apellido like 'S%');
select * from templa where dept = any ('D11','E11') and (apellido like 'S%');


   
-- departamento con mayor numero de empleados--
SELECT dname
  from dept
  where deptno in (Select deptno
                      From emp
                      Group by deptno
                      having count(*) = (Select max(count(*))
                                          from emp
                                          group by deptno));