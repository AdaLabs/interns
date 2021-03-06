

with Ada.Text_IO; use Ada.Text_IO;

procedure Workoutmain is

   type Gender_Type is (Male,
                        Female,
                        Other);

   type Body_Mks_Type is new Long_Long_Float
     with
       Dimension_System => ((Unit_Name => Year      , Unit_Symbol => 'y'     , Dim_Symbol => 'Y'),
                            (Unit_Name => Calorie   , Unit_Symbol => "cal"   , Dim_Symbol => 'C'),
                            (Unit_Name => Kilogram  , Unit_Symbol => "kg"    , Dim_Symbol => 'M'),
                            (Unit_Name => Heart_Rate, Unit_Symbol => "bpm"   , Dim_Symbol => 'B'),
                            (Unit_Name => Time      , Unit_Symbol => "minute", Dim_Symbol => 'T'));


   subtype Year_Type is Body_Mks_Type
     with Dimension => (Symbol => 'y',
                        Year   => 1,
                        others => 0);

   subtype Calorie_Type is Body_Mks_Type
   with Dimension => (Symbol   => "cal",
                      Calorie  => 1,
                      others   => 0);

   subtype Mass_Type is Body_Mks_Type
   with Dimension => (Symbol   => "kg",
                      Kilogram => 1,
                      others   => 0);

 subtype Heart_Rate_Type is Body_Mks_Type
   with Dimension => (Symbol   => "bpm",
                      Heart_Rate => 1,
                      others     => 0);

   subtype Minute_Type is Body_Mks_Type
   with Dimension => (Symbol   => "minute",
                      Time     => 1,
                      others   => 0);

   subtype Year_Ratio_Type is Body_Mks_Type
   with Dimension => (Symbol     => "yr",
                      Year       => -1,
                      others     => 0);

   subtype Mass_Ratio_Type is Body_Mks_Type
   with Dimension => (Symbol     => "mr",
                      Kilogram   => -1,
                      others     => 0);

   subtype Heart_Rate_Ratio_Type is Body_Mks_Type
   with Dimension => (Symbol     => "hr",
                      Heart_Rate => -1,
                      others     => 0);

   pragma Warnings (Off, "*assumed to be*");
   y      : constant Year_Type       := 1.0;
   kg     : constant Mass_Type       := 1.0;
   cal    : constant Calorie_Type    := 1.0;
   bpm    : constant Heart_Rate_Type := 1.0;
   minute : constant Minute_Type     := 1.0;
   --
   mr     : constant Mass_Ratio_Type       := 1.0;
   yr     : constant Year_Ratio_Type       := 1.0;
   hr     : constant Heart_Rate_Ratio_Type := 1.0;
   pragma Warnings (On, "*assumed to be*");

   function Total_Men_Calorie_Burned (Year       : Year_Type;
                                      Mass       : Mass_Type;
                                      Heart_Rate : Heart_Rate_Type;
                                      Minutes    : Minute_Type) return Calorie_Type
   is
      Total_Calorie_Burn  : Calorie_Type := 0.0 * cal;
   begin

      if Heart_Rate >= 90.0 * bpm then
         return 0.0 * cal;
      else
         Total_Calorie_Burn :=
           (
            Year * 0.2017 * yr
            - Mass * 0.09036 * mr
            + Heart_Rate * 0.6309 * hr
            - 55.0969
           )
             * Minutes * cal / (4.184 * minute);
      end if;
      return Total_Calorie_Burn;
   end Total_Men_Calorie_Burned;

   Gender : Gender_Type;

begin
   declare
      Age       : Integer := Integer'Value (Get_Line);
      Weight    : Integer := Integer'Value (Get_Line);
      HeartRate : Integer := Integer'Value (Get_Line);
      Time      : Integer := Integer'Value (Get_Line);
      Gender    : Integer := Integer'Value (Get_Line);

   begin

      if Gender = 0 then
--         MenCal(Age,Weight,HeartRate,Time);
         null;
      else
         null;
 --        WomenCal(Age,Weight,HeartRate,Time);
     end if;
   end;
end Workoutmain;
