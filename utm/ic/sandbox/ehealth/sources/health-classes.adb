with Ada.Text_IO;
use Ada.Text_IO;

package body Health.Classes is

   function Name (H : in Human_Being) return String
   is
   begin
      return To_String (H.Name);
   end Name;


end Health.Classes;
