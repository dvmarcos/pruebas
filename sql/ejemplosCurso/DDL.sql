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
 

-- OTRAS TABLAS ---
 
 Create Table Catalogos_v1 (
Id Number Primary Key,
Nombre Varchar2(20) Not Null,
Fecha Date Default (Sysdate),
descripcion varchar2(200));


Create Table Catalogos_v2 (
Id Number,
Nombre Varchar2(20) constraint CAT_V2_NOMBRE_NN Not Null,
Fecha Date Default (Sysdate),
Descripcion Varchar2(200),
CONSTRAINT PK_CATALOGOS_V2 PRIMARY KEY (ID)
);


Create Table Productos (
Codigo Number(6),
Nombre Varchar2(20) Constraint Nombre_Nn_Productos Not Null,
P_Compra Number (7,2) Constraint P_Compra_Mayor_Cero_Producto Check (P_Compra > 0),
Pvp Number (8,2),
Idcatalogo Number,
Constraint Pk_Productos Primary Key (Codigo),
Constraint Fk_Es_Contenido Foreign Key (Idcatalogo) References Catalogos_V2 (Id) On Delete Set Null
);