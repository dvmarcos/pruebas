/*
   Lista por departamentos concretos 
*/

  Select apellido, dept, salar / 12 "Salario Mes"
    from templa
    where dept in ('A00', 'B01', 'C01', 'D01')
    order by dept, salar DESC;

/*
   --- Funciones de grupo---------
*/
	Select dept, count(dept), min(codtra), avg(codtra), min(salar), min(salar/codtra) 
	from templa
	where fechnac < '01-06-1954' and
		(dept like 'D%' or dept like 'E%')
	group by dept, sexo
	having count(dept) >= 3;
	
/*
    ------------JOINS----------------------------------------------------
    Obtener info de directores de
    departamento ordenados por número de personal.
*/

	Select nombre, apellido, feching
    from templa, tdepta
    where nuempl = numdirec
    order by nuempl;

	Select nombre, apellido, feching
    from templa join tdepta 
        on (nuempl = numdirec)
    order by nuempl;
    
/*
  Seleccionar parejas de empleado (de sexo opuesto) que hayan nacido el 
    mismo dia (con información acerca de apellidos y fecha de nacimiento).
*/

	Select t1.nombre, t1.apellido, t1.fechnac, t1.sexo
 	from templa t1, templa t2
 	where t1.fechnac=t2.fechnac and t1.sexo<>t2.sexo;
  
--Join sql99
Select t1.nombre
     , t1.apellido
     , t1.fechnac
     , t1.sexo
     , t2.nombre
     , t2.apellido
     , t2.fechnac
     , t2.sexo
 	from templa t1 
    join templa t2 on ((t1.fechnac=t2.fechnac) and (t1.sexo<>t2.sexo))
  where t1.sexo = 'M';
    
-- con dos tablas
SELECT fechnac, t1.nombre, t1.apellido, t2.nombre, t2.Apellido
  from templa t1 
    join templa t2 USING (fechnac)
  where t1.sexo = 'M' and t2.sexo = 'H';   
  
--------------- SUBQUERYS (SUBSELECT) ---------------------------  

SELECT *
  FROM templa
  WHERE (sexo = 'M')
    and (upper(dept) like 'D%' OR lower(dept) like 'e%')
    and (niveduc > (select avg(niveduc) 
                    from templa));
                    
Select * 
  from templa
  WHERE (nombre IN (
                    SELECT nombre
                      from templa
                      where dept = 'D21'
                  )
        )AND (codtra not IN(
                  SELECT codtra
                      from templa
                      where dept = 'E21')
              );  
  
/* nombre de departamento con más empleados */

SELECT dname
  from dept
  where deptno in (Select deptno
                      From emp
                      Group by deptno
                      having count(*) = (Select max(count(*))
                                          from emp
                                          group by deptno));
              
 /* ------------------- EXPRESIONES REGULARES ----------------------------------- */

  from emp
  where REGEXP_LIKE(job, '^[AC]');

-- Retorna una cadena dentro de otra
SELECT REGEXP_SUBSTR('El patio de mi casa es particularPa', 'pa', 5, 2, 'i') from dual;
-- Retorna la posición de una cadena dentro de otra
SELECT REGEXP_INSTR('El patio de mi casa es particularPa', 'pa', 5, 2, 0,'i') from dual; 
-- Reemplaza una cadena de caracteres por otra
SELECT REGEXP_REPLACE('El patio de mi casa es particular', 'El', 'LA') from dual;

             
/* --------------------------- DML ------------------------------------- */              
  INSERT 
  into templa (nuempl, nombre, inicial, apellido, salar, fechnac, dept) 
Values ('000272', 'LUIS', 'L', 'PERNAS', 838500, '20/7/1965', 'D21');

 /* Añadir un nuevo departamento en la empresa cuyo codigo sea 'J01' llamado 'IDIOMA',y que su
director sea 'JAVIER GIL'.
*/
	insert into TDEPTA 
    values ('J01','IDIOMA', (Select nuempl 
                                from templa 
                                where nombre='JAVIER' 
                                  and apellido='GIL');


/*
   
  Comprobar que todos los empleados tienen su inicial correctamenta. Modificarla sino es correcta.
*/
	merge into templa t1
    using templa t2
      on (t1.nuempl=t2.nuempl)
    when matched then
      update set inicial=substr(t2.nombre,1,1);
	update templa t1
	  set inicial = (select substr(nombre,1,1)
			  from templa t2
			  where t2.nuempl = t1.nuempl);
			  
/*
Modificar el salario de los empleados con un valor igual al obtenido al dividir el 
salario maximo de su departamento por el número de empleados del departamento).
*/
   --opcion 1 --
	merge into templa t1
	using templa t2
	on (t1.nuempl=t2.nuempl)
	when matched then
 	update set salar=(select MAX(salar)/COUNT(salar) 
                      from templa 
                      where dept=t1.dept);
    --opcion 2 -- 
 	update templa t1
    set salar= (select MAX(salar)/COUNT(salar) 
                      from templa t2 
                      where t2.dept=t1.dept);			  
			  
			  
			  
/*
  Modificar el número de departamento de 'GIL'. 
El nuevo departamento será el departamento donde hay más 
empleados cuyo codigo de trabajo es 53.  
*/
	update templa 
    set dept = (select dept 
                    from templa 
                    where codtra='53' 
                    group by dept 
                    having count (*)	= 
                      (select max(count(*)) 
                        from templa 
                        where codtra='53' 
                        group by dept)
                  ) 
	where apellido like 'GIL';
              
  
/* ----------------- DDL ---------------------------*/

CREATE TABLE "ALUMNO10"."PRODUCTOS_V2"
  (
    "CODIGO"      NUMBER(6,0),
    "NOMBRE"      VARCHAR2(20 BYTE) CONSTRAINT "NOMBRE_NN_PRODUCTOS_V2" NOT NULL ENABLE,
    "P_COMPRA"    NUMBER(7,2),
    "PVP"         NUMBER(8,2) GENERATED ALWAYS AS (P_COMPRA*1.5),
    "ID_CATALOGO" NUMBER,
    CONSTRAINT "P_COMPRA_MAYOR_CERO_PROD_V2" CHECK (p_compra>0) ENABLE,
    CONSTRAINT "PK_PRODUCTOS_V2" PRIMARY KEY ("CODIGO"),
    CONSTRAINT "FK_ES_CONTENIDO_PRODUCTO_V2" FOREIGN KEY ("ID_CATALOGO") REFERENCES "ALUMNO10"."CATALOGOS_V2" ("ID") ON
  DELETE
    SET NULL ENABLE
  )
  
  INSERT INTO PRODUCTOS_V2 (CODIGO,NOMBRE,P_COMPRA) VALUES (12,'JUAN',10.2);
  DESC productos_v2;
 --COPIAR TABLA EMP (Sin restricciones y con contenido)--
 
 CREATE TABLE EMP_COPIA AS SELECT EMPNO,ENAME,JOB FROM EMP;
 
 -- AÑADIR COLUMNA A TABLA --
 ALTER TABLE PRODUCTOS_V2 ADD(PVP_IVA NUMBER(8,2));
 -- RESTRICCION DE FECHA A PARTIR DE UNA FECHA--
 ALTER TABLE CATALOGOS_V2 
 MODIFY ( FECHA DATE DEFAULT (SYSDATE)
 CONSTRAINT "FECHA_MAYOR_HOY" CHECK (FECHA >to_date('10-Mar-2012','DD-MON-YYYY')));
 

-- OTRAS TABLAS ---
 
Create Table Catalogos_v2 (
Id Number,
Nombre Varchar2(20) constraint CAT_V2_NOMBRE_NN Not Null,
Fecha Date Default (Sysdate),
Descripcion Varchar2(200),
CONSTRAINT PK_CATALOGOS_V2 PRIMARY KEY (ID)
);

CREATE TABLE "ALUMNO10"."PRODUCTOS_V2"
  (
    "CODIGO"      NUMBER(6,0),
    "NOMBRE"      VARCHAR2(20 BYTE) CONSTRAINT "NOMBRE_NN_PRODUCTOS_V2" NOT NULL ENABLE,
    "P_COMPRA"    NUMBER(7,2),
    "PVP"         NUMBER(8,2) GENERATED ALWAYS AS (P_COMPRA*1.5),
    "ID_CATALOGO" NUMBER,
    CONSTRAINT "P_COMPRA_MAYOR_CERO_PROD_V2" CHECK (p_compra>0) ENABLE,
    CONSTRAINT "PK_PRODUCTOS_V2" PRIMARY KEY ("CODIGO"),
    CONSTRAINT "FK_ES_CONTENIDO_PRODUCTO_V2" FOREIGN KEY ("ID_CATALOGO") REFERENCES "ALUMNO10"."CATALOGOS_V2" ("ID") ON
  DELETE
    SET NULL ENABLE
  )
  
  INSERT INTO PRODUCTOS_V2 (CODIGO,NOMBRE,P_COMPRA) VALUES (12,'JUAN',10.2);
  DESC productos_v2;
 --COPIAR TABLA EMP (Sin restricciones y con contenido)--
 
 CREATE TABLE EMP_COPIA AS SELECT EMPNO,ENAME,JOB FROM EMP;
 
 -- AÑADIR COLUMNA A TABLA --
 ALTER TABLE PRODUCTOS_V2 ADD(PVP_IVA NUMBER(8,2));
 -- RESTRICCION DE FECHA A PARTIR DE HOY--
 ALTER TABLE CATALOGOS_V2 
 MODIFY ( FECHA DATE DEFAULT (SYSDATE)
 CONSTRAINT "FECHA_MAYOR_HOY" CHECK (FECHA >to_date('10-Mar-2012','DD-MON-YYYY')));

);
















  
