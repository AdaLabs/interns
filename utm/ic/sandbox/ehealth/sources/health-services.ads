
package Health.Services is



   function  Body_Mass_Index (Mass   : Mass_Type;
                           Height : Height_Type) return BMI_Type ;


   function Calorie_Burned (Year       : Year_Type;
                                Mass       : Mass_Type;
                                Heart_Rate : Heart_Rate_Type;
                                Minutes    : Minute_Type;
                                Gender     : Gender_Type) return Calorie_Type
     with Pre => Heart_Rate >= 90.0 * bpm;









end Health.Services;
