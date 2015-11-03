SET serveroutput ON

DECLARE
a emp.ename %type;

BEGIN
select ename into a from emp;
EXCEPTION  WHEN TOO_MANY_ROWS THEN 
dbms_output.put_line('EXCEPCION CAPTURADA DE TOO MANY ROWS');
END;
 
 
SET serveroutput ON

DECLARE
a emp.ename %type;
BEGIN
select ename into a from emp where ename =upper('pepe');
EXCEPTION  WHEN NO_DATA_FOUND THEN 
dbms_output.put_line('EXCEPCIÓN: NOMBRE NO ENCONTRADO');
END;