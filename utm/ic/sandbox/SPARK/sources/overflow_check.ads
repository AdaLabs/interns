package Overflow_Check
with  SPARK_Mode => On
is

Total : Integer := 0;

Value : Integer := 100;

------------------------
----Normal procedure----
------------------------
  procedure Add(X : in Integer);

   Procedure Sum(X:in Integer);


 ------------------------
---Contracts procedure---
-------------------------
--
--     procedure Add (X : in Integer)
--      with pre=> ( X > 0 and then
--                   Total <= Integer'Last - X);
--
--
--
--     Procedure Sum(X:in Integer)
--     with pre=> ( X > 0 and then
--                   Total <= Integer'Last - X);




end  Overflow_Check;
