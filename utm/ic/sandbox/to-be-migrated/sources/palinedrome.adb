with Ada.Text_IO;
use Ada.Text_IO;


procedure Palinedrome is
   use Ada.Text_IO;
    X : constant String := Get_Line;

   function IsPalindrome (Text : String) return Boolean is
begin
   for Offset in 0..Text'Length / 2 - 1 loop
      if Text (Text'First + Offset) /= Text (Text'Last - Offset) then
         return False;
      end if;
   end loop;
   return True;
end IsPalindrome;
begin

   put_line(Boolean'Image(IsPalindrome(X)));

end Palinedrome;
