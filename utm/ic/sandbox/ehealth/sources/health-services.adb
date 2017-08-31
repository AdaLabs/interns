package body Health.Services is

 ------------------------
 -- Ideal_Body_Weight ------
 ------------------------

 function Ideal_Body_Weight (Person : in Interfaces.Human'Class) return Mass_Type
 is
  IBW : Mass_Type := 0.0 * kg;
 begin
  IBW := Ideal_Body_Weight (Height => Person.Height,
                            Gender => Person.Gender);
  return IBW;
 end Ideal_Body_Weight;

 ------------------------
 -- Calorie_Burned ------
 ------------------------

 function  Calorie_Burned (Year       : Year_Type;
                           Mass       : Mass_Type;
                           Heart_Rate : Heart_Rate_Type;
                           Minutes    : Minute_Type;
                           Gender     : Gender_Type) return Calorie_Type
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
  Body_Index : BMI_Type := 0.0 * mi;
 begin
  Body_Index :=
   (
    Mass * mr
    / Height**2
    / lr
   ) * mi ;
  return Body_Index;
 end Body_Mass_Index;
 ----------------
 ------BMR -----
 ----------------

 function   BMR (Mass   : Mass_Type;
                 Height : Height_Type;
                 Year   : Year_Type;
                 Gender : Gender_Type) return Calorie_Type
 is

  Mebabolice_Rate : Calorie_Type := 0.0 * cal;
 begin
  case Gender is
   when Male =>
    Mebabolice_Rate := (
                        Height * 6.25 * br
                        + Mass * 9.99 * mr
                        - Year * 4.92 * yr
                        + 5.0
                       ) * cal ;

   when Female =>
    raise Program_Error with "not yet implemented";

   when Other =>
    raise Program_Error with "not yet implemented";
  end case;

  return Mebabolice_Rate;
 end  BMR;
 ------------------------------------------
 -- Total Daily Energy Expenditure(TDEE) --
 ------ TDEE = BMR * Activity-----------
 -------------------------------------------

 function   DTEE (Activity : Activity_Kind;
                  Mass     : Mass_Type;
                  Height   : Height_Type;
                  Year     : Year_Type;
                  Gender   : Gender_Type) return Calorie_Type
 is
  Daily_Calorie   : Calorie_Type := 0.0 * cal;
  Mebabolice_Rate : Calorie_Type;
 begin

  case  Activity is
   when Sedentary =>
    Mebabolice_Rate:= BMR (Mass   => Mass,
                           Height => Height,
                           Year   => Year,
                           Gender => Gender);
    Daily_Calorie := Mebabolice_Rate * 1.2;

   when Active =>
    Mebabolice_Rate:= BMR (Mass   => Mass,
                           Height => Height,
                           Year   => Year,
                           Gender => Gender);
    Daily_Calorie := Mebabolice_Rate * 1.5;
  end case;
  return Daily_Calorie;
 end  DTEE;
 -----------------------------------
 ------ Ideal Bocy Weight-----------
 ------------------------------------

 function   Ideal_Body_Weight (Height : Height_Type;
                               Gender : Gender_Type) return Mass_Type
 is
  Ideal_Weight : Mass_Type := 0.0 * kg;
 begin
  case Gender is
   when Male =>
    Ideal_Weight := (
                     Height * br - 100.0
                     - Height * br - 100.0
                    )*( 0.1 * kg);

   when Female =>
    raise Program_Error with "not yet implemented";
    --  Women: Ideal Body Weight (kg) = [Height (cm) - 100] + ([Height (cm) - 100] x 15%)

   when Other =>
    raise Program_Error with "not yet implemented";

  end case;
  return Ideal_Weight;
 end Ideal_Body_Weight;

 -----------------------------------
 ------ Calorie Deficiency ---------
 -----------------------------------

 pragma Compile_Time_Warning (True, "Calculate calorie deficient required to reach ideal weight");

 --  function   Calorie_Defiency (Mass   : Mass_Type;
 --                            Height : Height_Type;
 --                           Gender : Gender_Type) return Calorie_Type
 --  is
 --  Ideal_weight  : Mass_Type;
 --  Weight_Loss   : Mass_Type;
 --  begin
 --  1kg = 7700 cal
 --   Weight_Loss = Current_weight - Ideal_weight
 --    Convert Weight_Loss in calorie
 --     calcuate calorie defficiency in 6month or 1year
 --  return 0.0 * cal ;
 --  null;
 --  end Calorie_Defiency;

 -----------------------------------
 ------ Projected_WEight ---------
 -----------------------------------
 pragma Compile_Time_Warning (True, "find weight in 1 year if consume more that TDEE");
 function   Projected_Weight (Activity : Activity_Kind;
                              Mass     : Mass_Type;
                              Height   : Height_Type;
                              Year     : Year_Type;
                              Gender   : Gender_Type) return Mass_Type
 is

  Daily_Calorie         : Calorie_Type := 0.0 * cal;
  Total_Calorie_surplus : Calorie_Type := 0.0 * cal;
  Total_Kilo_Gain       : Mass_Type    := 0.0 * kg;
 begin

  Daily_Calorie := DTEE (Activity => Activity,
                         Mass     => Mass,
                         Height   => Height,
                         Year     => Year,
                         Gender   => Gender);

 --  Total_Calorie_surplus := (Calorie_consume - Daily_Calorie) * 365 * cr;

  Total_Kilo_Gain       := (
                            Total_Calorie_surplus * cr
                            / 7700.0) * kg ;


--  1kilo = 7700;
        return Total_Kilo_Gain;
 end  Projected_Weight;


end Health.Services;
