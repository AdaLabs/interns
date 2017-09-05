
with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

with Health.Options,
     Health.Classes,
     Health.Services;

use Health.Options;

procedure Health.Main
is
   Calorie_Burned   : Calorie_Type;
   Body_Index       : BMI_Type ;
   Daily_Calorie    : Calorie_Type;
   Ideal_Weight     : Mass_Type;
   Increment_Height : Height_Type := 10.0 * cm;
   Height           : Height_Type := 160.0 * cm;
   Max_Height       : Height_Type := 220.0 * cm;

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

   declare
      Handler : Ada.Text_IO.File_Type;
      M       : Classes.Male_Human_Being;
      F       : Classes.Female_Human_Being;
   begin
      Create(File => Handler ,
             Mode => Out_File ,
             Name => "index.html");

      Put_Line (File => Handler,
                Item => Begin_Template);
      while Height /= Max_Height loop

         M.Set_Height (Height);
         F.Set_Height (Height);
         Ideal_Weight := Services.Ideal_Body_Weight (M);

         Put_Line (File => Handler,
                   Item => ("{ x:" & Height_Type'Image(M.Height) &
                            ", y: " & Mass_Type'Image(Ideal_Weight) & " }, "));

         Height := Height + Increment_Height;
      end loop;
      Put_Line (File => Handler,
                Item => End_Template);
      Close (File => Handler);
   end;



exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

