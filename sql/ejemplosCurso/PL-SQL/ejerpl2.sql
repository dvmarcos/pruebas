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

rollback;




