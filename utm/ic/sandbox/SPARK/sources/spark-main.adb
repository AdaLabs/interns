with Division_Check; use Division_Check;
with Ada.Text_IO; use Ada.Text_IO;
procedure Spark.Main is


Division : Integer;
begin

Division := Division_checking(I => 1,J => 0);
Put_Line("range" & Division'Image);


null;
end Spark.Main;
