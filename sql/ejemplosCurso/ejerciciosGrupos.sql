-- Soluciones de los ejercicios de grupos
/*
1.- Calcular el n�mero de empleados que hay en cada uno de los 
    departamentos.
*/	
	Select dept, count(nuempl)
    from templa
    group by dept;

--Ordenada por departamento
	Select dept, count(nuempl)
    from templa
    group by dept
    having dept like '%0%' 
    order by dept;
  
/*
2.- Se pide una lista que recupere el salario medio de cada
    departamento junto con el n�mero de empleados que tiene. El resultado
    no debe incluir empleados que tengan un c�digo de trabajo mayor que 54,
    ni departamentos con menos de tres empleados. Se quiere ordenada por
    n�mero de departamento.
    */

	Select avg(salar), dept, count(dept)
	from templa
	where codtra <= 54
	group by dept
	having count(dept) >= 3
	order by dept;

/*
3.- Consiga una lista de los empleados masculinos de los departamentos
    que comiencen por 'D' y 'E', que hayan nacido antes de Junio de 1954.
    La lista, ordenada por fecha de nacimiento, debe contener el n�mero
    de personal y apellido, el codigo de trabajo, el nivel de educaci�n
    y el salario de cada empleado.
*/
-- a�adido la fecha de nacimiento
	Select nuempl, apellido, codtra, niveduc, salar, fechnac
	from templa
	where (sexo = 'H') and
        (fechnac < '01-06-1954') and
        (
          (dept like 'D%')
            or 
          (dept like 'E%')
        )
	order by fechnac;

--ejecuci�n erronea por falta de parentesis
Select nuempl, apellido, codtra, niveduc, salar, fechnac
	from templa
	where sexo = 'H' and
        fechnac < '01-06-1954' and
        dept like 'D%' or dept like 'E%'
 	order by fechnac;

/*
4.- Ahora debemos encontrar una relaci�n entre el c�digo de trabajo y el 
    nivel de educaci�n, as� que, modifique la lista anterior para incluir
    una columna mostrando la diferencia entre el c�digo de trabajo y 3.5 
    veces el nivel de educacion.
*/

	Select nuempl, apellido, codtra, niveduc, salar, (codtra - (3.5 * niveduc)) as relacion
	from templa
	where sexo='H' and
        fechnac < '01-06-1954' and
        (dept like 'D%' or dept like 'E%')
	order by fechnac;


/*
5.- Utilice el mismo criterio de selecci�n que en el ejercicio anterior,
    esta vez para todos los empleados de la compa��a (hombres y mujeres)
    y calcule: el valor m�nimo del c�digo de trabajo, la media del factor
    del c�digo de trabajo, el m�nimo del salario, y del salario dividio 
    por el c�digo de trabajo.
*/

	Select min(codtra), avg(codtra), min(salar), min(salar/codtra)
	from templa
	where fechnac < '01-06-1954' and
		(dept like 'D%' or dept like 'E%')
	order by fechnac;

/*
6.- Obtenga el mismo listado anterior con las siguientes condiciones:

	- Resultados separados para cada departamento y por sexo.
	- S�lo liste los grupos que tengan al menos tres personas.
	- liste tambi�n el n�mero de personas de cada grupo.
	- y el departamento.
*/

	Select dept, count(dept), min(codtra), avg(codtra), min(salar), min(salar/codtra) 
	from templa
	where fechnac < '01-06-1954' and
		(dept like 'D%' or dept like 'E%')
	group by dept, sexo
	having count(dept) >= 3;