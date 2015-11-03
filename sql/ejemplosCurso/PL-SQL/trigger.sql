create or replace trigger delete_dept
before delete on dept
begin
insert into temp values(24,'borrado en dept');
end;

select * from user_errors;
select * from dept;

delete dept where deptno=40;

/** Se ejectuan los dos triggers de forrado con la función delete de ejemplo*/
create or replace trigger tri_dept
before insert or delete or update on dept
begin
if inserting then
   insert into temp values(20,'insertar fila');
else
  if updating then
    insert into temp values(21,'actualizar fila');
  else
   insert into temp values(24,'borrar fila');
  end if;
  
end if;

end;


rollback;


select * from  user_triggers;

/** for each row ejecuta la acción del trigger por cada registro borrado*/
create or replace trigger tri_del_emp
after delete on emp
for each row
begin
   insert into temp values(25,'se ha borrado en emp');
end;

delete emp;
rollback;

/** for each row ejecuta la acción del trigger por cada registro borrado*/
create or replace trigger tri_del_emp1
after delete on emp
for each row
begin
   insert into temp values(25,'se ha borrado en emp el numero de empleado '||:OLD.EMPNO);
end;

