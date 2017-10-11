package Range_Check
with  SPARK_Mode => On
is


 ------------------------
---Contracts procedure---
-------------------------
  total_sum: Integer := 0;
 type Index_Check_Array is array (1 .. 10) of Integer;

          function Sum_Caculation(a: Index_Check_Array) return  Natural;
     --     with pre => total_sum <= Index_Check_Array'Last ;



end Range_Check;
