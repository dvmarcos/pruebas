create or replace package pk1 as 
e1 exception;
cursor c1 is select * from emp;
procedure imprimir1 (v1 emp%rowtype);
end pk1;
/

create or replace package body pk1 as
  procedure imprimir1(v1 emp%rowtype)  is
  begin
  dbms_output.put('procedimiento de paquete pk1');
  dbms_output.put(lpad(v1.ename,10));
  dbms_output.put(lpad(nvl(v1.comm,0),10));
  dbms_output.put_line(lpad(v1.sal,10));
  
  end imprimir1; 
end pk1;
/


SET serveroutput ON;
begin 
for a in pk1.c1
loop
pk1.imprimir1(a);
end loop;
end;
/

select * from user_errors;