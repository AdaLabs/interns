package body Spark.Services
with SPARK_Mode => On
is

--   function Search
--       (A        : Arr;
--        Val      : Element;
--        At_Index : out Index) return Boolean
--     is
--        Pos : Index := A'First;
--     begin
--        while Pos < A'Last loop
--           if A(Pos) = Val then
--              At_Index := Pos;
--              return True;
--           end if;
--
--           Pos := Pos + 1;
--        end loop;
--
--        return False;
--     end Search;

function Search
     (A   : Arr;
      Val : Element) return Search_Result
   is
      Pos : Index := A'First;
      Res : Search_Result;
   begin
      while Pos < A'Last loop
         if A(Pos) = Val then
            Res.At_Index := Pos;
            Res.Found := True;
            return Res;
         end if;

         Pos := Pos + 1;
      end loop;

      Res.Found := False;
      return Res;
   end Search;

end  Spark.Services;
