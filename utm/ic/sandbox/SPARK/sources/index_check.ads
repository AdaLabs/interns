package Index_Check
with  SPARK_Mode => On
is



 type Index_Check_Array is array (1 .. 10) of Integer;

  function sumEmUp(a: Index_Check_Array) return Natural ;

end Index_Check;
