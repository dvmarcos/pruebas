-- Ejercicio 1
SELECT *
  FROM templa
  WHERE (sexo = 'M')
    and (upper(dept) like 'D%' OR lower(dept) like 'e%')
    and (niveduc > (select avg(niveduc) 
                    from templa));
                    
-- Ejercicio 2
Select * 
  from templa
  WHERE (nombre IN (
                    SELECT nombre
                      from templa
                      where dept = 'D21'
                  )
        )AND (codtra not IN(
                  SELECT codtra
                      from templa
                      where dept = 'E21')
              );
              
-- EJERCICIO 3
SELECT *
  from Templa
  WHERE (nuempl not in ( select numdirec
                            from tdepta));
                            
-- EJERCICIO 4
SELECT * 
  from templa
  where dept = ( select dept
                  from templa
                  where upper(nombre) = Upper('Tomas') and
                        upper(apellido) = Upper('Soler'));