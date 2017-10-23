
package body Index_Check
with SPARK_Mode => On
is


 function Index_Checking (A : Arrray_Checking) return Positive
 is
  Result : Positive := A'First;
 begin
  for J in A'First..A'Last loop
   if  A(Result) < A(J) then
    Result := J ;
   end if;
  end loop;
  return Result;
 end Index_Checking;


 --   function Index_Checking (A : Arrray_Checking) return Positive
 --
 --   is
 --    Result : Positive := A'First;
 --   begin
 --    for J in A'First..A'Last loop
 --     if  A(Result) < A(J) then
 --      Result := J ;
 --     end if;
 --     -- because variable Result is modified in the loop, hence GNATprove knows nothing about it unless it is stated in a loop invariant
 --     pragma Loop_Invariant
 --      (Result in A'Range and
 --        (for all K in A'First .. J =>
 --           A(K) <= A(Result)));
 --     -- The loop invariant expresses that all elements up to the current loop index J have the value less than A(Result).
 --     -- GNATprove is able to prove the postcondition of Index_Checking, namely that all elements of the array have value value less than A(Result).
 --    end loop;
 --
 --    return Result;
 --
 --   end Index_Checking;

end Index_Check;
