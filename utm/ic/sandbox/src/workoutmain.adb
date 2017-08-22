with Ada.Text_IO; use Ada.Text_IO;
procedure Workoutmain is

   type Body_Mks_Type is new Long_Long_Float
     with
       Dimension_System => ((Unit_Name => Year, Unit_Symbol => 'y', Dim_Symbol => 'Y'),
                            (Unit_Name => Calorie, Unit_Symbol => "cal", Dim_Symbol => 'C'),
                            (Unit_Name => Kilogram, Unit_Symbol => "kg", Dim_Symbol => 'M'));


   subtype Age_Type is Body_Mks_Type
   with Dimension =>
     (Symbol => 'y',
      Year   => 1,
      others => 0);

   subtype Calorie_Type is Body_Mks_Type
   with Dimension =>
     (Symbol   => "cal",
      Calorie => 1,
      others   => 0);

   subtype Mass_Type is Body_Mks_Type
   with Dimension =>
     (Symbol   => "kg",
      Kilogram => 1,
      others   => 0);


--     subtype Weight_Type is Body_Mks_Type;
--     subtype Heart_Rate_Type is Body_Mks_Type;
--     subtype Time_Type is Body_Mks_Type;
--     subtype Calorie_Type is Body_Mks_Type;
--
   y   : constant Age_Type     := 1.0;
   kg  : constant Mass_Type    := 1.0;
   cal : constant Calorie_Type := 1.0;

--     subtype Age_Type is Float;
   subtype Weight_Type is Float;
   subtype Heart_Rate_Type is Float;
   subtype Time_Type is Float;
--     subtype Calorie_Type is Float;


   function Total_Men_Calorie_Burned (Age        : Age_Type;
                                      Weight     : Weight_Type;
                                      Heart_Rate : Heart_Rate_Type;
                                      Time       : Time_Type) return Calorie_Type
   is
      Total_Calorie_Burn  : Calorie_Type := 0.0 * cal;
   begin
      if Heart_Rate >= 90.0 then
         return 0.0 * cal;
      else
         Total_Calorie_Burn  := Total_Calorie_Burn +
           Float(((Age * y * 0.2017) - (Weight * kg * 0.09036)+(Heart_Rate * bpm * 0.6309)-55.0969) * Time * minute / 4.184);

      end if;

      return Total_Calorie_Burn ;
   end Total_Men_Calorie_Burned;


--
--     function Women_Calculation (Age : Age_Type ; Weight:Weight_Type ; Heart_Rate : Heart_Rate_Type ; Time: Time_Type) return Total_Calorie_Burn_Type
--      Total_Calorie_Burn  : Total_Calorie_Burn_Type := 0.0;
--     begin
--
--        if Heart_Rate > 90.0 then
--           return 0.0;
--        else
--      Total_Calorie_Burn  := Total_Calorie_Burn + Float(((Age * 0.074) - (Weight * 0.05741)+(HeartRate * 0.4472)-  20.4022) * Time / 4.184);
--
--        end if;
--
--        return Total_Calorie_Burn;
--     end Women_Calculation;

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
