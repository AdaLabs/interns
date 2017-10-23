with Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Doubly_Linked_Lists;

package body Link_List is

 package List_Container_Type is  new Ada.Containers.Doubly_Linked_Lists(Element_Type => Unbounded_String);
 subtype List_Type is List_Container_Type.List;

 List : List_Type;

begin

 List.Append(To_Unbounded_String("A"));
 List.Append(To_Unbounded_String("B"));
 List.Append(To_Unbounded_String("C"));
 List.Append(To_Unbounded_String("D"));
 List.Append(To_Unbounded_String("E"));


end Link_List;
