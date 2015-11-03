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
salario Number;
trabajo varchar2(20);

BEGIN
select sal,job into salario,trabajo 
from emp where ename= UPPER('KING') ;
dbms_output.put_line('salario de king: '||salario);
dbms_output.put_line('trabajo de king: '||trabajo);
END;

SET serveroutput ON
DECLARE
salario Number;
trabajo emp.job %type; /*obtener mismo tipo definido que en la tabla*/

BEGIN
select sal,job into salario,trabajo 
from emp where ename= UPPER('KING') ;
dbms_output.put_line('salario de king: '||salario);
dbms_output.put_line('trabajo de king: '||trabajo);
END;

desc emp;



SET serveroutput ON

DECLARE
maxsalar Number;
nombre emp.ename %type;
salario emp.sal %type;
departamento emp.deptno %type;

BEGIN
select max(sal) into maxsalar
from emp;
select ename,sal,deptno into nombre,salario,departamento 
from emp where sal= maxsalar;

dbms_output.put_line('maximo salario: '||maxsalar);
dbms_output.put_line('nombre: '||nombre);
dbms_output.put_line('departamento: '||departamento);
END;

/* rowtype - variable de tipo estructura tantos campos como aparece en la table*/

SET serveroutput ON

DECLARE
maxsalar Number;
nombre emp.ename %type;
salario emp.sal %type;
departamento emp.deptno %type;
completo emp %rowtype;

BEGIN
select max(sal) into maxsalar
from emp;
select * into completo 
from emp where sal= maxsalar;

dbms_output.put_line(completo.ename||' '|| (completo.sal+250) );

END;








