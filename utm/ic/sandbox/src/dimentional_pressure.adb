procedure Dimentional_Pressure is

   type Mk_Pressure is new Long_Long_Float
     with
       Dimension_System => ((Unit_Name => Kilogram, Unit_Symbol => "kg", Dim_Symbol => 'K'),
                            (Unit_Name => Second, Unit_Symbol => 's', Dim_Symbol => 'S'),
                            (Unit_Name => Meter, Unit_Symbol => 'm', Dim_Symbol => 'M'),
                            (Unit_Name => Ampere, Unit_Symbol => 'a', Dim_Symbol => 'I'));


   subtype Kilo_Type is Mk_Pressure
   with Dimension =>
       (Symbol   => "kg",
        Kilogram => 1,
        others   => 0);

   subtype Second_Type is Mk_Pressure
     with Dimension =>
       (Symbol   => "s",
        Second   => 1,
               others   => 0);

      subtype Meter_Type is Mk_Pressure
        with Dimension =>
        (Symbol    => "m",
         Meter     => 1,
                others    => 0);

     subtype Amphere_Type is Mk_Pressure
        with Dimension =>
        (Symbol    => "a",
         Ampere     => 1,
                  others    => 0);

   pragma Warnings (Off, "*assumed to be*");

  m   : constant Kilo_Type    := 1.0;
  kg  : constant Kilo_Type    := 1.0;
  s   : constant Second_Type  := 1.0;
  a   : constant Amphere_Type := 1.0;
   pragma Warnings (On, "*assumed to be*");

   subtype Pressure is Mk_Pressure
     with
      Dimension    => ("f/a",
          Meter    => -1,
          Kilogram => 1,
          Second   => -2,
                    others =>   0);



begin
   null;
end;
