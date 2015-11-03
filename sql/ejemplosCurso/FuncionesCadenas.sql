-- Funciones de cadenas de caracteres

select ascii('Hola') from dual;

select chr(72) from dual;

select initcap('el patio de mi casa es particular') from dual;

select lower('TodOS los caraCTEres se CONvierten en MinÚsculas') from dual;

select upper('TodOS los caraCTEres se CONvierten en MayúSCUlas') from dual;

select length('Esta cadena tiene 31 caracteres') from dual;
select length (ename), ename FROM emp;

select lpad('Pedro', 80) from dual;
select length(lpad('Pedro', 80)) from dual;
select lpad('Pedro', 80, '*') from dual;
select lpad('Pedro', 80, 'HOLA - ') from dual;

select rpad('Pedro', 80) from dual;
select rpad('Pedro', 80, '*') from dual;

select rtrim('                Pedro                  ') r from dual;
select ltrim('                Pedro                  ') l from dual;
select trim('                Pedro                  ') t from dual;
select trim('                Pe dro                  ') t from dual;

select substr('el patio de mi casa es particular', 4,5) from dual;  
-- patio
select translate('Cuando Fernando VII usaba pantalón', 'o', 'a') from dual;
select translate('Cuando Fernando VII usaba pantalón', 'oó', 'aá') from dual;
select translate('Cuando Fernando VII usaba pantalón', 'an', 'or') from dual;
select translate('Cuando Fernando VII usaba pantalón', 'aeiou', 'a') from dual;

select translate('Cuando Fernando VII usaba pantalon', 'aeiou', 'aaaaa') from dual;
select translate('Cuando Fernando VII usaba pantalon', 'aeiou', 'eeeee') from dual;
select translate('Cuando Fernando VII usaba pantalon', 'aeiou', 'iiiii') from dual;
select translate('Cuando Fernando VII usaba pantalon', 'aeiou', 'ooooo') from dual;
select translate('Cuando Fernando VII usaba pantalon', 'aeiou', 'uuuuu') from dual;