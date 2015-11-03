rollback;
--1---
SET serveroutput ON

DECLARE
num_empleado emp.empno %type;
BEGIN
num_empleado:=&numemp;
  UPDATE emp 
      SET sal = sal*1.1
      where empno =num_empleado;

EXCEPTION  
WHEN NO_DATA_FOUND THEN 
dbms_output.put_line('EXCEPCION CAPTURADA DE NO_DATA_FOUND');
WHEN TOO_MANY_ROWS THEN 
dbms_output.put_line('EXCEPCION CAPTURADA DE TOO MANY ROWS');
WHEN OTHERS THEN 
dbms_output.put_line('EXCEPCION GENÉRICA');
END;