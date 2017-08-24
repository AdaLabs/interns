procedure Dimentional_Currency is

   type Currency is new Float
     with
       Dimension_System => ((Unit_Name => Euro, Unit_Symbol => 'eu', Dim_Symbol => 'E'),
                            (Unit_Name => Rupee, Unit_Symbol => 'rs', Dim_Symbol => 'R'));




begin

   end;
