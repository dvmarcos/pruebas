/*EJERCICIOS ESTRUCTURAS DE CONTROL*/

/*EJERCICIO Nº1  

Actualizar los vendedores con una comisión mayor que 350$ con un incremento del 15% de su salario. 
Si la operación afecta a más de tres empleados, deshacer la transacción, en cualquier otro caso validar la transacción. 
Introducir en la tabla temp (Tabla con dos columnas: una numérica y otra de caracteres) la operación que se ha realizado.

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
	  VALUES (0,'Excedido el número de empleados a actualizar');
	COMMIT;
    ELSE
	INSERT INTO temp
	  VALUES (1,' Actualizados '|| suben ||' empleados');
	COMMIT;
    END IF;
END;
/


/*EJERCICIO Nº2

Actualizar el trabajo de un empleado a director a todos los trabajadores cuyo salario sea mayor que 2000$.
Almacenar el número de empleados actualizados por la operación en temp. 
Si los afectados son más de cinco personas, borrar los empleados cuyo salario sea mayor de 3000$, 
si los afectados son más de tres personas, deshacer la transacción de cualquier cambio. 
En cualquier otro caso validar la transacción.

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


/*EJERCICIO Nº3
Insertar 10 o más filas en la tabla temp, 
donde en la primera columna se insertará un índice de número secuencial (1,2,3...) 
y en la columna de tipo texto, un comentario indicando si el número generado es par o impar.
*/

SET serveroutput ON

DECLARE
    literal temp.mensaje%TYPE;
BEGIN
    FOR i IN 1..10
      LOOP
        IF MOD(i,2) = 0
          THEN
            literal := 'El número generado es par';     
          ELSE
            literal := 'El número generado es impar';
        END IF;
        INSERT INTO temp
          VALUES (i, literal);
      END LOOP;
    COMMIT;   
END;
/