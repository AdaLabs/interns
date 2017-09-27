with Ada.Text_IO; use Ada.Text_IO;

package body Health.Options is
   ----------------
   -- Initialize --
   ----------------

   procedure Initialize
   is

      procedure Show_Usage
      is
      begin
         Put_Line("Usage: ./health-main -g Gender -y Age -w Weight -r bpm -m Minutes -c Height -a Activity");
         Put_Line("-g  Men/Women");
         Put_Line("-y  Age of user");
         Put_Line("-w  Weight of user");
         Put_Line("-m  Minuit of workout user done per day");
         Put_Line("-c  Height of user ");
         Put_Line("-a  Activity Level of  user");
      end Show_Usage;

      procedure Check_Present (Option  : Character)
      is
      begin
         if not Analyzer.Is_Present (Option) then
            raise Program_Error with " option " & Option & " is mandatory";
         end if;
      end Check_Present;

   begin

      Show_Usage;

      Check_Present ('g');
      Check_Present ('y');
      Check_Present ('w');
      Check_Present ('r');
      Check_Present ('m');
      Check_Present ('c');
      Check_Present ('a');

      Gender     := Gender_Type'Value (Analyzer.Value (Option            => 'g',
                                                       Explicit_Required => True));

      Age        := Year_Type'Value (Analyzer.Value (Option            => 'y',
                                                     Explicit_Required => True));

      Weight     := Mass_Type'Value (Analyzer.Value (Option            => 'w',
                                                     Explicit_Required => True));

      Heart_Rate := Heart_Rate_Type'Value (Analyzer.Value (Option            => 'r',
                                                           Explicit_Required => True));

      Minutes    := Minute_Type'Value (Analyzer.Value (Option            => 'm',
                                                       Explicit_Required => True));

      Height     := Height_Type'Value (Analyzer.Value (Option            => 'c',
                                                       Explicit_Required => True));

      Activity   := Activity_Kind'Value (Analyzer.Value (Option            => 'a',
                                                         Explicit_Required => True));
   end Initialize;

end Health.Options;
