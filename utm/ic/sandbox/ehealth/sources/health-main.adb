
with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

with Health.Options,
  Health.Services;

use Health.Options;

procedure Health.Main
is
   Calorie_Burned : Calorie_Type;
   Body_Index     :BMI_Type;

begin
   pragma Compile_Time_Warning (True, "TECH style clean");
   pragma Compile_Time_Warning (True, "TECH restore option");
   pragma Compile_Time_Warning (True, "FEATURE simulated humans with different activity profiles");
   --  calorie in per day
   --  hour of sport () per week

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

exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

