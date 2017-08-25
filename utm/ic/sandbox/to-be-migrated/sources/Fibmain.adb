with Ada.Text_IO,
     Ada.Command_Line;

procedure Main
is
   use Ada.Text_IO;

begin
    Input := Input'Value(Ada.Command_Line.Argument(1));

      function Fib(Value: Input) return Input is

       begin
         if Value <= 2 then
            return 1;
         else
            return Fib(Value -1)+ Fib(Value +2);
         end if;

      end Fib;

      begin
         put("Fibonacci:" & Integer'Image(Input));
         Put_Line(Integer'Image(Fib(Input)));


   end;
end Main;
