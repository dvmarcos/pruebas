
--Ejercicios propuestos:

/*1.- Crear un bloque pl/sql que devuelva el nombre del empleado 
    que tiene su comisión con el valor 300.*/

	declare
	 vnombre emp.ename%type;
	begin
	 select ename into vnombre
	 from emp
	 where comm=300;

	 dbms_output.put_line('El empleado cuya comision es 300 se llama: '||vnombre);

	end;
	/

/*2.- Crear un bloque pl/sql que devuelva la diferencia de 
    salario existente entre el salario de KING y la media 
    de los salarios de los empleados de la tabla EMP.*/

	declare
	  vmedia number;
	  vsalario emp.sal%type;
	  diferencia number;
	begin
	  select sal into vsalario
	  from emp
	  where ename='KING';
	
	  select AVG(sal) into vmedia
          from emp;

	  diferencia:=round(vsalario-vmedia,0);
	  dbms_output.put_line('La diferencia es :' || diferencia);

	end;
	/


/*3.- Crear un bloque pl/sql que nos informe de la siguiente: 
    " El empleado KING que pertenece al departamento XXXXXXX 
    gana XXXXXX dólares mas que la media ".*/
    
SET serveroutput ON
	declare
	  vmedia number;
	  vsalario emp.sal%type;
	  vdiferencia number;
	  vdepartamento emp.deptno%TYPE;
	begin
	  select sal,deptno into vsalario, vdepartamento
	  from emp
	  where ename='KING';
	
	  select AVG(sal) into vmedia
	  from emp;

	  vdiferencia:=round(vsalario-vmedia,0);
	  dbms_output.put('El empleado KING que pertenece al departamento ' || vdepartamento);
	 dbms_output.put_line(' gana '|| vdiferencia ||' dolares mas que la media');
	
	end;
	/
