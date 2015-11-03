--1--
select * from templa 
where (nombre like 'D%' or nombre like 'E%') and sexo='M' and niveduc> 
(select avg(niveduc)from templa) order by nuempl;

--2--

select * from templa a 
where (a.nombre in (select nombre from templa where dept ='D21')) and
(a.codtra not in(select codtra from templa  where dept ='E21'));

--3--

select * from templa
where  nuempl not in(select numdirec from tdepta);

--4--
select * from templa
where dept in (select dept from templa 
where upper(nombre)= upper('Tomas') and upper(apellido)= upper('Soler'));

select * from templa
where dept =any (select dept from templa 
where upper(nombre)= upper('Tomas') and upper(apellido)= upper('Soler'));

