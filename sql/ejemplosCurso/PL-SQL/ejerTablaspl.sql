
-- ejercicio 1 --
SET serveroutput ON

DECLARE
TYPE TABLAI_NUMEROS IS TABLE OF NUMBER
INDEX BY BINARY_INTEGER;

VAR1 TABLAI_NUMEROS;
posicion NUMBER;
BEGIN

 FOR i IN 1..7
  LOOP
  VAR1(i):=i*10;
  END LOOP;
 
 FOR p IN 1..7
 LOOP
 dbms_output.put_line('VALOR TABLA POSICIÓN'||p||' ES '|| VAR1(p));
 END LOOP;
 
END;

---ejercicio 2 ---

SET serveroutput ON

DECLARE
TYPE REGISTRO IS RECORD(
NOMBRE varchar2(20),
DNI varchar2(40));

VARREG REGISTRO;

TYPE TABLAI_NOMBRES IS TABLE OF REGISTRO
INDEX BY BINARY_INTEGER;

NOMBRES TABLAI_NOMBRES;


BEGIN
VARREG.NOMBRE:='PEPE';
VARREG.DNI:='OOOOOOO';
NOMBRES(1):=VARREG;
VARREG.NOMBRE:='LUCAS';
VARREG.DNI:='OOOOOO212';
NOMBRES(2):=VARREG;

 FOR p IN 1..2
 LOOP
 dbms_output.put_line('VALORES TABLA POSICIÓN '||p||' : '|| 
 NOMBRES(p).NOMBRE ||' '|| NOMBRES(p).DNI);
 END LOOP;
 
END;


/***************** soluciones profesor ***********************/


/*EJERCICIOS REGISTROS y TABLAS

EJERCICIO Nº1  

Crear un bloque PL/SQL que cree una tabla indexada de números, 
rellenando las 7 primeras posiciones con 10 veces el valor de la posición que ocupe.
El bloque PL/SQL deberá también mostrar los resultados de la tabla indexada.
*/
declare
type tabla_numeros is table of number index by binary_integer;
t1 tabla_numeros;
begin
for a in 1..7
loop
   t1(a):=a*10;
end loop;
for a in 1..7
loop
  dbms_output.put_line(t1(a));
end loop;
end;
/


/*EJERCICIO Nº2

Crear una tabla indexada cuyo elementos sean variables de tipo registro con 2 campos por registro 
(nombre, dni). El bloque PL/SQL deberá rellenar manualmente 3 posiciones y mostrar el contenido de la 
tabla indexada.*/

declare
type registro_mio is record
(
nombre varchar2(20),
dni varchar2(10)
);
type tabla_registros is table of registro_mio index by binary_integer;
t1 tabla_registros;
begin
for a in 1..3
loop
  t1(a).nombre:='nombre'||a;
  t1(a).dni:='dni'||a;
end loop;
for a in 1..3
loop
  dbms_output.put_line(t1(a).nombre);
  dbms_output.put_line(t1(a).dni);
end loop;
end;
/

/*
EJERCICIO Nº3

Crear 3 tablas indexadas llamadas Tabla_1, Tabla_2, Tabla_3. 
En Tabla_1 deberemos introducir un elemento con el siguiente valor:
Salario mensual máximo de los empleados de la tabla EMP, suponiendo que disponemos de 12 pagas a lo largo del año.
Salario mensual mínimo de los empleados de la tabla EMP, suponiendo que disponemos de 12 pagas a lo largo del año.
Salario mensual medio de los empleados de la tabla EMP, suponiendo que disponemos de 12 pagas a lo largo del año.

En Tabla_2 deberemos introducir un elemento con el siguiente valor:
Salario mensual máximo de los empleados de la tabla EMP, suponiendo que disponemos de 14 pagas a lo largo del año.
Salario mensual mínimo de los empleados de la tabla EMP, suponiendo que disponemos de 14 pagas a lo largo del año.
Salario mensual medio de los empleados de la tabla EMP, suponiendo que disponemos de 14 pagas a lo largo del año.

En Tabla_3, deberemos introducir la diferencia existente entre cada elemento de la tabla_1 y Tabla_2.

Mostrar los resultados finales de la tabla 3.
*/
declare
type tabla_registros is table of number(7,2) index by binary_integer;
tabla_1 tabla_registros;
tabla_2 tabla_registros;
tabla_3 tabla_registros;
begin
select max(sal)/12 into tabla_1(1)  from emp;
select min(sal)/12 into tabla_1(2) from emp;
select AVG(sal)/12 into tabla_1(3) from emp;

select max(sal)/14 into tabla_2(1) from emp;
select min(sal)/14 into tabla_2(2) from emp;
select AVG(sal)/14 into tabla_2(3) from emp;

for a in 1..3
loop
  tabla_3(a):=tabla_1(a)-tabla_2(a);
end loop;

for a in 1..3
loop
  dbms_output.put_line(tabla_1(a)||'   '||tabla_2(a)||'     '||tabla_3(a));
end loop;
end;
/

/*
EJERCICIO Nº4

Crear un bloque PL/SQL anónimo que introduzca 3 elementos en una tabla indexada llamada Tabla_resumen; 
El primer elemento será el empleado mas antiguo en la empresa.
El segundo elemento será el empleado más joven en la empresa.
El tercer elemento será el empleado con mejor comisión de toda la empres

Mostrar los elementos de la Tabla_resumen ( empno, ename, hiredate, comm);


NOTA: La Tabla_resumen, sus elementos tienen la misma estructura que un registro de la tabla EMP.
*/
declare
 type tabla_registros is table of emp%rowtype index by binary_integer;
 tabla_resumen tabla_registros;

begin
 select * into tabla_resumen(1)
 from emp
 where hiredate=(select min(hiredate) from emp);

 select * into tabla_resumen(2)
 from emp
 where hiredate=(select max(hiredate) from emp);

 select * into tabla_resumen(3)
 from emp
 where comm=(select max(comm) from emp);

 for a in 1..3
 loop
dbms_output.put_line(tabla_resumen(a).empno||'  '||tabla_resumen(a).ename||'  '||tabla_resumen(a).hiredate||'  '||tabla_resumen(a).comm);
 end loop;
 end;
/













