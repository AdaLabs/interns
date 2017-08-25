with Ada.Text_IO;
use Ada.Text_IO;


procedure Enumerations is
   type Item_List is (ADD,
                      SUB,
                      DIV,
                     QUIT);
begin

   for Item in Item_List'Range loop
   Put_line (" -" & Natural'Image (Item_List'Pos (Item)) & " " & Item_List'Image (Item));
   end loop;

   declare

        Input : constant Item_List := Item_List'Val (Natural'Value (Get_Line));
   begin

      case Input  is
      when ADD =>
         Put_Line("add");
      when SUB =>
          Put_Line("sub");
      when DIV =>
          Put_Line("div");
      when QUIT =>
          Put_Line("Bye");
      end case;


   end;
end Enumerations;
