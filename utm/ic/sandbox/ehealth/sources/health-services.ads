
package Health.Services is





   function Men_Calorie_Burned (Year       : Year_Type;
                                Mass       : Mass_Type;
                                Heart_Rate : Heart_Rate_Type;
                                Minutes    : Minute_Type) return Calorie_Type
     with Pre => Heart_Rate >= 90.0 * bpm;


end Health.Services;
