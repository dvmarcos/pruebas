
/**ejercicio 1 **/
SET serveroutput ON

DECLARE
empleado emp.ename %type;

BEGIN
select ename into empleado
from emp where comm = 300;

dbms_output.put_line('nombre: '||empleado);

END;

/* ejecicio 2*/

SET serveroutput ON

DECLARE
completo emp %rowtype;

BEGIN
select * into completo from emp
where sal >(select avg(sal) from emp) and ename='KING';

dbms_output.put_line('nombre: '||completo.ename);

END;




SET serveroutput ON

BEGIN
update emp set sal=sal *1.2;

  dbms_output.put_line(sql%rowcount);
END;
rollback;