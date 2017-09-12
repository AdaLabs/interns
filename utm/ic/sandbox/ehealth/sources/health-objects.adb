with Health.Services;

package body Health.Objects is

 -------------------------
 -- Personcalorie butn_---
 -------------------------

 function  Person_Calorie_burned (Person : in Interfaces.Human'Class) return Calorie_Type
 is
  Calorie_Burned : Calorie_Type := 0.0 * cal;
 begin

--    Calorie_Burned :=  Services.Calorie_Burned(Year       => Person.Age,
--                                      Mass       => Person.Weight,
--                                      Heart_Rate => Person.Heart_Rate,
--                                      Minutes    =>  Person.Minutes,
--                                      Gender     => Person.Gender);

  return Calorie_Burned;
 end Person_Calorie_burned;


 --------
 -- BMI_--
 --------
 function  Person_BMI (Person : in Interfaces.Human'Class) return  BMI_Type
 is
   Body_Index : BMI_Type := 0.0 * mi;
   begin

  Body_Index := Services.Body_Mass_Index (Mass   => Person.Weight,
                                 Height => Person.Height);
  return Body_Index;
 end Person_BMI;



 -------------------------
 ------ Project_Weight_Gain_----
 -------------------------
 function  Project_Weight_Gain (Person : in Interfaces.Human'Class) return Mass_Type
 is
 Calorie_Consume       : constant Calorie_Type  := 2000.0 * cal;
  Daily_Calorie_Intake  : Calorie_Type  := 0.0 * cal;
  Excess_Calorie_Intake : Calorie_Type  := 0.0 * cal;
  Weight_Gain           : Mass_Type     := 0.0 * kg;
 begin

  Daily_Calorie_Intake := Services.DTEE (Activity => Person.Activity,
                                Mass     => Person.Weight,
                                Height   => Person.Height,
                                Year     => Person.Age,
                                Gender   => Person.Gender);

    if Calorie_Consume > Daily_Calorie_Intake then
     Excess_Calorie_Intake :=  (Calorie_Consume - Daily_Calorie_Intake) * 365.0;
       Weight_Gain := (Excess_Calorie_Intake/7700.0 * cr)*kg;

    else
     Excess_Calorie_Intake := (Daily_Calorie_Intake - Calorie_Consume) * 365.0;
      Weight_Gain := (Excess_Calorie_Intake/7700.0 * cr) * kg;
    end if;

  return Weight_Gain;
 end Project_Weight_Gain;

 ------------------------
 ---Ideal_Body_Weight----
 ------------------------

 function Ideal_Body_Weight (Person : in Interfaces.Human'Class) return Mass_Type
 is
  IBW : Mass_Type := 0.0 * kg;
 begin
  IBW := Services.Ideal_Body_Weight (Height => Person.Height,
                            Gender => Person.Gender);
  return IBW;
 end Ideal_Body_Weight;

 ------------------------------------------
 -- Total Daily Energy Expenditure(TDEE) --
 ------ TDEE = BMR * Activity-----------
 -------------------------------------------
 function   Total_Daily_Energy_Expenditure (Person : in Interfaces.Human'Class) return Calorie_Type
 is

  Mebabolice_Rate : Calorie_Type;
 begin


  Mebabolice_Rate:= Services.BMR (Mass   => Person.Weight,
                         Height => Person.Height,
                         Year   => Person.Age,
                         Gender => Person.Gender);


  --  Sedentary = BMR X 1.2 (little or no exercise, desk job)
  --  Lightly active = BMR X 1.375 (light exercise or sports 1-3 days/wk)
  --  Moderate active = BMR X 1.55 (moderate exercise or sports 3-5 days/wk)
  --  Very active = BMR X 1.725 (hard exercise or sports 6-7 days/wk)
  return Mebabolice_Rate;
 end  Total_Daily_Energy_Expenditure;
 -----------------------------------
 ------ Person_Ideal_Body_Weight --
 -----------------------------------

 function  Weight_Loss_Required (Person : in Interfaces.Human'Class) return Mass_Type
 is
  IBW              : Mass_Type    := 0.0 * kg;
  Excess_Weight_Loss    : Mass_Type;
  Current_weight   : constant Mass_Type    := Person.Weight;

 begin
  IBW := Services.Ideal_Body_Weight (Height => Person.Height,
                            Gender => Person.Gender);
  if Current_weight >= IBW then
   Excess_Weight_Loss  := Current_weight - IBW;
  else
   Excess_Weight_Loss  := IBW - Current_weight;
  end if;

  return Excess_Weight_Loss ;
 end Weight_Loss_Required;
end Health.Objects;
