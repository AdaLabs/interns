with Ada.Text_IO,
     Ada.Command_Line;

procedure Firstprojectmain is

   use Ada.Text_IO;

   X : Positive := Positive'Value (Get_Line);


     function Fib(Value: Positive) return Positive is
       begin
         if Value <= 2 then
            return 1;
         else
            return Fib(Value-1)+ Fib(Value-2);
         end if;

      end Fib;

begin


        put("Fibonacci:" & Integer'Image(X));
        Put_Line(Integer'Image(Fib(X)));



   null;
end Firstprojectmain;

