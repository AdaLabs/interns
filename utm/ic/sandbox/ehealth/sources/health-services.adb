package body Health.Services is

   ------------------------
   -- Calorie_Burned --
   ------------------------
   function  Calorie_Burned (Year        : Year_Type;
                             Mass        : Mass_Type;
                             Heart_Rate  : Heart_Rate_Type;
                             Minutes     : Minute_Type;
                             Gender      : Gender_Type) return Calorie_Type
   is
      Calorie_Burned : Calorie_Type := 0.0 * cal;
   begin
      case Gender is
         when Male =>
            Calorie_Burned :=
              (
               Year * 0.2017 * yr
               - Mass * 0.09036 * mr
               + Heart_Rate * 0.6309 * hr
               - 55.0969
              )
                * Minutes * cal / (4.184 * minute);
         when Female =>
            Calorie_Burned :=
              (
               Year * 0.074 * yr
               - Mass * 0.05741 * mr
               + Heart_Rate * 0.4472 * hr
               - 40.4022
              )
                * Minutes * cal / (4.184 * minute);

         when Other =>

            raise Program_Error with "not yet implemented";
      end case;
      return Calorie_Burned;
   end Calorie_Burned;

   ------------------------
   -- BMI-Body Mass Index--
   ------------------------

   function Body_Mass_Index (Mass   : Mass_Type;
                             Height : Height_Type) return BMI_Type
   is
      Body_Index :  BMI_Type := 0.0 * mi;
   begin
      Body_Index :=
        (
         Mass * mr
         / Height**2
         / lr
        ) * mi ;
      return Body_Index;
   end;
   ------------------------------
   -- Basal Metabolice (BMR) --
   ------------------------------
     function  Basal_Metabolic_Rate (Mass   : Mass_Type;
                                     Height : Height_Type;
                                     Year   : Year_Type) return BMR_Type
   is
      Metabolic_Rate : BMR_Type := 0.0 * br;
   begin

      return Metabolic_Rate;
   end;

   ------------------------------------------
   -- Total Daily Energy Expenditure(TDEE) --
   -------------------------------------------

    --  TDEE = BMR * Activity

end Health.Services;
