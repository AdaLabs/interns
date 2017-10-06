
with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

with Health.Options,
     Health.Classes;

use Health.Options;

procedure Health.Main
is
 Calorie_Burned         : Calorie_Type;
 Body_Index             : BMI_Type ;
 BMR_Calorie            : Calorie_Type;
 Ideal_Weight           : Mass_Type;
 Weight_Gain            : Mass_Type;
 Handler                : Ada.Text_IO.File_Type;


 function Create (G : Gender_Type) return Classes.Human_Being'Class
  with Pre => G not in Other
 is
 begin
  case G is
   when Man =>
    return M : Classes.Man_Human_Being do
     null;
    end return;
   when Women =>
    return F : Classes.Women_Human_Being do
     null;
    end return;
   when Other =>
    raise Program_Error with "not supported";
  end case;
 end Create;

begin
 Options.Initialize;

 declare
  H                    : Classes.Human_Being'Class := Create (Gender);
  Weight_Loss_Required : Mass_Type ;
 begin
  H.Set_Height   (Height);
  H.Set_Weight   (Weight);
  H.Set_Age      (Age);
  H.Set_Activity (Activity);
  H.Set_Calorie_Intake (Calorie_Intake);

    Put_Line ("------------Person Profil--------------");

  Ideal_Weight   := H.Ideal_Body_Weight;
  Put_Line ("Ideal body weight: " & Mass_Type'Image(Ideal_Weight));
  Body_Index     := H.Person_BMI;
  Put_Line ("Your BMI is: " & Mass_Type'Image(Body_Index));

  if Body_Index in Under_Weight  then
   Put_Line ("You are under weight");

  elsif
   Body_Index in Over_Weight  then
   Put_Line ("You are over weight");

   Put_Line ("if you continue to consume" & Calorie_Type'Image(Calorie_Intake) & "per day");
   Weight_Gain    := H.Project_Weight_Gain; -- weight  gain in 1 year
   Put_Line ("Your weight in 1 year will be: " & Mass_Type'Image(Weight_Gain + Weight));

   Weight_Loss_Required := H.Weight_Loss_Required ;
   Put_Line ("Weight loss required to reach ideal weight: " & Mass_Type'Image(Weight_Loss_Required));
   Put_Line ("To reach your goal in 6 month you need to loss : " & Mass_Type'Image(Weight_Loss_Required / 6.0) & " per month");
   Put_Line ("To reach your goal in 1 year you need to loss : " & Mass_Type'Image(Weight_Loss_Required / 12.0) & " per month");


  else
   Put_Line ("According to your BMI your Weight is in the normal range you are healthy");
  end if;

  Create(File => Handler ,
         Mode => Out_File ,
         Name => "ui/result.html");

  Put_Line (File => Handler,
            Item => Begin_Template);

  Put_Line (File => Handler,
            Item => ("{ x: new Date(2017,01,6), y: " & Mass_Type'Image(H.Weight) &
                      ", indexLabel:'Start' , indexlabelOrientation:'vertical',indexlabelfontSize:10," &
                      " indexLabelFontcolor: 'orangered', markerColor:'orangered' }, "));

  Put_Line (File => Handler,
            Item => ("{ x: new Date(2017, 06, 6) , y: " & Mass_Type'Image (Ideal_Weight) & "}, "));

  Put_Line (File => Handler,
            Item => ("{ x: new Date(2017, 12, 6) , y: " & Mass_Type'Image (Ideal_Weight) &
                      ",indexLabelFontSize: 11, indexLabel:'" & Mass_Type'Image (Weight_Loss_Required / 6.0) & "per month' }]}, "));

  Put_Line (File => Handler,
            Item => Center_Template);

  Put_Line (File => Handler,
            Item => ("{ x: new Date(2017,01,6), y: " & Mass_Type'Image(H.Weight) &
                      ", indexLabel:'Start' , indexlabelOrientation:'vertical',indexlabelfontSize:10," &
                      " indexLabelFontcolor: 'orangered', markerColor:'orangered' }, "));

  Put_Line (File => Handler,
            Item => ("{ x: new Date(2017, 06, 6) , y: " & Mass_Type'Image (Weight_Gain/2.0) & "}, "));

  Put_Line (File => Handler,
            Item => ("{ x: new Date(2017, 12, 6) , y: " & Mass_Type'Image (Weight_Gain) & " }]} "));

  Put_Line (File => Handler,
            Item => End_Template);
  Close    (File => Handler);

  BMR_Calorie := H.Total_Daily_Energy_Expenditure;
  Put_Line ("Calorie consume/day: " & Calorie_Type'Image(BMR_Calorie));

  Calorie_Burned := H.Person_Calorie_burned;
  Put_Line ("Calorie burn: " & Calorie_Type'Image(Calorie_Burned));
 end;

exception
 when E : others =>
  Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

