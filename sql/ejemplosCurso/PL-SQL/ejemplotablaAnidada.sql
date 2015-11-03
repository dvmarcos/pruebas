SET serveroutput ON
declare
type tipoRegistro is record (
c1 number,
c2 varchar2(200));

type TipoTablaAnidada is table of tipoRegistro;

vRegistro tiporegistro;
vAnidada tipoTablaAnidada;

begin

vAnidada:=tipoTablaAnidada();

vAnidada.extend(2);

select max(sal) into vRegistro.c1
from emp;

select ename into vRegistro.c2
from emp
where sal = vRegistro.c1;

vAnidada(1):=Vregistro;

select min(sal) into vRegistro.c1
from emp;
select ename into vRegistro.c2
from emp
where sal = vRegistro.c1;

vAnidada(2):=Vregistro;
dbms_output.put_line(vAnidada(1).c1||'  '||vAnidada(1).c2);
dbms_output.put_line(vAnidada(2).c1||'  '||vAnidada(2).c2);
end;
/

select * from global;