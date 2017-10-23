with Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Bounded_Vectors;

package body Vector is


 package Vector_Container_Type is  new Ada.Containers.Bounded_Vectors(Index_Type   => Positive,Element_Type => Unbounded_String );
 subtype Vector_Type is Vector_Container_Type.Vector;

 Vectors: Vector_Type;

begin
 Vectors.Append(To_Unbounded_String("A"));

end Vector;
