package Division_Check
with SPARK_Mode => On
is

 function  BMI (Kg, Cm : Integer) return Integer
 with Pre => Cm > 0 ;

end Division_Check;
