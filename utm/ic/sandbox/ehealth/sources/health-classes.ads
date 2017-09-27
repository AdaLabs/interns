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
   overriding function Heart_Rate (H : in Human_Being) return Heart_Rate_Type;
   overriding  function Minutes (H : in Human_Being) return Minute_Type;


   overriding procedure Set_Height (H      : in out Human_Being;
                                    Height : in     Height_Type);

   overriding procedure Set_Weight (H       : in out Human_Being;
                                    Weight  : in     Mass_Type);

   overriding  procedure Set_Age (H   : in out Human_Being;
                                  Age : in     Year_Type);

   overriding procedure Set_Activity (H        : in out Human_Being;
                                      Activity : in     Activity_Kind);
   overriding  procedure Set_Heart_Rate (H           : in out Human_Being;
                                         Heart_Rate  : in     Heart_Rate_Type);

   overriding  procedure Set_Minuites (H         : in out Human_Being;
                                       Min       : in     Minute_Type);

   function Person_Calorie_burned          (Person : in Human_Being'Class) return Calorie_Type;

   function Person_BMI                     (Person : in Human_Being'Class) return BMI_Type;

   function Project_Weight_Gain            (Person : in Human_Being'Class) return Mass_Type;

   function Ideal_Body_Weight              (Person : in Human_Being'Class) return Mass_Type;

   function Weight_Loss_Required           (Person : in Human_Being'Class) return Mass_Type;

   function Total_Daily_Energy_Expenditure (Person : in Human_Being'Class) return Calorie_Type;



   ----------------
   --  Women_Human_Being
   ----------------

   type Man_Human_Being is new Human_Being with private;

   overriding function Gender   (H : in Man_Human_Being) return Gender_Type is (Man);

   ----------------
   --  Women_Human_Being
   ----------------

   type Women_Human_Being is new Human_Being with private;

   overriding function Gender   (H : in Women_Human_Being) return Gender_Type is (Women);

private

   type Human_Being is abstract new Interfaces.Human with record
      Name       : Unbounded_String := Null_Unbounded_String;
      Age        : Year_Type;
      Weight     : Mass_Type;
      Height     : Height_Type;
      Activity   : Activity_Kind;
      Heart_Rate : Heart_Rate_Type;
      Min        : Minute_Type;

   end record;

   type Man_Human_Being is new Human_Being with null record;
   type Women_Human_Being is new Human_Being with null record;

end Health.Classes;
