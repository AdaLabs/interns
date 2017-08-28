
package Health.Services is

   function  Body_Mass_Index (Mass   : Mass_Type;
                              Height : Height_Type) return BMI_Type;

   function  Basal_Metabolic_Rate (Mass   : Mass_Type;
                                   Height : Height_Type;
                                   Year   : Year_Type) return BMR_Type;

   function Calorie_Burned (Year       : Year_Type;
                            Mass       : Mass_Type;
                            Heart_Rate : Heart_Rate_Type;
                            Minutes    : Minute_Type;
                            Gender     : Gender_Type) return Calorie_Type;
   --  with Pre => Heart_Rate >= 90.0 * bpm;
   --
   --  above commented because of gnat 2014 potential bug
   --
   --  health-services.ads:12:29: both operands for operation ">=" must have same dimensions
   --  health-services.ads:12:29: left operand has dimension [B]
   --  health-services.ads:12:29: right operand is dimensionless









end Health.Services;
