package Spark.Services
with  SPARK_Mode => On
is



 type Nat_Array  is array (Integer  range <>)  of Natural;
 A : Nat_Array (1 .. 10);
 function Overflow_checking (I, J: Integer) return Integer;

  function Index_checking (I, J: Integer) return Integer;
    function Range_checking (I, J: Integer) return Integer;
     function Division_checking (I, J: Integer) return Integer;
end Spark.Services;


