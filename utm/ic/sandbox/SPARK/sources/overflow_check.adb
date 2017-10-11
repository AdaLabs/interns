package body Overflow_Check
with SPARK_Mode => On
is

 procedure Add (X : in Integer)
 is
 begin
  Total := Total + X;
 end Add;



 Procedure Sum(X:in Integer) is
 begin
  if Total + X <= Value then
   Add(X);
  else
   Total := Value;
  end if;
 end Sum;


end Overflow_Check;
