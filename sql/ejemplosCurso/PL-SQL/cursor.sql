SET serveroutput ON

DECLARE
V1 emp.ename %type;
cursor c1 is
select ename from emp;
BEGIN
open c1;
fetch c1 into V1;
while (c1%FOUND)
loop
dbms_output.put_line(V1);
fetch c1 into V1;
end loop;
close c1;
end;

/*
variables de aclopamiento*/

SET serveroutput ON

DECLARE
nombre emp.ename %type;
salario emp.sal %type;
comision emp.comm %type;
cursor c2 (nombre emp.ename %type,salario emp.sal %type,comision emp.comm %type) is
select ename,sal,comm from emp;
BEGIN
open c2(nombre,salario,comision);
fetch c2 into nombre,salario,comision;
while (c2%FOUND)
loop
dbms_output.put_line(nombre ||salario ||comision);
fetch c2 into nombre,salario,comision;
end loop;
close c2;
end;

/** bucles sobre cursores **/
SET serveroutput ON

DECLARE
cursor c3 is
select ename,sal,comm from emp;
BEGIN
for a in c3
loop
dbms_output.put_line(a.ename||a.sal||a.comm);
end loop;
end;

/* returning*/

SET serveroutput ON

DECLARE
vsalario emp.sal %type;

BEGIN
update emp set sal=sal*1.2
where ename=upper('king')
returning sal into vsalario;
dbms_output.put_line(vsalario);

end;







