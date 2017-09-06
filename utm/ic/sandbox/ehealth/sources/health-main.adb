
with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

with Health.Options,
     Health.Classes,
     Health.Services;

use Health.Options;

procedure Health.Main
is
   Calorie_Burned         : Calorie_Type;
   Body_Index             : BMI_Type ;
   Daily_Calorie          : Calorie_Type;
   Ideal_Weight           : Mass_Type;
   Handler                : Ada.Text_IO.File_Type;
   M                      : Classes.Male_Human_Being;
   F                      : Classes.Female_Human_Being;


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
      Increment_Height           : Height_Type := 10.0 * cm;
      Min_Height                 : Height_Type := 160.0 * cm;
      Max_Height                 : Height_Type := 220.0 * cm;
   begin
      Create(File => Handler ,
             Mode => Out_File ,
             Name => "index.html");

      Put_Line (File => Handler,
                Item => Begin_Template);
      while Min_Height /= Max_Height loop

         M.Set_Height (Min_Height);
         F.Set_Height (Min_Height);
         Ideal_Weight := Services.Ideal_Body_Weight (M);

         Put_Line (File => Handler,
                   Item => ("{ x:" & Height_Type'Image(M.Height) &
                            ", y: " & Mass_Type'Image(Ideal_Weight) & " }, "));

         Min_Height := Min_Height + Increment_Height;
      end loop;
      Put_Line (File => Handler,
                Item => End_Template);
      Close    (File => Handler);
   end;

   declare
      Ideal_Mass             : Mass_Type ;
      Six_Month              : Mass_Type;
      One_Year               : Mass_Type;
   begin
      M.Set_Height (Height);
      M.Set_Weight (Weight);

      Ideal_Mass   := Services.Person_Ideal_Body_Weight (M);
      Six_Month    := Services.Person_Ideal_Body_Weight (M)/6.0;
      One_Year     := Services.Person_Ideal_Body_Weight (M)/12.0;
      Ideal_Weight := Services.Ideal_Body_Weight (M);

      Create(File => Handler ,
             Mode => Out_File ,
             Name => "target_ideal_weight.html");

      Put_Line (File => Handler,
                Item => Begin_Template);
      Put_Line (File => Handler,
                Item => ("{ x: 0, y: " & Mass_Type'Image(M.Weight) & " }, "));
         Put_Line (File => Handler,
                Item => ("{ x: 6 , y: " & Mass_Type'Image (Ideal_Weight) & " }]}, "));
      Put_Line (File => Handler,
                Item => ("{ type:'spline', dataPoints: [ { x: 0, y: " & Mass_Type'Image(M.Weight) & " },{x: 12 , y: " & Mass_Type'Image (Ideal_Weight) & " }, "));

      Put_Line (File => Handler,
                Item => End_Template);
      Close    (File => Handler);

      Put_Line ("Current Weight: " & Mass_Type'Image (M.Weight));
      Put_Line ("Ideal Weight: " & Mass_Type'Image (Ideal_Weight));
      Put_Line ("Amount of kg to reach ideal weight: " & Mass_Type'Image (Ideal_Mass ));
      Put_Line ("To reach Ideal weight in 6 Month : " & Mass_Type'Image (Six_Month));
      Put_Line("To reach Ideal weight in 1 year :" & Mass_Type'Image (One_Year));

   end;

exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

