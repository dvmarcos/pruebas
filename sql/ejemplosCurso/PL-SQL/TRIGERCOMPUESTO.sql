CREATE OR REPLACE TRIGGER Compuesto
 FOR UPDATE ON EMP
 COMPOUND TRIGGER
	type Templeados is  table of emp%rowtype index by binary_integer;
	tabla1  Templeados;
	contador number := 0;
    BEFORE STATEMENT IS
     	BEGIN  	NULL; 	
      END BEFORE STATEMENT;
      
   BEFORE EACH ROW IS
      BEGIN 	NULL;	END BEFORE EACH ROW;
    
    AFTER EACH ROW IS
     	BEGIN
      contador := contador+1;
      tabla1(contador).empno:= :old.empno;
      tabla1(contador).sal:= :new.sal;
    END AFTER EACH ROW;
    
   AFTER STATEMENT IS
     	BEGIN
      forall i in 1..contador
      update emp
      set  sal=tabla1(i).sal*1.18
      where empno = tabla1(i).empno;
    END AFTER STATEMENT;
    
   END;
/
