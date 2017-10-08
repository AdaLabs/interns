package Index_Check
with  SPARK_Mode => On
is



 type Index_Check_Array  is array (Integer  range <>)  of Natural;
 A : Index_Check_Array (1 .. 10);

  function Index_checking (I, J: Integer) return Integer;

end Index_Check;
