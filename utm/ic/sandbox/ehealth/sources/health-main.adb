

with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

 --  with Health.Options;
 with    Health.Services;

--  use Health.Options;

procedure Health.Main
is
   Calorie_Burned : Calorie_Type;
   Gender         : constant Gender_Type     := Gender_Type'Value (Get_Line);
   Age            : constant Year_Type       := Year_Type'Value (Get_Line);
   Weight         : constant Mass_Type       := Mass_Type'Value (Get_Line);
   Heart_Rate     : constant Heart_Rate_Type := Heart_Rate_Type'Value( Get_Line);
   Minutes        : constant Minute_Type     := Minute_Type'Value (Get_Line);

begin
   ------------------------------------------------------------------
   -- Comment because im trying to understnt how the analyzer work--
   -----------------------------------------------------------------
--     Options.Initialize;


         Calorie_Burned := Services.Men_Calorie_Burned (Year       => Age,
                                                        Mass       => Weight,
                                                        Heart_Rate => Heart_Rate,
                                                        Minutes    =>  Minutes,
                                                        Gender     => Gender);


         Put_Line ("calories burned : " & Calorie_Type'Image (Calorie_Burned));

exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;
