with Ada.Text_IO; use Ada.Text_IO;

package body Length_Check
with SPARK_Mode => On
is

Test : String := "";

 function Get_Line (Msg : String) return String
 is
 begin
  Put_Line(Msg);

  return Get_Line;
 end Get_Line;


begin

 Test := Get_Line("hello:");

 Put_Line( Test);

end Length_Check;
