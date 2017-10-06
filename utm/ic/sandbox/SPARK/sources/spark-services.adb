package body Spark.Services
with SPARK_Mode => On
is

 function  Overflow_checking (I, J : Integer) return Integer
 is
 Q : Integer :=0;
 begin
Q :=   A (I + J);
  return Q;
end;

 function  Index_checking (I, J : Integer) return Integer
 is
 Q : Integer :=0;
 begin
Q :=   A (I + J);
  return Q;
  end;
   function  Range_checking (I, J : Integer) return Integer
 is
 Q : Integer :=0;
 begin
Q := A (I)/(-J);
  return Q;
  end;
     function  Division_checking (I, J : Integer) return Integer
 is
 Q : Integer :=0;
 begin
Q := A (I/J);
  return Q;

end;



end  Spark.Services;
