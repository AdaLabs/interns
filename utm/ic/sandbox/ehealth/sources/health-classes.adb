
package body Health.Classes is

   function Name (H : in Human_Being) return String
   is
   begin
      return To_String (H.Name);
   end Name;

   function Age (H : in Human_Being) return Year_Type
   is
   begin
      return (H.Age);
   end Age;

   function Weight (H : in Human_Being) return Mass_Type
   is
   begin
      return H.Weight;
   end Weight;

   function Height (H : in Human_Being) return Height_Type
   is
   begin
      return H.Height;
   end Height;

   function Activity (H : in Human_Being) return Activity_Kind
   is
   begin
      return H.Activity;
   end Activity;



  ---------------
  -- Set_Height--
  ----------------
   procedure  Set_Height (H      : in out Human_Being;
                          Height : in     Height_Type)
   is
   begin
     H.Height := Height;
   end Set_Height;


   procedure  Set_Weight (H      : in out Human_Being;
                          Weight : in     Mass_Type)
   is
   begin
     H.Weight := Weight;
   end Set_Weight;

       procedure Set_Age (H      : in out Human_Being;
                    Age  : in     Year_Type)
                    is
                    begin
  H.Age := Age;
end Set_Age;

   procedure Set_Activity (H      : in out Human_Being;
                        Activity  : in     Activity_Kind)
                        is
                        begin
  H.Activity := Activity;
end Set_Activity;


  ---------------
  -- Set_Gender--
  ----------------
 --  procedure Set_Gender (H : in out Human_Being)
 --  is
 --    Gender : Gender_Type;
 --  begin
 --     Gender := H.Gender;
 --  end Set_Gender;
end Health.Classes;
