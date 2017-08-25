package body Health.Services is

   ------------------------
   -- Men_Calorie_Burned --
   ------------------------

   function Men_Calorie_Burned (Year       : Year_Type;
                                Mass       : Mass_Type;
                                Heart_Rate : Heart_Rate_Type;
                                Minutes    : Minute_Type) return Calorie_Type
   is
      Calorie_Burned : Calorie_Type := 0.0 * cal;
   begin

      Calorie_Burned :=
        (
         Year * 0.2017 * yr
         - Mass * 0.09036 * mr
         + Heart_Rate * 0.6309 * hr
         - 55.0969
        )
          * Minutes * cal / (4.184 * minute);
      return Calorie_Burned;
   end Men_Calorie_Burned;

end Health.Services;
