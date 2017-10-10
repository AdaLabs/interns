with Ada.Text_IO,
     Division_Check;

 use Ada.Text_IO,
    Division_Check;

procedure Division_Check.Main is
Division_Total : Float;
begin

Division_Total := Division_Checking(ValueA => 1.0,ValueB => 0.0);
Put_Line("Division" & Division_Total'Image);

end Division_Check.Main;
