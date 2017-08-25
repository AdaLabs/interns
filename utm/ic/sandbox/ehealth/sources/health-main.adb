

with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

with Health.Options,
     Health.Services;

use Health.Options;

procedure Health.Main
is
   Calorie_Burned : Calorie_Type;
begin

   Options.Initialize;


         Calorie_Burned := Services.Men_Calorie_Burned (Year       => Age,
                                                        Mass       => Weight,
                                                        Heart_Rate => Heart_Rate,
                                                        Minutes    => Minutes);


   Put_Line ("calories burned : " & Calorie_Type'Image (Calorie_Burned));
exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;
