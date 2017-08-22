with Ada.Text_IO,
     Ada.Numerics,
     Ada.Numerics.Discrete_Random;
use Ada.Text_IO;



procedure  Generics_Operation is
   subtype Dice is Integer range 0 .. 6;
   package ranges is new Ada.Numerics.Discrete_Random (Result_Subtype => Dice);

begin
   declare
      seed: ranges.Generator;
   begin

      for I in seed'Range  loop
         Ada.Numerics.Discrete_Random.Random(I);

         end loop;


   end;




   null;
end Generics_Operation;
