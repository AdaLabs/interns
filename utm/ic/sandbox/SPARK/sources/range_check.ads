package Range_Check
with  SPARK_Mode => On
is


 type Number is range 1 .. 11;
     procedure Print_and_Increment (j: in out Number);
 --    with pre=> j < Number'Last;

end Range_Check;
