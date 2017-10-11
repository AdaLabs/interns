
package body Index_Check
with SPARK_Mode => On
is


 function Init_Arr_Index (A : Arr_T) return Positive

 is
 Result : Positive := A'First;
 begin
  for J in A'First..A'Last loop
  if  A(Result) < A(J) then
  Result := J;
  end if;
--    pragma Loop_Invariant
--    (Result in A'Range and
--    (for all K in A'First .. J =>
--    A(K) <= A(Result)));
  end loop;

  return Result;

end Init_Arr_Index;

 end Index_Check;
