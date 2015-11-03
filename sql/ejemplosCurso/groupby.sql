select deptno, count(*) from emp group by deptno having deptno=10 ;
select deptno, count(ename) from emp group by deptno having deptno=10 or deptno=30 order by deptno desc;
select deptno, count(ename) from emp group by deptno having deptno in(10,30)order by deptno asc;
select deptno, count(ename) from emp group by deptno having deptno= any(10,30);
select deptno, count(ename) from emp group by deptno having deptno between 10 and 30;