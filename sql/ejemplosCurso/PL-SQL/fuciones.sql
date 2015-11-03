SET serveroutput ON

declare
valor number;
begin
valor:=contarTablas();
dbms_output.put_line(valor);
end;
/

Create or replace function contarTablas return number  is
total number;
begin
select count(table_name) into total
from user_tables;
 return total;
end;
/

/** llamada a función desde SQL **/
select contarTablas from dual;

/** tambien podria ir dentro de un select,having,... where p.e where contarTablas>14;**/


select * from user_source;
select * from user_errors;
select * from user_object_size;
