package Range_Check
with  SPARK_Mode => On
is


 ------------------------
 ---Contracts procedure---
 -------------------------
 type C is range 1 .. 100;
 procedure Count (X : in out C);

 --  procedure Count (X : in out C)
 --  with pre => (X < C'Last);




end Range_Check;
