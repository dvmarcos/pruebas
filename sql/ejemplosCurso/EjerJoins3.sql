--EJERCICIOS (DQL con JOIN’s)

/*
1.- Obtener un listado de todos los empleados (nombre y apellidos) que
    ganan más de 200000 pts al mes y que entraron en la compañia después
    del 1 de Enero de 1975. Tambien se quiere información correspondiente
    a su código de trabajo.
    */

	select nombre, apellido, codtra, salar/12
    from templa
    where (salar/12 > 200000) and (feching > '01-01-1975');


/*
2.- Obtener el nombre, apellido y fecha de ingreso de los directores de
    departamento ordenados por número de personal.
*/

	Select nombre, apellido, feching
    from templa, tdepta
    where nuempl = numdirec
    order by nuempl;

	Select nombre, apellido, feching
    from templa join tdepta 
        on (nuempl = numdirec)
    order by nuempl;

/*
3.- Seleccionar parejas de empleado (de sexo opuesto) que hayan nacido el 
    mismo dia (con información acerca de apellidos y fecha de nacimiento).
*/

	Select t1.nombre, t1.apellido, t1.fechnac, t1.sexo
 	from templa t1, templa t2
 	where t1.fechnac=t2.fechnac and t1.sexo<>t2.sexo;
  
--Join sql99
Select t1.nombre
     , t1.apellido
     , t1.fechnac
     , t1.sexo
     , t2.nombre
     , t2.apellido
     , t2.fechnac
     , t2.sexo
 	from templa t1 
    join templa t2 on ((t1.fechnac=t2.fechnac) and (t1.sexo<>t2.sexo))
  where t1.sexo = 'M';
    
-- con dos tablas
SELECT fechnac, t1.nombre, t1.apellido, t2.nombre, t2.Apellido
  from templa t1 
    join templa t2 USING (fechnac)
  where t1.sexo = 'M' and t2.sexo = 'H';
