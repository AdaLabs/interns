
with Ada.Text_IO,
     Ada.Exceptions;

use Ada.Text_IO;

with
--Health.Options,
     Health.Classes,
     Health.Objects;
--use Health.Options;

procedure Health.Main
is

   Gender         : constant Gender_Type     := Gender_Type'Value (Get_Line);
   Age            : constant Year_Type       := Year_Type'Value (Get_Line);
   Weight         : constant Mass_Type       := Mass_Type'Value (Get_Line);
   Heart_Rate     : constant Heart_Rate_Type := Heart_Rate_Type'Value( Get_Line);
   Minutes        : constant Minute_Type     := Minute_Type'Value (Get_Line);
   Height         : constant Height_Type     := Height_Type'Value (Get_Line);
   Activity       : constant Activity_Kind     := Activity_Kind'Value (Get_Line);

   Calorie_Burned         : Calorie_Type;
 Body_Index             : BMI_Type ;
 BMR_Calorie            : Calorie_Type;
 Ideal_Weight           : Mass_Type;
 Weight_Gain            : Mass_Type;
 Handler                : Ada.Text_IO.File_Type;
 M                      : Classes.Male_Human_Being;
 F                      : Classes.Female_Human_Being;


begin

 --  Options.Initialize;

     case Gender is
   when Male =>
   declare
 Weight_Loss_Required    : Mass_Type ;
 Weight_Six_Month        : Mass_Type;
 Weight_One_Year         : Mass_Type;
 Calorie_for_Sendary     : Calorie_Type;
 Calorie_for_Lightly     : Calorie_Type;
 Calorie_for_Moderate    : Calorie_Type;
 Calorie_for_Very_Active : Calorie_Type;
   begin

    M.Set_Height (Height);
    M.Set_Weight (Weight);
    M.Set_Age(Age);
    M.Set_Activity(Activity);

    Calorie_Burned := Objects.Person_Calorie_burned (M);

   Body_Index     := Objects.Person_BMI (M);

   if Body_Index < (18.5 * mi) then
   Put_Line ("Your BMI is: " & Mass_Type'Image(Body_Index) & " you are underweight");
 elsif
   Body_Index > (18.0 * mi) or  Body_Index < (25.0 * mi) then
      Put_Line ("Your BMI is: " & Mass_Type'Image(Body_Index) & " you are Normal weight");
   elsif
   Body_Index > (25.0 * mi) or   Body_Index < (30.0 * mi) then
      Put_Line ("Your BMI is: " & Mass_Type'Image(Body_Index) & " you are Overweight");
   else
      Put_Line ("Your BMI is: " & Mass_Type'Image(Body_Index) & " you are Obese");

   end if;



   Weight_Gain    := Objects.Project_Weight_Gain (M);
   Ideal_Weight   := Objects.Ideal_Body_Weight (M);

   Weight_Loss_Required := Objects.Weight_Loss_Required (M);
   Weight_Six_Month     := Objects.Weight_Loss_Required (M)/6.0; -- Weight loss permonth to reach in ibw 6month
   Weight_One_Year      := Objects.Weight_Loss_Required (M)/12.0; -- Weight loss permonth to reach in ibw 1year

    Put_Line ("Calorie burn: " & Calorie_Type'Image(Calorie_Burned));
  Put_Line ("Weight gain in 1year: " & Mass_Type'Image(Weight_Gain));
  Put_Line ("Ideal body weight: " & Mass_Type'Image(Ideal_Weight));
  Put_Line ("Amount of weight to be loss: " & Mass_Type'Image(Weight_Loss_Required));
  Put_Line ("Amount of weight loss to reach ideal weight loss in 6 month: " & Mass_Type'Image( Weight_Six_Month));
  Put_Line ("Amount of weight loss to reach ideal weight loss in 1year: " & Mass_Type'Image( Weight_One_Year));

   BMR_Calorie := Objects.Total_Daily_Energy_Expenditure (M);

   --  Calorie Required depend on activity level
    Calorie_for_Sendary     := BMR_Calorie * 1.2;
    Calorie_for_Lightly     := BMR_Calorie * 1.375;
    Calorie_for_Moderate    := BMR_Calorie * 1.55;
    Calorie_for_Very_Active := BMR_Calorie * 1.725;

  Put_Line ("Calorie required for little or no exercise, desk job " & Calorie_Type'Image(Calorie_for_Sendary));
  Put_Line ("Calorie required for light exercise or sports 1-3 days/wk " & Calorie_Type'Image(Calorie_for_Lightly));
  Put_Line ("Calorie required for moderate exercise or sports 3-5 days/wk " & Calorie_Type'Image(Calorie_for_Moderate));
  Put_Line ("Calorie required for hard exercise or sports 6-7 days/wk" & Calorie_Type'Image(Calorie_for_Very_Active));

      Create(File => Handler ,
             Mode => Out_File ,
             Name => "result.html");

      Put_Line (File => Handler,
                Item => Begin_Template);

      Put_Line (File => Handler,
                Item => ("{ x: new Date(2017,01,6), y: " & Mass_Type'Image(M.Weight) &
                ", indexLabel:'Start' , indexlabelOrientation:'vertical',indexlabelfontSize:10," &
                " indexLabelFontcolor: 'orangered', markerColor:'orangered' }, "));

      Put_Line (File => Handler,
                Item => ("{ x: new Date(2017, 06, 6) , y: " & Mass_Type'Image (Ideal_Weight) & "}, "));

      Put_Line (File => Handler,
                Item => ("{ x: new Date(2017, 12, 6) , y: " & Mass_Type'Image (Ideal_Weight) &
                          ",indexLabelFontSize: 11, indexLabel:'" & Mass_Type'Image (Weight_Six_Month) & "per month' }]}, "));

            Put_Line (File => Handler,
                Item => Center_Template);

       Put_Line (File => Handler,
                Item => ("{ x: new Date(2017,01,6), y: " & Mass_Type'Image(M.Weight) &
                ", indexLabel:'Start' , indexlabelOrientation:'vertical',indexlabelfontSize:10," &
                " indexLabelFontcolor: 'orangered', markerColor:'orangered' }, "));

      Put_Line (File => Handler,
                Item => ("{ x: new Date(2017, 06, 6) , y: " & Mass_Type'Image (Ideal_Weight) & "}, "));

      Put_Line (File => Handler,
                Item => ("{ x: new Date(2017, 12, 6) , y: " & Mass_Type'Image (Weight_Gain) & " }]} "));


      Put_Line (File => Handler,
                Item => End_Template);
      Close    (File => Handler);

Put_Line ("Amount of kg to reach ideal weight: ");



   end;
      when Female =>
    F.Set_Height (Height);
    F.Set_Weight (Weight);
   when Other =>
    raise Program_Error with "not yet implemented";
  end case;

exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

