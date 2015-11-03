SET serveroutput ON
declare

type TIPO_TABLA is table of number(7,2);

tablaAnidada TIPO_TABLA;


begin

tablaAnidada:=tipo_tabla();
tablaAnidada.extend(3);
select max(sal) into tablaAnidada(1)
from emp;

select min(sal) into tablaAnidada(2)
from emp;
select avg(sal) into tablaAnidada(3)
from emp;

FOR p IN tablaAnidada.first..tablaAnidada.count
 LOOP
 dbms_output.put_line('VALORES TABLA POSICIÓN '||p||' : '|| tablaAnidada(p));
 END LOOP;
 
end;
/