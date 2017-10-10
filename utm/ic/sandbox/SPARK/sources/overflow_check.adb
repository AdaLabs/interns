package body Overflow_Check
with SPARK_Mode => On
is

 function  Overflow_checking (I: Integer) return Integer
 is
 Q : Integer;
 begin
Q :=   (I + 1);
  return Q;
end Overflow_checking;
end Overflow_Check;
