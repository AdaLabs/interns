with Overflow_Check; use Overflow_Check;
with Ada.Text_IO; use Ada.Text_IO;

procedure Overflow_Check.Main is
Division : Integer;
begin

Division := Index_checking(I => 1,J => 6);
Put_Line("range" & Division'Image);

end Overflow_Check.Main;
