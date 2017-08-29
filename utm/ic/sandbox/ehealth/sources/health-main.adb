
with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

with Health.Options,
     Health.Services;

 use Health.Options;

procedure Health.Main
is
 Calorie_Burned : Calorie_Type;
 Body_Index     : BMI_Type ;
 Daily_Calorie  : Calorie_Type;
 Ideal_Weight : Mass_Type;
begin

  Options.Initialize;

 Calorie_Burned := Services.Calorie_Burned (Year       => Age,
                                            Mass       => Weight,
                                            Heart_Rate => Heart_Rate,
                                            Minutes    =>  Minutes,
                                            Gender     => Gender);

 Put_Line ("calories burned : " & Calorie_Type'Image (Calorie_Burned));

 Body_Index := Services.Body_Mass_Index (Mass   => Weight,
                                         Height => Height);

 Put_Line ("BMI : " & BMI_Type'Image (Body_Index));

 Daily_Calorie := Services.DTEE (Activity => Activity,
                                 Mass     => Weight,
                                 Height   => Height,
                                 Year     => Age,
                                 Gender   => Gender);

 Put_Line ("Daily Calorie Required : " & Calorie_Type'Image (Daily_Calorie));


 Ideal_Weight := Services.Ideal_Body_Weight (Height   => Height,
                                             Gender => Gender);

 Put_Line ("Ideal Weight: " & Mass_Type'Image (Ideal_Weight));

exception
 when E : others =>
  Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

