package Range_Check
with  SPARK_Mode => On
is

 type Range_Check_Array  is array (Integer  range <>)  of Natural;
 A : Range_Check_Array (1 .. 10);

  function Range_checking (I, J: Integer) return Integer;

end Range_Check;
