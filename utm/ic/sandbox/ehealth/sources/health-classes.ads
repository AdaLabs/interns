with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Health.Interfaces;

package Health.Classes is

   type Human_Being is new Interfaces.Human with
      Record
         Name       : Unbounded_String := Null_Unbounded_String;
         Age        : Year_Type;
         Gender     : Gender_Type;
         Weight     : Mass_Type;
         Height     : Height_Type;
         Activity   : Activity_Kind;
      end record;

   overriding
   function Name     (H : in Human_Being) return String;
   function Age      (A : in Human_Being) return Year_Type;
   function Gender   (G : in Human_Being) return Gender_Type;
   function Weight   (W : in Human_Being) return Mass_Type;
   function Height   (H : in Human_Being) return Height_Type;
   function Activity (A : in Human_Being) return Activity_Kind;

end Health.Classes;
