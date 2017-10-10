with Index_Check; use Index_Check;
with Ada.Text_IO; use Ada.Text_IO;

procedure Index_Check.Main is
Division : Integer;
begin

Division := Index_checking(I => 1,J => 6);
Put_Line("range" & Division'Image);

end Index_Check.Main;
