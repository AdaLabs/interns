with Ada.Text_IO; use Ada.Text_IO;
procedure Workoutmain is



   function MenCal(Age   : Integer; Weight: Integer; HeartRate: Integer; Time: Integer) return Integer
   is
      TotalCalBurn       : Integer := 0;
   begin
      if HeartRate > 90 then
         return 0;
      else

         TotalCalBurn  := TotalCalBurn + Integer'Value(((Age * 0.2017) - (Weight * 0.09036)+(HeartRate * 0.6309)-55.0969) * Time / 4.184);

      end if;

      return TotalCalBurn ;
   end MenCal;



   function WomenCal(Age : Integer; Weight: Integer; HeartRate: Integer; Time: Integer) return Integer is
      TotalCalBurn       : Integer := 0 ;
   begin

      if HeartRate > 90 then
         return 0;
      else
    TotalCalBurn  := TotalCalBurn + Integer'Value(((Age * 0.074) - (Weight * 0.05741)+(HeartRate * 0.4472)-  20.4022) * Time / 4.184);

      end if;

      return TotalCalBurn;
   end WomenCal;

begin
   declare
      Age         : Integer := Integer'Value (Get_Line);
      Weight      : Integer := Integer'Value (Get_Line);
      HeartRate   : Integer := Integer'Value (Get_Line);
      Time        : Integer := Integer'Value (Get_Line);
      Gender      : Integer := Integer'Value (Get_Line);

   begin

      if Gender = 0 then
--         MenCal(Age,Weight,HeartRate,Time);
         null;
      else
         null;
 --        WomenCal(Age,Weight,HeartRate,Time);
     end if;
   end;
end Workoutmain;
