package body Spark.Services
with SPARK_Mode => On
is


  function  Range_checking (I, J : Integer) return Integer
 is
 Q : Integer;
 begin
Q := A (I)/(-J);
  return Q;
  end;

end  Spark.Services;
