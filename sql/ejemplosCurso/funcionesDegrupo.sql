--1
-- si ponemos count (numempl) puede evitar nulos?
select dept, count(*) from templa group by dept;
--2
select dept, avg(salar), count(*)
from templa  where codtra <=54 group by dept having count(dept) >3 order by dept ;
--3
select nuempl,apellido,codtra,niveduc,salar,fechnac
from templa  where sexo='H' and (dept like 'D%' or dept like 'E%') and fechnac < '01-06-1954'
order by fechnac;
--4
select codtra - 3.5*niveduc , nuempl,apellido,codtra,niveduc,salar
from templa  where sexo='H' and (dept like 'D%' or dept like 'E%') and fechnac < '01-06-1954'
order by fechnac;

--5
select min(codtra) ,avg(codtra),min(salar), min (salar/codtra)
from templa  where (dept like 'D%' or dept like 'E%') and fechnac < '01-06-1954' 
order by fechnac;

--6
select dept, count(dept), min(codtra) ,avg(codtra), min (salar), min (salar/codtra),sexo
from templa  where (dept like 'D%' or dept like 'E%') and fechnac < '01-06-1954' group by dept, sexo
having count(dept) >=3;


