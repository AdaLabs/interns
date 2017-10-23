with Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Multiway_Trees;

package body Tree is

 package Tree_Container_Type is  new Ada.Containers.Multiway_Trees (Element_Type => Unbounded_String);
 subtype Tree_Type is Tree_Container_Type.Tree;

My_Tree : Tree_Type;

begin

My_Tree.Insert_Child(Parent   => To_Unbounded_String("A"),
New_Item => To_Unbounded_String("A1") );



end Tree;
