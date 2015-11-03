/*
EJERCICIO GLOBAL SQL

EJERCICIO GLOBAL

Una empresa desea automatizar su gestión. Para ello, se pone en contacto 
con nosotros y nos encarga que implementemos una pequeña prueba, para así
conocer si seremos capaces de realizar la automatización de forma adecuada
y en un tiempo prudente. 
Para realizar esta prueba nos proporciona una pequeña cantidad de datos 
(referentes a empleados, departamentos, productos y ventas) y un conjunto 
de operaciones a realizar.

- Datos relativos a empleados
   NUM	NOMBRE		        CAT		      SALARIO		DEP
   001	Javier Sanchez		Director		250.000		01
   002	Elena Gutiérrez		Secretaria	100.000		01
   003	Angel Hernández	  Gerente	    175.000		02
   004	Rosa Anguiano		  Comercial	  150.000		02
   005	Maria Bernal		  Secretaria	 90.000		03
   006	Miguel Santamaría	Comercial	  150.000		03

- Datos relativos a departamentos
   DEP		DESCRIPCION
   01		  Servicios Centrales
   02		  Sucursal Madrid
   03		  Sucursal Toledo

- Datos relativos a productos
   PRO		DESCRIPCION		      PVP
   01		  DVD			             25
   02		  CPU 			          220
   03		  Monitor Color 17"	   99
   04		  Ratón			           10
   05		  Impresora Láser	    110

- Datos relativos a ventas realizadas
    NUM	PRO	CANT
    003	01	  2
    002	05	  1
    004	02	  3
    006	02	  4
    006	03	  7
    004	05	  4
    003	02	 10
    002	05	  2
    005	02	  1

(Esta tabla tiene una tupla por cada venta que se hace de un producto, 
no confundir la cantidad de unidades vendidas en cada ocasión (reflejada
por el atributo CANT) con el número de veces que ha sido vendido un
producto (reflejada cada ocasión en una tupla)


SE PIDE: */
/*1.	Crear las tablas. */

drop table empleados;

CREATE table empleados (
  num number(3) primary key,
  nombre varchar2(20) not null,
  cat varchar2(20) not null,
  dep number(2), 
  salario number(10)
  );
  

CREATE table departamentos (
  dep number(2),
  descripcion varchar2(20) not null
  );

CREATE table productos (
   pro number(2) primary key,
  descripcion varchar2(20) not null,
  pvp number(8,2)
  );

CREATE table ventas (
  num number(3), 
  pro number(2), 
  cant number(2),
  Constraint Fk_empleados_num Foreign Key (num) References empleados (num),
  Constraint Fk_productos_pro Foreign Key (pro) References productos (pro)
  );



/*2.	Introducir los datos dados.*/

insert into empleados (num, nombre, cat,salario,dep)
  values(001,'Javier Sanchez','Director',250000,01);
insert into empleados (num, nombre, cat,salario,dep)
  values(002,'Elena Gutiérrez','Secretaria',100000,01);
insert into empleados (num, nombre, cat,salario,dep)
  values(003,'Angel Hernández','Gerente',175000,02);
insert into empleados (num, nombre, cat,salario,dep)
  values(004,'Rosa Anguiano','Comercial',150000,02);
insert into empleados (num, nombre, cat,salario,dep)
  values(005,'Maria Bernal','Secretaria',90000,03);  
insert into empleados (num, nombre, cat,salario,dep)
  values(006,'Miguel Santamaría','Comercial',150000,03);      
    

insert into departamentos (dep, descripcion)
  values(01,'Servicios Centrales');
insert into departamentos (dep, descripcion)
  values(02,'Sucursal Madrid');   
insert into departamentos (dep, descripcion)
  values(03,'Sucursal Toledo');   


Insert Into Productos  Values ('01','DVD','25');
Insert Into Productos  Values ('02','CPU','220');
Insert Into Productos  Values ('03','Monitor Color 17"','99');
Insert Into Productos  Values ('04','Ratón','10');
Insert Into Productos  Values ('05','Impresora Láser','110');


Insert Into Ventas  Values ('003','01','2');
Insert Into Ventas  Values ('002','05','1');
Insert Into Ventas  Values ('004','02','3');
Insert Into Ventas  Values ('006','02','4');
Insert Into Ventas  Values ('006','03','7');
Insert Into Ventas  Values ('004','05','4');
Insert Into Ventas  Values ('003','02','10');
Insert Into Ventas  Values ('002','05','2');
Insert Into VENTAS  Values ('005','02','1');
commit;




/*3.	Generar facturas en forma de tupla de todos los productos por pantalla. 
Cada factura debe contener:
      ?	código de vendedor
      ?	código de producto
      ?	precio unitario
      ?	cantidad vendida
      ?	base imponible (precio por unidades vend.)
      ?	tipo de IVA aplicable (18% en todos)
      ?	importe total de la factura correspondiente a ese vendedor (importe + IVA)*/
      
 select  e.num "codigo vendedor", p.pro "código producto", p.pvp , v.cant "cantidad vendida",
 pvp*1.8 as iva, (p.pvp+pvp*1.8)*v.cant as "importe+iva"
 from ventas v,productos p,empleados e 
 where v.num=e.num and v.pro=p.pro
 group by e.num;
          
      

4.	Obtener el código del producto y la cantidad total de unidades
vendidas para aquellos productos que se hayan vendido en más de una
ocasión (más de una venta)

5.	Obtener el código del producto y número de veces que se ha vendido,
del producto que en más ocasiones haya sido vendido.

6.	Obtener el nombre y la categoría profesional de aquellos empleados 
que hayan obtenido más ingresos en ventas que cualquier Comercial.

7.	Subir en un 5 % el sueldo de los empleados que hayan vendido más 
unidades de los productos con precio superior a 100.

8.	Dar de baja al empleado que menos dinero haya obtenido en las ventas.

9.	Dar de baja al departamento 'Sucursal de Toledo'.

10.	Eliminar los contenidos y las estructuras de las tablas.
*/