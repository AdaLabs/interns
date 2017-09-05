package Health is


   type Gender_Type is (Male,
                        Female,
                        Other);

   type Activity_Kind  is (Sedentary,
                           Active);

   type Body_Mks_Type is new Float
     with
       Dimension_System => ((Unit_Name => Year      , Unit_Symbol => 'y'     , Dim_Symbol => 'Y'),
                            (Unit_Name => Kilogram  , Unit_Symbol => "kg"    , Dim_Symbol => 'M'),
                            (Unit_Name => Heart_Rate, Unit_Symbol => "bpm"   , Dim_Symbol => 'B'),
                            (Unit_Name => Time      , Unit_Symbol => "minute", Dim_Symbol => 'T'),
                            (Unit_Name => Height    , Unit_Symbol => "cm"    , Dim_Symbol => 'H'),
                        (Unit_Name => Calorie   , Unit_Symbol => "cal"   , Dim_Symbol => 'C'),
                        (Unit_Name => BMI       , Unit_Symbol => "mi"    , Dim_Symbol => 'I'));

 subtype Year_Type is Body_Mks_Type
  with Dimension => (Symbol => 'y',
                     Year   => 1,
                     others => 0);

 subtype Calorie_Type is Body_Mks_Type
  with Dimension => (Symbol  => "cal",
                     Calorie => 1,
                     others  => 0);

 subtype Mass_Type is Body_Mks_Type
  with Dimension => (Symbol   => "kg",
                     Kilogram => 1,
                     others   => 0);

 subtype Heart_Rate_Type is Body_Mks_Type
  with Dimension => (Symbol     => "bpm",
                     Heart_Rate => 1,
                     others     => 0);

 subtype Minute_Type is Body_Mks_Type
  with Dimension => (Symbol => "minute",
                     Time   => 1,
                     others => 0);

 subtype Height_Type is Body_Mks_Type
  with Dimension => (Symbol => "cm",
                     Height => 1,
                     others => 0);

 subtype BMI_Type is Body_Mks_Type
  with Dimension => (Symbol => "mi",
                     BMI    => 1,
                     others => 0);

 subtype Year_Ratio_Type is Body_Mks_Type
  with Dimension => (Symbol => "yr",
                     Year   => -1,
                     others => 0);

 subtype Mass_Ratio_Type is Body_Mks_Type
  with Dimension => (Symbol   => "mr",
                     Kilogram => -1,
                     others   => 0);

 subtype Heart_Rate_Ratio_Type is Body_Mks_Type
  with Dimension => (Symbol     => "hr",
                     Heart_Rate => -1,
                     others     => 0);

 subtype Height_Ratio_Type is Body_Mks_Type
  with Dimension => (Symbol => "lr",
                     Height => -2,
                     others => 0);

 subtype BMR_Height_Ratio_Type is Body_Mks_Type
  with Dimension => (Symbol => "br",
                     Height => -1,
                     others => 0);

 subtype Calorie_Ratio_Type is Body_Mks_Type
  with Dimension => (Symbol => "cr",
                     Calorie => -1,
                     others => 0);

 pragma Warnings (Off, "*assumed to be*");
 y      : constant Year_Type       := 1.0;
 kg     : constant Mass_Type       := 1.0;
 cal    : constant Calorie_Type    := 1.0;
 bpm    : constant Heart_Rate_Type := 1.0;
 minute : constant Minute_Type     := 1.0;
 cm     : constant Height_Type     := 1.0;
 mi     : constant BMI_Type        := 1.0;
 --
 mr     : constant Mass_Ratio_Type       := 1.0;
 yr     : constant Year_Ratio_Type       := 1.0;
 hr     : constant Heart_Rate_Ratio_Type := 1.0;
 lr     : constant Height_Ratio_Type     := 1.0;
 br     : constant BMR_Height_Ratio_Type := 1.0;
 cr     : constant Calorie_Ratio_Type    := 1.0;
 pragma Warnings (On, "*assumed to be*");


   Begin_Template : constant String :=
                      "<html>" &
                      "<head> " &
                      "<script type='text/javascript' src='https://canvasjs.com/assets/script/jquery-1.11.1.min.js'></script> " &
                      "<script type='text/javascript' src='https://canvasjs.com/assets/script/canvasjs.min.js'> </script> " &
                      "<script>window.onload = function () {var chart = new CanvasJS.Chart('chartContainer', " &
                      "{title: {text: 'Ideal Body Weight'},axisX:{minimum: 158,maximum: 220},data: [{type: 'spline',dataPoints: [ " ;


   End_Template : constant String := "]}]}); chart.render(); " &
                    "var record = false;var precisionLevel = 1;var xValue, yValue, parentOffset, relX, relY;" &
                    "var selected;var timerId = null;}</script> </head><body><br/>" &
                    "<div id='chartContainer' style='height: 500px; width: 80%;'></div></body></html>";



end Health;
