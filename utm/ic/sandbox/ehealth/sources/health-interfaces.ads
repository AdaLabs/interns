package Health.Interfaces is

   type Human is interface;

   function Name     (H : in Human) return String        is abstract;
   function Age      (H : in Human) return Year_Type     is abstract;
   function Gender   (H : in Human) return Gender_Type   is abstract;
   function Weight   (H : in Human) return Mass_Type     is abstract;
   function Height   (H : in Human) return Height_Type   is abstract;
   function Activity (H : in Human) return Activity_Kind is abstract;

   procedure Set_Height (H      : in out Human;
                         Height : in     Height_Type) is abstract;
 --  procedure Set_Height   (H      : in out Human) is abstract;


end Health.Interfaces;
