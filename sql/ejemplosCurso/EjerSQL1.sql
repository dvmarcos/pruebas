-- EJERCICIOS  ( PRIMERA PARTE I )
-------------------------------
/*
1.- Seleccionar todos los empleados cuyo salario esté comprendido entre
    1500000 y 4000000.
*/
-- version 1
  Select * from templa
    Where salar between 1500000 and 4000000;

-- Version 2
  Select * from templa
    Where (salar >= 1500000) and (salar <= 4000000);

-- 2.- Obtener un listado de todos los sueldos diferentes que hay en la compañia.

  Select distinct Salar
    from templa;
    
    -- con: group by
  Select Salar
    from templa
    group by salar;
    

-- 3.- Obtener una lista con los empleados ordenada por departamento y dentro de él por número de personal.

  Select * from templa
    order by dept, nuempl;

-- 4.- Se pide una lista que recupere el salario de todos los empleados cuyo código de trabajo empiece por 6.

  Select * from templa
    where codtra like '6%';

--5.- Obtener el nombre, apellido y fecha de ingreso de los empleados del departamento E11.

  Select nombre, apellido, feching
    from templa
    where dept='E11';
  
  --Otra forma
  Select nombre, apellido, feching
    from templa
    where dept IN ('E11');

/*
6.- Obtener una lista de todas las empleadas de los departamentos que
    comiencen por 'D' y 'E'. La lista anterior debe contener información 
    sobre el número de personal, nombre, apellido y número de teléfono.
*/

  Select nuempl, nombre, apellido, tlfn
    from templa
    where sexo='M' and 
      ((dept like 'E%') or (dept like 'D%'));

/*
7.- Obtener una lista con el apellido, número de departamento y salario
    mensual de los empleados de los departamentos A00, B01, C01 y D01.
    La salida se quiere en orden descendente de salario dentro de cada 
    departamento.
*/

  Select apellido, dept, salar / 12 "Salario Mes"
    from templa
    where dept in ('A00', 'B01', 'C01', 'D01')
    order by dept, salar DESC;

-- 8.- Seleccionar todos los empleado de los departamentos D11 y E11 cuyo primer apellido empiece por S.

  Select * from templa
    where apellido like 'S%' and (DEPT='D11' or DEPT='E11');

--Otras soluciones
  Select * from templa
    where apellido like 'S%' and (DEPT IN('D11','E11'));

  Select * from templa
    where apellido like 'S%' and (DEPT = ANY('D11','E11'));
