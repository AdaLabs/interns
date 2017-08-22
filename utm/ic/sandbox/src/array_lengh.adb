with Ada.Text_IO;
use Ada.Text_IO;


procedure Array_Lengh is
   Names : constant array (Positive range <>) of access constant String
     := (new String'("ingrid"),
         new String'("Cherry"));


begin
   for Name of Names loop
      Put("Name Lenght " & Integer'Image(Name'Length));

   end loop;


   Put_Line("Name Size :" & Integer'Image(Names'Length));
end Array_Lengh;
