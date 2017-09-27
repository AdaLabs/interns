
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
            return M : Classes.Man_Human_Being do
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
      Weight_Six_Month     : Mass_Type;
      Weight_One_Year      : Mass_Type;
   begin
      H.Set_Height   (Height);
      H.Set_Weight   (Weight);
      H.Set_Age      (Age);
      H.Set_Activity (Activity);

      Body_Index     := H.Person_BMI;
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

      Weight_Gain    := H.Project_Weight_Gain * 12.0;
      Ideal_Weight   := H.Ideal_Body_Weight;
      Weight_Loss_Required := H.Weight_Loss_Required;
      Weight_Six_Month     := H.Weight_Loss_Required / 6.0; -- Weight loss permonth to reach in ibw 6month
      Weight_One_Year      := H.Weight_Loss_Required / 12.0; -- Weight loss permonth to reach in ibw 1year

      Put_Line ("Weight gain in 1year: " & Mass_Type'Image(Weight_Gain));
      Put_Line ("Ideal body weight: " & Mass_Type'Image(Ideal_Weight));
      Put_Line ("Amount of weight to be loss: " & Mass_Type'Image(Weight_Loss_Required));
      Put_Line ("Amount of weight loss to reach ideal weight loss in 6 month: " & Mass_Type'Image( Weight_Six_Month));
      Put_Line ("Amount of weight loss to reach ideal weight loss in 1year: " & Mass_Type'Image( Weight_One_Year));

      Create(File => Handler ,
             Mode => Out_File ,
             Name => "result.html");

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
                           ",indexLabelFontSize: 11, indexLabel:'" & Mass_Type'Image (Weight_Six_Month) & "per month' }]}, "));

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
      --      Put_Line ("Carbs: " & Calorie_Type'Image( BMR_Calorie * 0.4));
      --      Put_Line ("Fats: " & Calorie_Type'Image( BMR_Calorie * 0.3));
      --      Put_Line ("Protein: " & Calorie_Type'Image( BMR_Calorie * 0.3));

      Calorie_Burned := H.Person_Calorie_burned;
      Put_Line ("Calorie burn: " & Calorie_Type'Image(Calorie_Burned));
   end;

exception
   when E : others =>
      Put_Line ("(FF)" & Ada.Exceptions.Exception_Information (E));
end Health.Main;

