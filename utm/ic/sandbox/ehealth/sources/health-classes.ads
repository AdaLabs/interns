with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Health.Interfaces;

package Health.Classes is

   ----------------
   --  Human_Being
   ----------------

   type Human_Being is abstract new Interfaces.Human with private;

   overriding function Name     (H : in Human_Being) return String;
   overriding function Age      (H : in Human_Being) return Year_Type;
   overriding function Weight   (H : in Human_Being) return Mass_Type;
   overriding function Height   (H : in Human_Being) return Height_Type;
   overriding function Activity (H : in Human_Being) return Activity_Kind;


   overriding procedure Set_Height (H      : in out Human_Being;
                                    Height : in         Height_Type);

   overriding procedure Set_Weight (H       : in out Human_Being;
                                    Weight  : in       Mass_Type);

   overriding  procedure Set_Age (H   : in out Human_Being;
                                  Age : in        Year_Type);

   overriding procedure Set_Activity (H        : in out Human_Being;
                                      Activity : in       Activity_Kind);

   function Person_Calorie_burned          (Person : in Human_Being'Class) return Calorie_Type;

   function Person_BMI                     (Person : in Human_Being'Class) return BMI_Type;

   function Project_Weight_Gain            (Person : in Human_Being'Class) return Mass_Type;

   function Ideal_Body_Weight              (Person : in Human_Being'Class) return Mass_Type;

   function Weight_Loss_Required           (Person : in Human_Being'Class) return Mass_Type;

   function Total_Daily_Energy_Expenditure (Person : in Human_Being'Class) return Calorie_Type;


   pragma Compile_Time_Warning (True, "TODO switch namings to man and women");

   ----------------
   --  Male_Human_Being
   ----------------

   type Male_Human_Being is new Human_Being with private;

   overriding function Gender   (H : in Male_Human_Being) return Gender_Type is (Male);

   ----------------
   --  Female_Human_Being
   ----------------

   type Female_Human_Being is new Human_Being with private;

   overriding function Gender   (H : in Female_Human_Being) return Gender_Type is (Female);

private

   type Human_Being is abstract new Interfaces.Human with record
      Name       : Unbounded_String := Null_Unbounded_String;
      Age        : Year_Type;
      Weight     : Mass_Type;
      Height     : Height_Type;
      Activity   : Activity_Kind;
   end record;

   type Male_Human_Being is new Human_Being with null record;
   type Female_Human_Being is new Human_Being with null record;

end Health.Classes;
