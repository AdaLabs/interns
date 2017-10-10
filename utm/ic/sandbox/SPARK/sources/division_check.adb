package body Division_Check
with SPARK_Mode => On
is

function  Division_Checking (ValueA, ValueB : Float) return Float
is
  Sum : Float;
 begin
  Sum := ValueA / ValueB;
  return Sum;

 end Division_Checking;


end Division_Check;
