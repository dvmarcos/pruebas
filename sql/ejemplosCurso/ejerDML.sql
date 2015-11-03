-- Ejercicio 1
/*
Al departamento D21 se le han asignado dos nuevos empleados, con motivo
de la iniciaci�n de un nuevo proyecto. Los �nicos datos disponibles de ellos
son:
EMPLEADO  NOMBRE          SALARIO   F.NACIMIENTO
000272    LUIS PERNAS      838500     1964-07-20
000273    ELISA JORDAN    1874000     1969-10-11
A�ada los registros de estos empleados a la tabla.
*/
INSERT 
  into templa (nuempl, nombre, inicial, apellido, salar, fechnac, dept) 
Values ('000272', 'LUIS', 'L', 'PERNAS', 838500, '20/7/1965', 'D21');

INSERT into templa (nuempl, nombre, inicial, apellido, salar, fechnac, dept) 
Values ('000273', 'ELISA', 'R', 'JORDAN', 1874000, '11/10/1969', 'D21');


/*Ejercicio 2
En el departamento de Administraci�n de Sistemas D21, se han establecido unos
nuevos programas de formaci�n en el cual est�n involucrados todos los
empleados de este departamento con un nivel de educaci�n = 15.

Estos empleados van a asistir a un periodo de formaci�n en otro departamento
en los pr�ximos 7 meses, durante los cuales sus salarios van a ser superiores
a los normales (actuales) en una tercera parte y de momento no tienen n�mero de
tel�fono asignado.

Realice las acciones para llevar a cabo las operaciones anteriores
*/

Update templa
  set salar = salar + ((salar*7/12)/3),
      tlfn = null
  where (dept = 'D21') and (niveduc = 15);

SELECT * from templa
  Where dept = 'D21';
  

/*EJERCICIO 3
De los resultados del ejercicio 5 (de funciones de grupo) puede ver que las
mujeres del departamento E11 tienen el m�s bajo factor del c�digo de trabajo.
Por lo tanto incremente el salario de estas personas en un 10%.
*/
Update templa
  set salar = salar * 1.10
  Where codtra = (
                    Select min(codtra)
                      from templa
                      where (fechnac < '01-06-1954') and
                        (dept like 'D%' or dept like 'E%')
                     
                  )
        and (dept = 'E11')
  ;

/* Ejercicio 4  
En vista de lo elevado de sus salarios, elim�nenlas de la tabla de empleados.

*/
delete from templa
Where codtra = (
                  Select min(codtra)
                    from templa
                    where fechnac < '01-06-1954' and
                      (dept like 'D%' or dept like 'E%')
                   
                )
      and (dept = 'E11')
  ;
  
/*
5.- Modificar el salario de los empleados con un valor igual al obtenido al dividir el 
salario maximo de su departamento por el n�mero de empleados del departamento).
*/
	merge into templa t1
	using templa t2
	on (t1.nuempl=t2.nuempl)
	when matched then
 	update set salar=(select MAX(salar)/COUNT(salar) 
                      from templa 
                      where dept=t1.dept);

 	update templa t1
    set salar= (select MAX(salar)/COUNT(salar) 
                      from templa t2 
                      where t2.dept=t1.dept);
                      
/*
  6.- Eliminar los departamentos que no tengan personal asignado.
*/
	delete tdepta
    where numdep IN(select distinct numdep
                      from tdepta
                    minus
                    select distinct dept
                      from templa);
	
/*
7.- A�adir un nuevo departamento en la empresa cuyo codigo sea 'J01' llamado 'IDIOMA',y que su
director sea 'JAVIER GIL'.
*/
	insert into TDEPTA 
    values ('J01','IDIOMA', (Select nuempl 
                                from templa 
                                where nombre='JAVIER' 
                                  and apellido='GIL');

/*
8.- Comprobar que todos los empleados tienen su inicial correctamenta. Modificarla sino es correcta.
*/
	merge into templa t1
    using templa t2
      on (t1.nuempl=t2.nuempl)
    when matched then
      update set inicial=substr(t2.nombre,1,1);

update templa t1
  set inicial = (select substr(nombre,1,1)
                  from templa t2
                  where t2.nuempl = t1.nuempl);
/*
9.- Modificar el n�mero de departamento de 'GIL'. 
El nuevo departamento ser� el departamento donde hay m�s 
empleados cuyo codigo de trabajo es 53.  
*/
	update templa 
    set dept = (select dept 
                    from templa 
                    where codtra='53' 
                    group by dept 
                    having count (*)	= 
                      (select max(count(*)) 
                        from templa 
                        where codtra='53' 
                        group by dept)
                  ) 
	where apellido like 'GIL';

