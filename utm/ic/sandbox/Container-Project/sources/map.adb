with Ada.Containers;
with Ada.Containers.Bounded_Ordered_Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Map is

type Language_ID is (DE, EL, EN, ES, FR, NL);

 package Map_Container_Type is  new Ada.Containers.Bounded_Ordered_Maps (Key_Type    => Language_ID ,
                                                                      Element_Type => Unbounded_String);
 subtype Map_Type is Map_Container_Type.Map;

 Maps : Map_Type;

begin
 Maps.Insert(Key      => EN,
             New_Item => To_Unbounded_String("A"));

end Map;
