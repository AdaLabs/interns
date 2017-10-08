package Division_Check
with  SPARK_Mode => On
is



 type Division_Check_Array  is array (Integer  range <>)  of Natural;
 A : Division_Check_Array (1 .. 10);

     function Division_checking (I, J: Integer) return Integer;
end Division_Check;
