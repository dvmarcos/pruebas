--1--
CREATE TABLE vendedores 
( Empno NUMBER (4), Sal NUMBER (7,2), Comm NUMBER(7,2));

SET serveroutput ON
DECLARE
cursor c1 is
select empno,sal,comm from emp
where comm is not null;
BEGIN

for a in c1
loop
insert into vendedores 
values(a.empno,a.sal,a.comm);
end loop;
end;

--2--

CREATE TABLE mas_pagados( ename VARCHAR2(15), sal NUMBER(9));

SET serveroutput ON
DECLARE
cursor c2 is
select ename,sal from emp order by sal desc;
BEGIN

for a in c2
loop
  if (c2%rowcount >5) then
  exit;
  end if;
insert into mas_pagados
values(a.ename,a.sal);

end loop;
end;

--3--

SET serveroutput ON
DECLARE
ganancias_totales emp.salar %type;
comision emp.comm %type;
cursor c3 is
select sal,comm from emp where deptno='30';
BEGIN
ganancias_toales :=0;
for a in c3
loop
comision :=a.comm;
ganancias_totales:= ganancias_totales+a.sal+a.comm;
end loop;
dbms_output.put_line('ganancias totales: ' ||ganancias_totales);
end;


