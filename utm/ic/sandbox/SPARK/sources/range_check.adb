package body Range_Check
with SPARK_Mode => On
is

 function Sum_Caculation(a: Index_Check_Array) return Natural is

 begin
  for i in a'Range loop
   total_sum := total_sum + a(i);
  end loop;
  return total_sum;
 end Sum_Caculation;

begin


 null;
end Range_Check;
