
package body Index_Check
with SPARK_Mode => On
is


            function sumEmUp(a: Index_Check_Array) return Natural is
                sum: Natural := 0;
            begin
                for i in a'Range loop
                    sum := sum + a(i);
                end loop;
                return sum;
            end sumEmUp;








end Index_Check;
