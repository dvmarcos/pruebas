/** SUBPROGRAMAS I **/
--1--
SET serveroutput ON
CREATE TABLE tabla_long( nombre VARCHAR2(20), fecha date);

Create or replace procedure quien_ejecuta(nombre tabla_long.nombre%type)  is
begin
insert into tabla_long 
values(nombre,sysdate);
end;
/


DECLARE
 nombre tabla_long.nombre %TYPE;  
BEGIN
nombre:= '&nombre';
quien_ejecuta(nombre);
end;

--2--

SET serveroutput ON

Create or replace procedure actualizar_salario(nombre varchar, aumento number)  is
begin
update emp
set sal=sal * ( 1+(aumento/100))
where ename=nombre;
quien_ejecuta(nombre);
end;
/


DECLARE
 nombre tabla_long.nombre %TYPE;
 aumento number;  
BEGIN
nombre:= '&nombre';
aumento:=&aumento;
actualizar_salario(nombre,aumento);
end;


select * from user_errors;


