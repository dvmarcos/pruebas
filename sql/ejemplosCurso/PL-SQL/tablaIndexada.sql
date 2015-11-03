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