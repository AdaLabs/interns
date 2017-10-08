package Overflow_Check
with  SPARK_Mode => On
is



 type check_Array  is array (Integer  range <>)  of Natural;
 A : check_Array (1 .. 10);
 function Overflow_checking (I, J: Integer) return Integer;

end  Overflow_Check;
