-- Funciones aritméticas

-- ABS devuelve el valor absoluto de un número
select abs(-18.3) from dual;
select abs(16) from dual;

-- CEIL devuelve el entero superior a n
select ceil(19.2) from dual;
select ceil(19.8) from dual;
select ceil(19) from dual;

-- FLOOR devuelve el entero inferior a n
select floor(19.2) from dual;
select floor(19.8) from dual;
select floor(19) from dual;

-- ROUND redondea según la precisión indicada
select round(19.2) from dual;
select round(19.8) from dual;
select round(19.34) from dual;
select round(19.5) from dual;
  --Aplicando precisión
select round(19.2, 1) from dual;
select round(19.84, 1) from dual;
select round(19.34653, 3) from dual;
select round(19.34653, 0) from dual;

--TRUNC trunca según la precisión indicada
select trunc(19.2) from dual;
select trunc(19.8) from dual;
select trunc(19.34) from dual;
select trunc(19.5) from dual;
  --Aplicando precisión
select trunc(19.2, 1) from dual;
select trunc(19.84, 1) from dual;
select trunc(19.34653, 3) from dual;
select trunc(19.34653, 0) from dual;

-- MOD(a, b) resto de la division entera de a entre b
select mod(47, 5) from dual;

-- POWER obtiene la potencia de un numero
select power(25,2) from dual;
select power(25,3) from dual;

-- SQRT Obtiene la raíz cuadrada de un numero
select sqrt(25) from dual;
select sqrt(0) from dual;
select sqrt(-25) from dual;

select power(25,(1/2)) from dual;
select trunc(power(25,(1/2))) from dual;

-- SING
select sign(-20)  from dual;
select sign(0)    from dual;
select sign(+20)  from dual;