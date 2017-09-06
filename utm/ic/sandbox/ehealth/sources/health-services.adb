package body Health.Services is

   -------------------------
   ------ Person_Profil----
   -------------------------
   function Person_Profile (Person : in Interfaces.Human'Class) return Calorie_Type
   is
      Daily_Calorie_Expected : Calorie_Type  := 0.0 * cal;
      Mebabolice_Rate : Calorie_Type := 0.0 * cal;
   begin
   --  Sedentary = BMR X 1.2 (little or no exercise, desk job)
   --  Lightly active = BMR X 1.375 (light exercise or sports 1-3 days/wk)
   --  Moderate active = BMR X 1.55 (moderate exercise or sports 3-5 days/wk)
   --  Very active = BMR X 1.725 (hard exercise or sports 6-7 days/wk)
      Mebabolice_Rate := BMR (Mass   => Person.Weight,
                              Height => Person.Height,
                              Year   => Person.Age,
                              Gender => Person.Gender);

     --  profil = Mebabolice_Rate * activity fatcory
      return Daily_Calorie_Expected;
   end Person_Profile;

   -----------------------------------
   ------ Person_Ideal_Body_Weight --
   -----------------------------------

   function   Person_Ideal_Body_Weight (Person : in Interfaces.Human'Class) return Mass_Type
   is
      IBW              : Mass_Type    := 0.0 * kg;
      Ideal_Mass       : Mass_Type;
      Current_weight   : Mass_Type    := Person.Weight;

   begin
      IBW := Ideal_Body_Weight (Height => Person.Height,
                                Gender => Person.Gender);
      if Current_weight >= IBW then
         Ideal_Mass  := Current_weight - IBW;
      else
         Ideal_Mass  := IBW - Current_weight;
      end if;

      return Ideal_Mass ;
   end Person_Ideal_Body_Weight;

   ------------------------
   ---Ideal_Body_Weight----
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
                             Height * 5.003 * br
                             + Mass * 13.75 * mr
                             - Year * 6.755 * yr
                             + 66.5
                            ) * cal ;

      when Female =>
         Mebabolice_Rate := (
                             Height * 4.7 * br
                             + Mass * 4.35 * mr
                             - Year * 4.7 * yr
                             + 655.1
                            ) * cal ;

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

      when Lightly =>
         Mebabolice_Rate:= BMR (Mass   => Mass,
                                Height => Height,
                                Year   => Year,
                                Gender => Gender);
         Daily_Calorie := Mebabolice_Rate * 1.5;
         when Moderately =>
            raise Program_Error with "not yet implemented";
         when Very =>
            raise Program_Error with "not yet implemented";
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
                          50.0
                          + 0.9 * Height * br - 152.0)
           *( 1.0 * kg);

      when Female =>
         Ideal_Weight := (
                          45.5
                          + 0.9 * Height * br - 152.0)
           *( 1.0 * kg);
      when Other =>
         raise Program_Error with "not yet implemented";

      end case;
      return Ideal_Weight;
   end Ideal_Body_Weight;

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
