with Health.Services;

package body Health.Classes is

 function Name (H : in Human_Being) return String
 is
 begin
  return To_String (H.Name);
 end Name;

 function Age (H : in Human_Being) return Year_Type
 is
 begin
  return (H.Age);
 end Age;

 function Weight (H : in Human_Being) return Mass_Type
 is
 begin
  return H.Weight;
 end Weight;

 function Height (H : in Human_Being) return Height_Type
 is
 begin
  return H.Height;
 end Height;

 function Activity (H : in Human_Being) return Activity_Kind
 is
 begin
  return H.Activity;
 end Activity;

 function Heart_Rate (H : in Human_Being) return Heart_Rate_Type
 is
 begin
  return H.Heart_Rate;
 end Heart_Rate;

 function Minutes (H : in Human_Being) return Minute_Type
 is
 begin
  return H.Min;
 end Minutes;
 ---------------
 -- Set_Height--
 ----------------

 procedure  Set_Height (H      : in out Human_Being;
                        Height : in     Height_Type)
 is
 begin
  H.Height := Height;
 end Set_Height;

 ----------------
 -- Set_Weight---
 ----------------

 procedure  Set_Weight (H      : in out Human_Being;
                        Weight : in     Mass_Type)
 is
 begin
  H.Weight := Weight;
 end Set_Weight;

 ----------------
 -- Set_Age------
 ----------------

 procedure Set_Age (H      : in out Human_Being;
                    Age    : in     Year_Type)
 is
 begin
  H.Age := Age;
 end Set_Age;

 -----------------
 -- Set_Activity--
 -----------------

 procedure Set_Activity (H         : in out Human_Being;
                         Activity  : in     Activity_Kind)
 is
 begin
  H.Activity := Activity;
 end Set_Activity;

 --------------------
 -- Set_heartrate---
 --------------------

 procedure Set_Heart_Rate (H           : in out Human_Being;
                           Heart_Rate  : in     Heart_Rate_Type)
 is
 begin
  H.Heart_Rate := Heart_Rate;
 end Set_Heart_Rate;

 -------------------
 -- Set_Minuites----
 -------------------

 procedure Set_Minuites (H    : in out Human_Being;
                         Min  : in     Minute_Type)
 is
 begin
  H.Min := Min;
 end Set_Minuites;

 ------------------------
 -- Create_Activity ------
 ------------------------

 function Create_Activity (A : Activity_Kind) return Calorie_Type
 is
 begin
  case A is
   when Sedentary =>
    return   1.2 * cal ;
   when Lightly =>
    return   1.375 * cal ;
   when Moderately =>
    return   1.55 * cal ;
   when Very =>
    return   1.725 * cal ;
  end case;
 end Create_Activity;




 --------------------------
 -- Person_Calorie_Burned--
 --------------------------

 function  Person_Calorie_Burned (Person : in Human_Being'Class) return Calorie_Type
 is
  Calorie_Burned       : Calorie_Type := 0.0 * cal;
  Total_Calorie_Burned : Calorie_Type := 0.0 * cal;

 begin
  Calorie_Burned :=  Services.Calorie_Burned (Year       => Person.Age,
                                              Mass       => Person.Weight,
                                              Heart_Rate => Person.Heart_Rate, --  Person.Heart_Rate,
                                              Minutes    => Person.Min, --  Person.Minutes,
                                              Gender     => Person.Gender);

  declare
  Activity_level       : constant Calorie_Type := Create_Activity (Person.Activity);
  begin
   Total_Calorie_Burned := Calorie_Burned * Activity_level * cr;
  end;

  return Total_Calorie_Burned;
 end Person_Calorie_burned;

 --------
 -- BMI_--
 --------

 function  Person_BMI (Person : in Human_Being'Class) return  BMI_Type
 is
  Body_Index : BMI_Type := 0.0 * mi;
 begin

  Body_Index := Services.Body_Mass_Index (Mass   => Person.Weight,
                                          Height => Person.Height);

  return Body_Index;
 end Person_BMI;

 -------------------------
 -- Project_Weight_Gain_--
 -------------------------

 function  Project_Weight_Gain (Person : in Human_Being'Class) return Mass_Type
 is
  Calorie_Consume       : constant Calorie_Type := 2000.0 * cal;
  Daily_Calorie_Intake  :          Calorie_Type := 0.0 * cal;
  Excess_Calorie_Intake :          Calorie_Type := 0.0 * cal;
  Weight_Gain           :          Mass_Type    := 0.0 * kg;
 begin

  Daily_Calorie_Intake := Services.DTEE (Activity => Person.Activity,
                                         Mass     => Person.Weight,
                                         Height   => Person.Height,
                                         Year     => Person.Age,
                                         Gender   => Person.Gender);

  if Calorie_Consume > Daily_Calorie_Intake then
   Excess_Calorie_Intake :=  (Calorie_Consume - Daily_Calorie_Intake) * 365.0;
   Weight_Gain := (Excess_Calorie_Intake / 7700.0 * cr)*kg;

  else
   Excess_Calorie_Intake := (Daily_Calorie_Intake - Calorie_Consume) * 365.0;
   Weight_Gain := (Excess_Calorie_Intake / 7700.0 * cr) * kg;
  end if;

  return Weight_Gain;
 end Project_Weight_Gain;

 ------------------------
 ---Ideal_Body_Weight----
 ------------------------

 function Ideal_Body_Weight (Person : in Human_Being'Class) return Mass_Type
 is
  IBW : Mass_Type := 0.0 * kg;
 begin
  IBW := Services.Ideal_Body_Weight (Height => Person.Height,
                                     Gender => Person.Gender);
  return IBW;
 end Ideal_Body_Weight;

 ------------------------------------------
 -- Total Daily Energy Expenditure(TDEE) --
 ------ TDEE = BMR * Activity--------------
 -------------------------------------------

 function Total_Daily_Energy_Expenditure (Person : in Human_Being'Class) return Calorie_Type
 is
  Mebabolice_Rate : Calorie_Type;
  BMR             : Calorie_Type;
  --   Activity       : Activity_Immutable_Variant_Record (Option => Activies);
 begin
  BMR := Services.BMR (Mass   => Person.Weight,
                       Height => Person.Height,
                       Year   => Person.Age,
                       Gender => Person.Gender);

                         declare
  Activity_level       : constant Calorie_Type := Create_Activity (Person.Activity);
  begin
   Mebabolice_Rate := BMR * Activity_level * cr;
  end;

  return Mebabolice_Rate;
 end  Total_Daily_Energy_Expenditure;

 -----------------------------------
 ------ Person_Ideal_Body_Weight --
 -----------------------------------

 function  Weight_Loss_Required (Person : in Human_Being'Class) return Mass_Type
 is
  Current_weight        : constant Mass_Type := Person.Weight;
  IBW                   :          Mass_Type := 0.0 * kg;
  Excess_Weight_Loss    :          Mass_Type;
 begin
  IBW := Services.Ideal_Body_Weight (Height => Person.Height,
                                     Gender => Person.Gender);
  if Current_weight >= IBW then
   Excess_Weight_Loss  := Current_weight - IBW;
  else
   Excess_Weight_Loss  := IBW - Current_weight;
  end if;

  return Excess_Weight_Loss;
 end Weight_Loss_Required;

end Health.Classes;
