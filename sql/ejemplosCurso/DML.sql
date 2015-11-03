
--INSERT--

INSERT INTO DEPT (deptno) values (50);
insert into dept (deptno, dname, loc) values (60,'INFORMÁTICA','MADRID');
insert into dept
  values( 60,'Informática', 'Madrid');


--UPDATE--
update dept 
set dname='FORMACIÓN',loc='ÁVILA' 
where deptno=50;

update dept 
set loc='SORIA' 
where deptno in (50,60);

--DELETE--

delete from dept where deptno in(50,60);

delete from dept
  where upper(dname) like 'INFORM_TIC_'; 


--------EJERCICIOS DML------------

--1--
insert into templa (nuempl, nombre, inicial,apellido,dept, salar, fechnac) 
values ('000272','LUIS',' ', 'PERNAS','D21','838500','20-07-64');
insert into templa (nuempl, nombre, inicial,apellido,dept, salar, fechnac) 
values ('000273','ELISA',' ', 'JORDAN','D21','838500','11-10-69');

select * from templa where apellido IN ('PERNAS', 'JORDAN');

--2--

  update templabk
	set salar = salar + ((salar*7/12)/3), 
  tlfn=null
  where (dept='D21') and (niveduc =15);
	
--3--
Update templabk
  set salar = salar * 1.10
  Where codtra = (
                    Select min(codtra)
                      from templa
                      where (fechnac < '01-06-1954') and
                        (dept like 'D%' or dept like 'E%')
                     
                  )
        and (dept = 'E11')
  ;
  
  
--4--
delete
	from templabk
	where fechnac < '01-06-1954' and
		dept='E11' and sexo='M';
--5--

merge into templabk t1
	using templabk t2
	on (t1.nuempl=t2.nuempl)
	when matched then
 	update set salar=(select MAX(salar)/COUNT(salar) 
                      from templabk 
                      where dept=t1.dept);

 	update templa t1
    set salar= (select MAX(salar)/COUNT(salar) 
                      from templa t2 
                      where t2.dept=t1.dept);
--6--

select distinct numdep from tdepta 
minus 
select distinct dept from templa;

delete tdepta
    where numdep IN(select distinct numdep
                      from tdepta
                    minus
                    select distinct dept
                      from templa);

select * from tdepta
    where numdep NOT IN(select distinct dept
                      from templa);
                      
 delete tdepta where numdept NOT IN(select distinct dept
                      from templa);                    
                      
                      
--7--

	insert into TDEPTA 
    values ('J01','IDIOMA', (Select nuempl 
                                from templa 
                                where nombre='JAVIER' 
                                  and apellido='GIL');

--8--


merge into templa t1
    using templa t2
      on (t1.nuempl=t2.nuempl)
    when matched then
      update set inicial=substr(t2.nombre,1,1);

update templa t1
  set inicial = (select substr(nombre,1,1)
                  from templa t2
                  where t2.nuempl = t1.nuempl);
                  
 --9--
 
 	update templabk 
    set deptno = (select dept 
                    from templabk 
                    where codtra='53' 
                    group by dept 
                    having count (*)	= 
                      (select max(count(*)) 
                        from templabk 
                        where codtra='53' 
                        group by dept)
                  ) 
	where apellido like 'GIL';
  

                        
                    
                     
