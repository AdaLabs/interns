package body Division_Check
with SPARK_Mode => On
is

 function  BMI (Kg, Cm : Integer) return Integer is
  Result : Integer;
 begin
  Result := Kg / Cm;
  return Result;

 end BMI;


end Division_Check;
