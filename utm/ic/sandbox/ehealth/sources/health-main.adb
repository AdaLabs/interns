

with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

 --  with Health.Options;
 with    Health.Services;

--  use Health.Options;

procedure Health.Main
is
   Calorie_Burned : Calorie_Type;
   Body_Index     :BMI_Type;

   Gender         : constant Gender_Type     := Gender_Type'Value (Get_Line);
   Age            : constant Year_Type       := Year_Type'Value (Get_Line);
   Weight         : constant Mass_Type       := Mass_Type'Value (Get_Line);
   Heart_Rate     : constant Heart_Rate_Type := Heart_Rate_Type'Value( Get_Line);
   Minutes        : constant Minute_Type     := Minute_Type'Value (Get_Line);
   Height         : constant Height_Type     := Height_Type'Value (Get_Line);

begin
   ------------------------------------------------------------------
   -- Comment because im trying to understnt how the analyzer work--
   -----------------------------------------------------------------
--     Options.Initialize;


         Calorie_Burned := Services.Calorie_Burned (Year       => Age,
                                                        Mass       => Weight,
                                                        Heart_Rate => Heart_Rate,
                                                        Minutes    =>  Minutes,
                                                        Gender     => Gender);


   Put_Line ("calories burned : " & Calorie_Type'Image (Calorie_Burned));



   Body_Index := Services.Body_Mass_Index (Mass   => Weight,
                           Height  => Height);


   Put_Line ("BMI : " & BMI_Type'Image (Body_Index));

exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

