SET serveroutput ON

declare
begin
ntablas;
end;
/

Create or replace procedure ntablas  is
total number;
begin
select count(table_name) into total
from user_tables;
 dbms_output.put_line(total);
end;
/

SET serveroutput ON
declare
aux emp%rowtype;
begin
select * into aux
from emp where ename=upper('king');
imprimir(aux);
sys.imprimir(aux); /*procedimiento del profesor*/
end;
/

Create or replace procedure imprimir(reg emp%rowtype)  is
begin
dbms_output.put(lpad(reg.ename,10));
dbms_output.put(lpad(nvl(reg.comm,0),10));
dbms_output.put_line(lpad(reg.sal,10));

end;
/


SET serveroutput ON
declare
cursor c1 is
select * from emp ;
begin
for aux1 in c1
loop
imprimirTodos(aux1);
end loop;
end;
/

Create or replace procedure imprimirTodos(reg emp%rowtype)  is
begin
dbms_output.put(lpad(reg.ename,10));
dbms_output.put(lpad(nvl(reg.comm,0),10));
dbms_output.put_line(lpad(reg.sal,10));

end;
/


/* se cuenta las tablas del usuario sys(no las nuestras)
cuando el administrador usaauthid current_user se usarían las tablas del propio usuario*/
SET serveroutput ON
declare
begin
sys.ntablas; 
end;
/





