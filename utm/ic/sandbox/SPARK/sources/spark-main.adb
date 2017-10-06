with Spark.Services;
use Spark.Services;
with Ada.Text_IO; use Ada.Text_IO;
procedure Spark.Main is

  Overflow : Integer :=0;
 Index : Integer :=0;
Ranges : Integer :=0;
Division : Integer :=0;
begin

Division := Division_checking(I => 4,
J => 0);
Put_Line("tetsdd" & Division'Image);

Ranges := Range_checking(I => 4,
J => 9);
Put_Line("tetsdd" & Ranges'Image);

Index := Index_checking(I => A'Last,
J => 2);
Put_Line("tetsdd" & Index'Image);


  Overflow := Overflow_checking(I => Integer'Last,
  J => 5 );
  Put_Line("tets" & Overflow'Image);


null;
end Spark.Main;
