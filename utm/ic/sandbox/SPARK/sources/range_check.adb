package body Range_Check
with SPARK_Mode => On
is


 --     i : Number := 16;

  procedure Print_and_Increment (j: in out Number) is

    function Next (k: in Number) return Number is
    begin
      return k + 1;
    end Next;

  begin
    j := Next (j);
  end Print_and_Increment;

begin

 --    Print_and_Increment (i);


null;
end Range_Check;
