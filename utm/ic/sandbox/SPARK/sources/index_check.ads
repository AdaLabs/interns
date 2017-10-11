package Index_Check
with  SPARK_Mode => On
is



subtype Index_T is Positive range 1 .. 1000;


   type Arr_T is array (Index_T) of Natural;
 function Init_Arr_Index (A : Arr_T) return Positive;
--      with Post =>  ((Init_Arr_Index'Result in A'Range) and
--    (for all J in A'Range =>
--    A(J) <= A(Init_Arr_Index'Result)));

end Index_Check;
