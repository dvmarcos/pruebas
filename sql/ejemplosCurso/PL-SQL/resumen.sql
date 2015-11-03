
/** **/
SET serveroutput ON

DECLARE
empleado emp.ename %type;

BEGIN
select ename into empleado
from emp where comm = 300;

dbms_output.put_line('nombre: '||empleado);

END;

SET serveroutput ON

DECLARE
N1 Number;       
N3 Number :=21;
N2 Number(7,2) not null :=0;
num constant varchar2(40) := 'hola';

BEGIN
dbms_output.put_line('prueba');

END;

select * from emp;
select * from dept;

/** coger elementos de bbdd **/


/** into para asignar valor de retorno de la select a variable plsql
|| concatenación

El resultado de la select debe ser una única fila pq oracle no sabe decidir
**/
SET serveroutput ON
DECLARE
salario Number; /* trabajo emp.job %type; //obtener mismo tipo definido que en la tabla*/
trabajo varchar2(20);

BEGIN
select sal,job into salario,trabajo 
from emp where ename= UPPER('KING') ;
dbms_output.put_line('salario de king: '||salario);
dbms_output.put_line('trabajo de king: '||trabajo);
END;


/* rowtype - variable de tipo estructura tantos campos como aparece en la table*/


DECLARE

completo emp %rowtype;

BEGIN
select max(sal) into maxsalar
from emp;
select * into completo 
from emp where sal= maxsalar;

dbms_output.put_line(completo.ename||' '|| (completo.sal+250) );

END;






/** Ejemplo if **/
SET serveroutput ON

DECLARE
salario emp.sal %type;
comision Number;
resultado number;
completo emp %rowtype;

BEGIN

update emp
set sal= sal+(sal*0.15)
where comm>300;
resultado := SQL%ROWCOUNT;
if resultado>3 then rollback;
else dbms_output.put_line('resultado de la operación:' ||resultado);
end if;

END;

/** registro**/
DECLARE
TYPE REG1 IS RECORD(
V1 number,
V2 varchar2(40));

VAR1 REG1;
VAR1.V2='HOLA';
VAR1.V1=14;

/**Tabla indexada**/

SET serveroutput ON

DECLARE
TYPE TIPO_TABLAI IS TABLE OF NUMBER
INDEX BY BINARY_INTEGER;

VAR1 TIPO_TABLAI;
primero NUMBER;
BEGIN
VAR1(14):=20;
VAR1(-7):=12;
primero:=VAR1.FIRST;

dbms_output.put_line('NÚMERO DE ELEMENTOS '||VAR1.COUNT);
dbms_output.put_line('PRIMERO ' ||primero);
dbms_output.put_line('SIGUIENTE ' ||VAR1.NEXT(primero));
END;


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

/*EJERCICIOS ESTRUCTURAS DE CONTROL*/

/*EJERCICIO Nº1  */

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

/*EJERCICIO Nº3  */


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








/** EJERCICIOS REGISTROS y TABLAS **/


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


/*EJERCICIO Nº2*/


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
EJERCICIO Nº3 RESUMIDO */
declare
type tabla_registros is table of number(7,2) index by binary_integer;
tabla_1 tabla_registros;
tabla_2 tabla_registros;
tabla_3 tabla_registros
begin
select max(sal)/12 into tabla_1(1)  from emp;
select min(sal)/12 into tabla_1(2) from emp;

select max(sal)/14 into tabla_2(1) from emp;
select min(sal)/14 into tabla_2(2) from emp;

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


/*Ejemplo Tabla anidada*/


declare
type tipoRegistro is record (
c1 number,
c2 varchar2(200));

type TipoTablaAnidada is table of tipoRegistro;

vRegistro tiporegistro;
vAnidada tipoTablaAnidada;

begin

vAnidada:=tipoTablaAnidada();

vAnidada.extend(2);

select max(sal) into vRegistro.c1
from emp;

select ename into vRegistro.c2
from emp
where sal = vRegistro.c1;

vAnidada(1):=Vregistro;

select min(sal) into vRegistro.c1
from emp;
select ename into vRegistro.c2
from emp
where sal = vRegistro.c1;

vAnidada(2):=Vregistro;
dbms_output.put_line(vAnidada(1).c1||'  '||vAnidada(1).c2);
dbms_output.put_line(vAnidada(2).c1||'  '||vAnidada(2).c2);
end;


/






























