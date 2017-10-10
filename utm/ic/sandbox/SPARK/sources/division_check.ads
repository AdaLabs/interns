package Division_Check
with SPARK_Mode => On
is

 function  Division_Checking (ValueA, ValueB : Float) return Float
 with Pre => ValueB > 0.0 ;

end Division_Check;
