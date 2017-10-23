with Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Sets;

package body Set is

 package Set_Container_Type is  new Ada.Containers.Ordered_Sets(Element_Type => Unbounded_String);
 subtype Set_Type is Set_Container_Type.Set;

 Sets: Set_Type;

begin
Sets.Insert(New_Item =>To_Unbounded_String("A"));

end Set;
