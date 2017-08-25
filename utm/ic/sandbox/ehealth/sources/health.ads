package Health is

   type Gender_Type is (Male,
                        Female,
                        Other);

   type Body_Mks_Type is new Long_Long_Float
     with
       Dimension_System => ((Unit_Name => Year      , Unit_Symbol => 'y'     , Dim_Symbol => 'Y'),
                            (Unit_Name => Calorie   , Unit_Symbol => "cal"   , Dim_Symbol => 'C'),
                            (Unit_Name => Kilogram  , Unit_Symbol => "kg"    , Dim_Symbol => 'M'),
                            (Unit_Name => Heart_Rate, Unit_Symbol => "bpm"   , Dim_Symbol => 'B'),
                            (Unit_Name => Time      , Unit_Symbol => "minute", Dim_Symbol => 'T'));


   subtype Year_Type is Body_Mks_Type
     with Dimension => (Symbol => 'y',
                        Year   => 1,
                        others => 0);

   subtype Calorie_Type is Body_Mks_Type
   with Dimension => (Symbol   => "cal",
                      Calorie  => 1,
                      others   => 0);

   subtype Mass_Type is Body_Mks_Type
   with Dimension => (Symbol   => "kg",
                      Kilogram => 1,
                      others   => 0);

 subtype Heart_Rate_Type is Body_Mks_Type
   with Dimension => (Symbol   => "bpm",
                      Heart_Rate => 1,
                      others     => 0);

   subtype Minute_Type is Body_Mks_Type
   with Dimension => (Symbol   => "minute",
                      Time     => 1,
                      others   => 0);

   subtype Year_Ratio_Type is Body_Mks_Type
   with Dimension => (Symbol     => "yr",
                      Year       => -1,
                      others     => 0);

   subtype Mass_Ratio_Type is Body_Mks_Type
   with Dimension => (Symbol     => "mr",
                      Kilogram   => -1,
                      others     => 0);

   subtype Heart_Rate_Ratio_Type is Body_Mks_Type
   with Dimension => (Symbol     => "hr",
                      Heart_Rate => -1,
                      others     => 0);

   pragma Warnings (Off, "*assumed to be*");
   y      : constant Year_Type       := 1.0;
   kg     : constant Mass_Type       := 1.0;
   cal    : constant Calorie_Type    := 1.0;
   bpm    : constant Heart_Rate_Type := 1.0;
   minute : constant Minute_Type     := 1.0;
   --
   mr     : constant Mass_Ratio_Type       := 1.0;
   yr     : constant Year_Ratio_Type       := 1.0;
   hr     : constant Heart_Rate_Ratio_Type := 1.0;
   pragma Warnings (On, "*assumed to be*");

end Health;
