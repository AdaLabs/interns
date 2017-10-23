package body Range_Check
with SPARK_Mode => On
is
 procedure Count (X : in out C)
 is
 begin
  X := X + 1;
 end;
begin

 null;
end Range_Check;
