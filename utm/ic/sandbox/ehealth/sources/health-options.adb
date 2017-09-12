
package body Health.Options is

 ----------------
 -- Initialize --
 ----------------

 procedure Initialize is

  procedure Check_Present (Option  : Character)
  is
  begin
   if not Analyzer.Is_Present (Option) then
    raise Program_Error with " option " & Option & " is mandatory";
   end if;
  end Check_Present;

 begin
--    pragma Compile_Time_Warning (True, "FEATURE show usage on error");
--    pragma Compile_Time_Warning (True, "FEATURE show help");
--    pragma Compile_Time_Warning (True, "FEATURE show version");


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
