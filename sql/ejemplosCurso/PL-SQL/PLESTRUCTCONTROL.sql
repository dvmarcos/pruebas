/*EJERCICIOS ESTRUCTURAS DE CONTROL*/

/*EJERCICIO N�1  

Actualizar los vendedores con una comisi�n mayor que 350$ con un incremento del 15% de su salario. 
Si la operaci�n afecta a m�s de tres empleados, deshacer la transacci�n, en cualquier otro caso validar la transacci�n. 
Introducir en la tabla temp (Tabla con dos columnas: una num�rica y otra de caracteres) la operaci�n que se ha realizado.

*/

SET serveroutput ON

CREATE TABLE temp (
Codigo NUMBER(6),
Mensaje VARCHAR2(80));

DECLARE
    suben	NUMBER(2);
BEGIN
    UPDATE emp
      SET sal=sal*1.15
      WHERE job = 'SALESMAN' AND NVL(comm,0) > 350;
    suben := SQL%ROWCOUNT;
    IF suben > 3
      THEN
	ROLLBACK;
	INSERT INTO temp
	  VALUES (0,'Excedido el n�mero de empleados a actualizar');
	COMMIT;
    ELSE
	INSERT INTO temp
	  VALUES (1,' Actualizados '|| suben ||' empleados');
	COMMIT;
    END IF;
END;
/


/*EJERCICIO N�2

Actualizar el trabajo de un empleado a director a todos los trabajadores cuyo salario sea mayor que 2000$.
Almacenar el n�mero de empleados actualizados por la operaci�n en temp. 
Si los afectados son m�s de cinco personas, borrar los empleados cuyo salario sea mayor de 3000$, 
si los afectados son m�s de tres personas, deshacer la transacci�n de cualquier cambio. 
En cualquier otro caso validar la transacci�n.

*/
DECLARE
    afectados NUMBER(3) := 0;
BEGIN
    UPDATE emp
      SET job ='MANAGER'
      WHERE sal > 2000;
    afectados := sql%ROWCOUNT;
    IF afectados < 3
      THEN
        INSERT INTO temp 
          VALUES (afectados, ' empleados actualizados');
      ELSIF
        afectados < 5
        THEN
          ROLLBACK;  
          INSERT INTO temp 
            VALUES (afectados, ' personas afectadas, SE HIZO ROLLBACK');
        ELSE
          ROLLBACK;  
          DELETE FROM emp
            WHERE sal > 3000;
          INSERT INTO temp 
            VALUES (afectados, ' personas afectadas, se hizo DELETE');
    END IF;
    COMMIT; 
END;
/

/*Si da problemas al borrar por las restricciones -> 
alter table emp drop constraint EMP_SELFT_KEY*/


/*EJERCICIO N�3
Insertar 10 o m�s filas en la tabla temp, 
donde en la primera columna se insertar� un �ndice de n�mero secuencial (1,2,3...) 
y en la columna de tipo texto, un comentario indicando si el n�mero generado es par o impar.
*/

SET serveroutput ON

DECLARE
    literal temp.mensaje%TYPE;
BEGIN
    FOR i IN 1..10
      LOOP
        IF MOD(i,2) = 0
          THEN
            literal := 'El n�mero generado es par';     
          ELSE
            literal := 'El n�mero generado es impar';
        END IF;
        INSERT INTO temp
          VALUES (i, literal);
      END LOOP;
    COMMIT;   
END;
/