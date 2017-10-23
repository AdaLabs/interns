package Index_Check
with  SPARK_Mode => On
is

 subtype Checking is Positive range 1 .. 1000;

 type Arrray_Checking is array (Checking) of Natural;

 function Index_Checking (A : Arrray_Checking) return Positive;


--  function Index_Checking (A : Arrray_Checking) return Positive
--    with Post =>  ((Index_Checking'Result in A'Range) and
--                     (for all J in A'Range =>
--                        A(J) <= A(Index_Checking'Result)));

end Index_Check;
